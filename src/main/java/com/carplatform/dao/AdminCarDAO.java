package com.carplatform.dao;

import com.carplatform.model.AdminCarRecord;
import com.carplatform.util.FileHandler;
import java.util.ArrayList;
import java.util.List;

public class AdminCarDAO {
    private final String CARS_FILE;

    public AdminCarDAO(String basePath) {
        CARS_FILE = basePath + "/cars.txt";
    }

    public List<AdminCarRecord> getAllCars() {
        List<AdminCarRecord> cars = new ArrayList<>();
        for (String line : FileHandler.readLines(CARS_FILE)) {
            String[] p = line.split("\\|");
            if (p.length >= 16) {
                cars.add(new AdminCarRecord(p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7], p[8], p[9], p[13], p[14], p[15]));
            }
        }
        return cars;
    }

    public AdminCarRecord getCarById(String carId) {
        for (AdminCarRecord c : getAllCars()) {
            if (c.getCarId().equals(carId)) return c;
        }
        return null;
    }

    public List<AdminCarRecord> getPendingCars() {
        List<AdminCarRecord> pending = new ArrayList<>();
        for (AdminCarRecord c : getAllCars()) {
            if ("Pending".equalsIgnoreCase(c.getApprovalStatus())) {
                pending.add(c);
            }
        }
        return pending;
    }

    public void approveCar(String carId) {
        updateCarField(carId, 14, "Approved");
    }

    public void rejectCar(String carId) {
        updateCarField(carId, 14, "Rejected");
    }

    public void deleteCar(String carId) {
        List<String> lines = FileHandler.readLines(CARS_FILE);
        List<String> newLines = new ArrayList<>();
        for (String line : lines) {
            if (!line.startsWith(carId + "|")) {
                newLines.add(line);
            }
        }
        FileHandler.writeLines(CARS_FILE, newLines);
    }

    public void markCarAsSold(String carId) {
        updateCarField(carId, 13, "Sold");
    }

    private void updateCarField(String carId, int index, String newValue) {
        List<String> lines = FileHandler.readLines(CARS_FILE);
        List<String> newLines = new ArrayList<>();
        for (String line : lines) {
            String[] p = line.split("\\|");
            if (p.length >= 16 && p[0].equals(carId)) {
                p[index] = newValue;
                newLines.add(String.join("|", p));
            } else {
                newLines.add(line);
            }
        }
        FileHandler.writeLines(CARS_FILE, newLines);
    }
}
