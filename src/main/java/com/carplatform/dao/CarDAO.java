package com.carplatform.dao;

import com.carplatform.model.*;
import com.carplatform.util.FileHandler;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class CarDAO {

    private static final String FILE_PATH = "c:/Users/aruno/Desktop/untitled/src/main/webapp/WEB-INF/data/cars.txt";

    public List<Car> getAllCars() {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<Car> cars = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.trim().isEmpty()) continue;
            String[] parts = line.split("\\|");
            if (parts.length < 16) continue;
            {
                String carId = safeGet(parts, 0);
                String sellerId = safeGet(parts, 1);
                String brand = safeGet(parts, 2);
                String model = safeGet(parts, 3);
                int year = safeGetInt(parts, 4, 2020);
                double price = safeGetDouble(parts, 5, 0.0);
                double mileage = safeGetDouble(parts, 6, 0.0);
                String fuelType = safeGet(parts, 7);
                String transmission = safeGet(parts, 8);
                String location = safeGet(parts, 9);
                String condition = safeGet(parts, 10);
                String description = safeGet(parts, 11);
                String imagePath = safeGet(parts, 12);
                String carStatus = safeGet(parts, 13);
                String approvalStatus = safeGet(parts, 14);
                String createdAt = safeGet(parts, 15);

                Car car = createCarInstance(fuelType);
                car.setCarId(carId);
                car.setSellerId(sellerId);
                car.setBrand(brand);
                car.setModel(model);
                car.setYear(year);
                car.setPrice(price);
                car.setMileage(mileage);
                car.setFuelType(fuelType);
                car.setTransmission(transmission);
                car.setLocation(location);
                car.setCondition(condition);
                car.setDescription(description);
                car.setImagePath(imagePath);
                car.setCarStatus(carStatus);
                car.setApprovalStatus(approvalStatus);
                car.setCreatedAt(createdAt);

                cars.add(car);
            }
        }
        return cars;
    }

    public Car getCarById(String carId) {
        if (carId == null) return null;
        for (Car car : getAllCars()) {
            if (carId.equalsIgnoreCase(car.getCarId())) {
                return car;
            }
        }
        return null;
    }

    public List<Car> getCarsBySellerId(String sellerId) {
        List<Car> list = new ArrayList<>();
        if (sellerId == null) return list;
        for (Car car : getAllCars()) {
            if (sellerId.equalsIgnoreCase(car.getSellerId())) {
                list.add(car);
            }
        }
        return list;
    }

    public List<Car> getApprovedAvailableCars() {
        List<Car> list = new ArrayList<>();
        for (Car car : getAllCars()) {
            if ("AVAILABLE".equalsIgnoreCase(car.getCarStatus()) && "APPROVED".equalsIgnoreCase(car.getApprovalStatus())) {
                list.add(car);
            }
        }
        return list;
    }

    public List<Car> getPendingCars() {
        List<Car> list = new ArrayList<>();
        for (Car car : getAllCars()) {
            if ("PENDING".equalsIgnoreCase(car.getApprovalStatus())) {
                list.add(car);
            }
        }
        return list;
    }

    public void saveCar(Car car) {
        if (car == null) return;
        FileHandler.writeLine(FILE_PATH, car.toFileString());
    }

    public void updateCar(Car updatedCar) {
        if (updatedCar == null || updatedCar.getCarId() == null) return;
        List<Car> cars = getAllCars();
        List<String> newLines = new ArrayList<>();
        for (Car car : cars) {
            if (car.getCarId().equalsIgnoreCase(updatedCar.getCarId())) {
                newLines.add(updatedCar.toFileString());
            } else {
                newLines.add(car.toFileString());
            }
        }
        FileHandler.overwriteFile(FILE_PATH, newLines);
    }

    public void deleteCar(String carId) {
        if (carId == null) return;
        List<Car> cars = getAllCars();
        List<String> newLines = new ArrayList<>();
        for (Car car : cars) {
            if (!car.getCarId().equalsIgnoreCase(carId)) {
                newLines.add(car.toFileString());
            }
        }
        FileHandler.overwriteFile(FILE_PATH, newLines);
    }

    private Car createCarInstance(String fuelType) {
        return new Car();
    }

    private String safeGet(String[] parts, int index) {
        return index < parts.length ? parts[index].trim() : "";
    }

    private int safeGetInt(String[] parts, int index, int defaultVal) {
        String val = safeGet(parts, index);
        try {
            return val.isEmpty() ? defaultVal : Integer.parseInt(val);
        } catch (NumberFormatException e) {
            return defaultVal;
        }
    }

    private double safeGetDouble(String[] parts, int index, double defaultVal) {
        String val = safeGet(parts, index);
        try {
            return val.isEmpty() ? defaultVal : Double.parseDouble(val.replace(",", "."));
        } catch (NumberFormatException e) {
            return defaultVal;
        }
    }

    public void approveCar(String carId) {
        Car car = getCarById(carId);
        if (car != null) {
            car.setApprovalStatus("APPROVED");
            updateCar(car);
        }
    }

    public void rejectCar(String carId) {
        Car car = getCarById(carId);
        if (car != null) {
            car.setApprovalStatus("REJECTED");
            updateCar(car);
        }
    }

    public void markCarAsSold(String carId) {
        Car car = getCarById(carId);
        if (car != null) {
            car.setCarStatus("SOLD");
            updateCar(car);
        }
    }

    public int getTotalCars() {
        return getAllCars().size();
    }

    public int getPendingCarsCount() {
        return getPendingCars().size();
    }

    public int getApprovedCarsCount() {
        int count = 0;
        for (Car car : getAllCars()) {
            if ("APPROVED".equalsIgnoreCase(car.getApprovalStatus())) count++;
        }
        return count;
    }

    public int getAvailableCarsCount() {
        int count = 0;
        for (Car car : getAllCars()) {
            if ("AVAILABLE".equalsIgnoreCase(car.getCarStatus())) count++;
        }
        return count;
    }

    public int getSoldCarsCount() {
        int count = 0;
        for (Car car : getAllCars()) {
            if ("SOLD".equalsIgnoreCase(car.getCarStatus())) count++;
        }
        return count;
    }
}
