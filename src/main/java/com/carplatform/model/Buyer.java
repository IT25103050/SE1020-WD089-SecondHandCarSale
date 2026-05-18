package com.carplatform.model;

<<<<<<< HEAD
// OOP Concept: Inheritance - The Buyer class inherits attributes and methods from the User class.
// This promotes code reusability (IS-A relationship: Buyer is a User).
public class Buyer extends User {

=======
public class Buyer extends User {

    // Default constructor
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    public Buyer() {
        super();
        setRole("Buyer");
    }

<<<<<<< HEAD
    public Buyer(String userId, String fullName, String email, String passwordHash, String phone,
                 String address, String accountStatus, String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address, "Buyer", accountStatus, approvalStatus, createdAt);
    }

    // OOP Concept: Polymorphism (Method Overriding)
    // The Buyer class provides its own specific implementation of the abstract getDashboardName() method from User.
=======
    // Parameterized constructor
    public Buyer(String userId, String fullName, String email, String passwordHash,
                 String phone, String address, String accountStatus,
                 String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address,
              "Buyer", accountStatus, approvalStatus, createdAt);
    }

    // Polymorphism - Overriding abstract methods from User
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    @Override
    public String getDashboardName() {
        return "Buyer Dashboard";
    }

<<<<<<< HEAD
    // OOP Concept: Polymorphism (Method Overriding)
    // Provides a specific way to display user info for a Buyer.
    @Override
    public String displayUserInfo() {
        return "Buyer Profile: " + getFullName() + " (" + getEmail() + ")";
=======
    @Override
    public String getRoleDescription() {
        return "A registered buyer who can browse and purchase cars.";
    }

    @Override
    public String displayUserInfo() {
        return "Buyer: " + getFullName() + " | Email: " + getEmail() + " | Status: " + getAccountStatus();
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    }
}
