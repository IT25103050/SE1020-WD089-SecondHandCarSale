package com.carplatform.model;

// OOP Concept: Inheritance - The Buyer class inherits attributes and methods from the User class.
// This promotes code reusability (IS-A relationship: Buyer is a User).
public class Buyer extends User {

    public Buyer() {
        super();
        setRole("Buyer");
    }

    public Buyer(String userId, String fullName, String email, String passwordHash, String phone,
                 String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Buyer", accountStatus, approvalStatus, createdAt);
    }

    // OOP Concept: Polymorphism (Method Overriding)
    // The Buyer class provides its own specific implementation of the abstract getDashboardName() method from User.
    @Override
    public String getDashboardName() {
        return "Buyer Dashboard";
    }

    // OOP Concept: Polymorphism (Method Overriding)
    // Provides a specific way to display user info for a Buyer.
    @Override
    public String displayUserInfo() {
        return "Buyer Profile: " + getFullName() + " (" + getEmail() + ")";
    }
}
