package com.carplatform.model;

// OOP Concept: Abstraction - Abstract base class for different types of cars.
// It defines the common attributes and behaviors that all cars share.
public class Car {
    private String carId;
    private String sellerId;
    private String brand;
    private String model;
    private int year;
    private double price;
    private double mileage;
    private String fuelType; // Petrol, Diesel, Electric
    private String transmission;
    private String location;
    private String condition;
    private String description;
    private String imagePath;
    private String carStatus; // AVAILABLE, SOLD, RESERVED
    private String approvalStatus; // APPROVED, PENDING, REJECTED
    private String createdAt;

    // OOP Concept: Default Constructor
    // Part of Constructor Overloading.
    public Car() {
    }

    // OOP Concept: Parameterized Constructor
    // Part of Constructor Overloading. Initializes the object with specific values.
    public Car(String carId, String sellerId, String brand, String model, int year, double price,
               double mileage, String fuelType, String transmission, String location, String condition,
               String description, String imagePath, String carStatus, String approvalStatus, String createdAt) {
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
        this.condition = condition;
        this.description = description;
        this.imagePath = imagePath;
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

    public int getYear() { return year; }
    public void setYear(int year) { this.year = year; }

    public double getPrice() { return price; }
    public void setPrice(double price) { this.price = price; }

    public double getMileage() { return mileage; }
    public void setMileage(double mileage) { this.mileage = mileage; }

    public String getFuelType() { return fuelType; }
    public void setFuelType(String fuelType) { this.fuelType = fuelType; }

    public String getTransmission() { return transmission; }
    public void setTransmission(String transmission) { this.transmission = transmission; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public String getCondition() { return condition; }
    public void setCondition(String condition) { this.condition = condition; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public String getImagePath() { return imagePath; }
    public void setImagePath(String imagePath) { this.imagePath = imagePath; }

    public String getCarStatus() { return carStatus; }
    public void setCarStatus(String carStatus) { this.carStatus = carStatus; }

    public String getApprovalStatus() { return approvalStatus; }
    public void setApprovalStatus(String approvalStatus) { this.approvalStatus = approvalStatus; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    // OOP Concept: Abstraction
    // These methods must be implemented by concrete subclasses (e.g., ElectricCar, PetrolCar).
    public String displayCarDetails() {
        return brand + " " + model + " (" + year + ")";
    }

    public double calculateEstimatedValue() {
        return price;
    }

    public String toFileString() {
        return String.join("|",
            carId != null ? carId : "",
            sellerId != null ? sellerId : "",
            brand != null ? brand : "",
            model != null ? model : "",
            String.valueOf(year),
            String.format("%.2f", price).replace(",", "."),
            String.format("%.1f", mileage).replace(",", "."),
            fuelType != null ? fuelType : "",
            transmission != null ? transmission : "",
            location != null ? location : "",
            condition != null ? condition : "",
            description != null ? description : "",
            imagePath != null ? imagePath : "",
            carStatus != null ? carStatus : "",
            approvalStatus != null ? approvalStatus : "",
            createdAt != null ? createdAt : ""
        );
    }
}
