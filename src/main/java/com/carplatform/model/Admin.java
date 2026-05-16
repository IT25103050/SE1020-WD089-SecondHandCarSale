package com.carplatform.model;

public class Admin extends User {

    public Admin() {
        super();
        setRole("Admin");
    }

    public Admin(String userId, String fullName, String email, String passwordHash, String phone,
                 String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Admin", accountStatus, approvalStatus, createdAt);
    }

    @Override
    public String getDashboardName() {
        return "Admin Dashboard";
    }

    @Override
    public String displayUserInfo() {
        return "System Administrator: " + getFullName() + " (Full Access)";
    }
}
