package com.carplatform.model;

public class DieselCar extends Car {

    public DieselCar() {
        super();
        setFuelType("Diesel");
    }

    public DieselCar(String carId, String sellerId, String brand, String model, int year, double price,
                     double mileage, String transmission, String location, String condition,
                     String description, String imagePath, String carStatus, String approvalStatus, String createdAt) {
        super(carId, sellerId, brand, model, year, price, mileage, "Diesel", transmission, location, condition, description, imagePath, carStatus, approvalStatus, createdAt);
    }

    @Override
    public String displayCarDetails() {
        return "Diesel Car: " + getBrand() + " " + getModel() + " (" + getYear() + ") - High Torque Diesel Engine";
    }

    @Override
    public double calculateEstimatedValue() {
        // High torque long distance vehicles hold value better for raw mileage, slightly higher age discount due to emissions regulations
        int age = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) - getYear();
        double baseValue = getPrice();
        double depreciation = (age * 0.06) + (getMileage() / 150000.0 * 0.08);
        double finalVal = baseValue * (1.0 - Math.min(depreciation, 0.75));
        return Math.max(finalVal, 1000.0);
    }
}
