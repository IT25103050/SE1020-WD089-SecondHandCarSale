package com.carplatform.model;

public class Dealer extends Seller {

    public Dealer() {
        super();
        setRole("Dealer");
    }

    public Dealer(String userId, String fullName, String email, String passwordHash, String phone,
                  String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Dealer", accountStatus, approvalStatus, createdAt);
    }

    @Override
    public String getDashboardName() {
        return "Dealer Dashboard";
    }

    @Override
    public String displayUserInfo() {
        return "Certified Dealership: " + getFullName() + " | Showroom: " + getAddress();
    }
}
