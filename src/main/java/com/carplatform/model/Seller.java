package com.carplatform.model;

public class Seller extends User {

    public Seller() {
        super();
        setRole("Seller");
    }

    public Seller(String userId, String fullName, String email, String passwordHash, String phone,
                  String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Seller", accountStatus, approvalStatus, createdAt);
    }

    protected Seller(String userId, String fullName, String email, String passwordHash, String phone,
                     String address, String role, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, role, accountStatus, approvalStatus, createdAt);
    }

    @Override
    public String getDashboardName() {
        return "Seller Dashboard";
    }

    @Override
    public String displayUserInfo() {
        return "Private Seller: " + getFullName() + " | Contact: " + getPhone();
    }
}
