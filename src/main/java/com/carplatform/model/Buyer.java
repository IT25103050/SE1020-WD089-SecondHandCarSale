package com.carplatform.model;

public class Buyer extends User {

    // Default constructor
    public Buyer() {
        super();
        setRole("Buyer");
    }

    // Parameterized constructor
    public Buyer(String userId, String fullName, String email, String passwordHash,
                 String phone, String address, String accountStatus,
                 String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address,
              "Buyer", accountStatus, approvalStatus, createdAt);
    }

    // Polymorphism - Overriding abstract methods from User
    @Override
    public String getDashboardName() {
        return "Buyer Dashboard";
    }

    @Override
    public String getRoleDescription() {
        return "A registered buyer who can browse and purchase cars.";
    }

    @Override
    public String displayUserInfo() {
        return "Buyer: " + getFullName() + " | Email: " + getEmail() + " | Status: " + getAccountStatus();
    }
}
