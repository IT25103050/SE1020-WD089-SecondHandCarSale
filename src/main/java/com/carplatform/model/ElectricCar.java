package com.carplatform.model;

// OOP Concept: Inheritance - ElectricCar inherits from the base class Car.
// This establishes an IS-A relationship: ElectricCar is a Car.
public class ElectricCar extends Car {

    // OOP Concept: Default Constructor
    // Calls the superclass's constructor.
    public ElectricCar() {
        super();
        setFuelType("Electric");
    }

    // OOP Concept: Parameterized Constructor / Method Overloading
    // Overloads the default constructor with parameters.
    public ElectricCar(String carId, String sellerId, String brand, String model, int year, double price,
                       double mileage, String transmission, String location, String condition,
                       String description, String imagePath, String carStatus, String approvalStatus, String createdAt) {
        super(carId, sellerId, brand, model, year, price, mileage, "Electric", transmission, location, condition, description, imagePath, carStatus, approvalStatus, createdAt);
    }

    // OOP Concept: Polymorphism (Method Overriding)
    // Provides a specific implementation for ElectricCar details, overriding the abstract method in Car.
    @Override
    public String displayCarDetails() {
        return "Electric Car: " + getBrand() + " " + getModel() + " (" + getYear() + ") - Electric Powertrain";
    }

    // OOP Concept: Polymorphism (Method Overriding)
    // Custom logic to calculate the estimated value specific to an ElectricCar.
    @Override
    public double calculateEstimatedValue() {
        // EV battery degradation schedule estimation over time
        int age = java.util.Calendar.getInstance().get(java.util.Calendar.YEAR) - getYear();
        double baseValue = getPrice();
        double depreciation = (age * 0.07) + (getMileage() / 80000.0 * 0.12);
        double finalVal = baseValue * (1.0 - Math.min(depreciation, 0.8));
        return Math.max(finalVal, 1000.0);
    }
}
