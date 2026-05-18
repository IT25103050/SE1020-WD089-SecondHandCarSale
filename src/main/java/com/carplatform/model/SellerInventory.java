package com.carplatform.model;

import java.util.List;

public class SellerInventory {
    private String sellerId;
    private List<Car> cars;

    public SellerInventory() {
    }

    public SellerInventory(String sellerId, List<Car> cars) {
        this.sellerId = sellerId;
        this.cars = cars;
    }

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public List<Car> getCars() {
        return cars;
    }

    public void setCars(List<Car> cars) {
        this.cars = cars;
    }
}
