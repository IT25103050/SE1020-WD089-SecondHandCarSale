package com.carplatform.model;

/**
 * SellerInventoryItem model class.
 * Represents a car listing in a seller's or dealer's inventory.
 * Demonstrates Encapsulation and Information Hiding.
 */
public class SellerInventoryItem {

    // Private fields - Information Hiding & Encapsulation
    private String carId;
    private String sellerId;
    private String brand;
    private String model;
    private int year;
    private double price;
    private int mileage;
    private String fuelType;
    private String transmission;
    private String location;
    private String carStatus;
    private String approvalStatus;

    // Default constructor
    public SellerInventoryItem() {
    }

    // Parameterized constructor
    public SellerInventoryItem(String carId, String sellerId, String brand, String model,
                               int year, double price, int mileage, String fuelType,
                               String transmission, String location, String carStatus,
                               String approvalStatus) {
        this.carId = carId;
        this.sellerId = sellerId;
        this.brand = brand;
        this.model = model;
        this.year = year;
        this.price = price;
        this.mileage = mileage;
        this.fuelType = fuelType;
        this.transmission = transmission;
        this.location = location;
        this.carStatus = carStatus;
        this.approvalStatus = approvalStatus;
    }

    // --- Getters and Setters (Encapsulation) ---

    public String getCarId() {
        return carId;
    }

    public void setCarId(String carId) {
        this.carId = carId;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getModel() {
        return model;
    }

    public void setModel(String model) {
        this.model = model;
    }

    public int getYear() {
        return year;
    }

    public void setYear(int year) {
        this.year = year;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }

    public int getMileage() {
        return mileage;
    }

    public void setMileage(int mileage) {
        this.mileage = mileage;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public String getTransmission() {
        return transmission;
    }

    public void setTransmission(String transmission) {
        this.transmission = transmission;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getCarStatus() {
        return carStatus;
    }

    public void setCarStatus(String carStatus) {
        this.carStatus = carStatus;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }
}
