package com.carplatform.model;

public class AdminCarRecord {
    private String carId;
    private String sellerId;
    private String brand;
    private String model;
    private String year;
    private String price;
    private String mileage;
    private String fuelType;
    private String transmission;
    private String location;
    private String carStatus;
    private String approvalStatus;
    private String createdAt;

    public AdminCarRecord(String carId, String sellerId, String brand, String model, String year, String price, String mileage, String fuelType, String transmission, String location, String carStatus, String approvalStatus, String createdAt) {
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
        this.createdAt = createdAt;
    }

    public String getCarId() { return carId; }
    public void setCarId(String carId) { this.carId = carId; }

    public String getSellerId() { return sellerId; }
    public void setSellerId(String sellerId) { this.sellerId = sellerId; }

    public String getBrand() { return brand; }
    public void setBrand(String brand) { this.brand = brand; }

    public String getModel() { return model; }
    public void setModel(String model) { this.model = model; }

    public String getYear() { return year; }
    public void setYear(String year) { this.year = year; }

    public String getPrice() { return price; }
    public void setPrice(String price) { this.price = price; }

    public String getMileage() { return mileage; }
    public void setMileage(String mileage) { this.mileage = mileage; }

    public String getFuelType() { return fuelType; }
    public void setFuelType(String fuelType) { this.fuelType = fuelType; }

    public String getTransmission() { return transmission; }
    public void setTransmission(String transmission) { this.transmission = transmission; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getCarStatus() { return carStatus; }
    public void setCarStatus(String carStatus) { this.carStatus = carStatus; }

    public String getApprovalStatus() { return approvalStatus; }
    public void setApprovalStatus(String approvalStatus) { this.approvalStatus = approvalStatus; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
