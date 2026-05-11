package com.carplatform.model;

public class Admin extends User {

    // Default constructor
    public Admin() {
        super();
        setRole("Admin");
        setApprovalStatus("Approved");
    }

    // Parameterized constructor
    public Admin(String userId, String fullName, String email, String passwordHash,
                 String phone, String address, String accountStatus,
                 String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address,
              "Admin", accountStatus, approvalStatus, createdAt);
    }

    // Polymorphism - Overriding abstract methods from User
    @Override
    public String getDashboardName() {
        return "Admin Dashboard";
    }

    @Override
    public String getRoleDescription() {
        return "A system administrator who manages users and platform content.";
    }

    @Override
    public String displayUserInfo() {
        return "Admin: " + getFullName() + " | Email: " + getEmail() + " | Status: " + getAccountStatus();
    }
}
