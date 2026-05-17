package com.carplatform.model;

public class PetrolCar extends Car {

    public PetrolCar() {
        super();
        setFuelType("Petrol");
    }

    public PetrolCar(String carId, String sellerId, String brand, String model, int year, double price,
                     double mileage, String transmission, String location, String condition,
                     String description, String imagePath, String carStatus, String approvalStatus, String createdAt) {
        super(carId, sellerId, brand, model, year, price, mileage, "Petrol", transmission, location, condition, description, imagePath, carStatus, approvalStatus, createdAt);
    }

    @Override
    public String displayCarDetails() {
        return "Petrol Car: " + getBrand() + " " + getModel() + " (" + getYear() + ") - Standard Combustion Engine";
    }

    @Override
    public double calculateEstimatedValue() {
        // Simple depreciation based on mileage and age for standard petrol combustion vehicles
        int age = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) - getYear();
        double baseValue = getPrice();
        double depreciation = (age * 0.05) + (getMileage() / 100000.0 * 0.1);
        double finalVal = baseValue * (1.0 - Math.min(depreciation, 0.7));
        return Math.max(finalVal, 1000.0);
    }
}
