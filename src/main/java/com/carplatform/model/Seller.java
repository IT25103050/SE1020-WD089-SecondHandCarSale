package com.carplatform.model;

public class Seller extends User {

    // Default constructor
    public Seller() {
        super();
        setRole("Seller");
    }

    // Parameterized constructor
    public Seller(String userId, String fullName, String email, String passwordHash,
                  String phone, String address, String accountStatus,
                  String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address,
              "Seller", accountStatus, approvalStatus, createdAt);
    }

    // Polymorphism - Overriding abstract methods from User
    @Override
    public String getDashboardName() {
        return "Seller Dashboard";
    }

    @Override
    public String getRoleDescription() {
        return "A registered seller who can list cars for sale.";
    }

    @Override
    public String displayUserInfo() {
        return "Seller: " + getFullName() + " | Email: " + getEmail() + " | Status: " + getAccountStatus();
    }
}
