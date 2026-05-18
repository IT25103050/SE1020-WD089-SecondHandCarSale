package com.carplatform.model;

public class Seller extends User {

<<<<<<< HEAD
=======
    // Default constructor
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    public Seller() {
        super();
        setRole("Seller");
    }

<<<<<<< HEAD
    public Seller(String userId, String fullName, String email, String passwordHash, String phone,
                  String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Seller", accountStatus, approvalStatus, createdAt);
    }

    protected Seller(String userId, String fullName, String email, String passwordHash, String phone,
                     String address, String role, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, role, accountStatus, approvalStatus, createdAt);
    }

=======
    // Parameterized constructor
    public Seller(String userId, String fullName, String email, String passwordHash,
                  String phone, String address, String accountStatus,
                  String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address,
              "Seller", accountStatus, approvalStatus, createdAt);
    }

    // Polymorphism - Overriding abstract methods from User
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    @Override
    public String getDashboardName() {
        return "Seller Dashboard";
    }

    @Override
<<<<<<< HEAD
    public String displayUserInfo() {
        return "Private Seller: " + getFullName() + " | Contact: " + getPhone();
=======
    public String getRoleDescription() {
        return "A registered seller who can list cars for sale.";
    }

    @Override
    public String displayUserInfo() {
        return "Seller: " + getFullName() + " | Email: " + getEmail() + " | Status: " + getAccountStatus();
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    }
}
