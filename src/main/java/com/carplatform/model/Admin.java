package com.carplatform.model;

public class Admin extends User {

<<<<<<< HEAD
    public Admin() {
        super();
        setRole("Admin");
    }

    public Admin(String userId, String fullName, String email, String passwordHash, String phone,
                 String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Admin", accountStatus, approvalStatus, createdAt);
    }

=======
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
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    @Override
    public String getDashboardName() {
        return "Admin Dashboard";
    }

    @Override
<<<<<<< HEAD
    public String displayUserInfo() {
        return "System Administrator: " + getFullName() + " (Full Access)";
=======
    public String getRoleDescription() {
        return "A system administrator who manages users and platform content.";
    }

    @Override
    public String displayUserInfo() {
        return "Admin: " + getFullName() + " | Email: " + getEmail() + " | Status: " + getAccountStatus();
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    }
}
