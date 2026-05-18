package com.carplatform.model;

public class CarFilter {
    private String brand;
    private String fuelType;
    private Double maxPrice;

    public CarFilter() {
    }

    public CarFilter(String brand, String fuelType, Double maxPrice) {
        this.brand = brand;
        this.fuelType = fuelType;
        this.maxPrice = maxPrice;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getFuelType() {
        return fuelType;
    }

    public void setFuelType(String fuelType) {
        this.fuelType = fuelType;
    }

    public Double getMaxPrice() {
        return maxPrice;
    }

    public void setMaxPrice(Double maxPrice) {
        this.maxPrice = maxPrice;
    }
}
