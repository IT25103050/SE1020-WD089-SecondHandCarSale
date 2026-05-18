package com.carplatform.model;

<<<<<<< HEAD
// OOP Concept: Abstraction - User is an abstract class that provides a base template
// for other specific user types (Buyer, Seller, Dealer, Admin) to inherit from.
public abstract class User {
    // OOP Concept: Encapsulation - Private fields restrict direct access to data.
    // Data is accessed and modified only through public getter and setter methods.
=======
public abstract class User {

>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    private String userId;
    private String fullName;
    private String email;
    private String passwordHash;
    private String phone;
    private String address;
    private String role;
<<<<<<< HEAD
    private String accountStatus; // ACTIVE, SUSPENDED
    private String approvalStatus; // APPROVED, PENDING
    private String createdAt;

    // OOP Concept: Default Constructor
    // Provides a way to instantiate the object without initial values.
    // Part of Constructor Overloading.
    public User() {
    }

    // OOP Concept: Parameterized Constructor
    // Provides a way to instantiate the object with specific initial values.
    // OOP Concept: Method/Constructor Overloading - Multiple constructors with different signatures.
    public User(String userId, String fullName, String email, String passwordHash, String phone,
                String address, String role, String accountStatus, String approvalStatus, String createdAt) {
=======
    private String accountStatus;
    private String approvalStatus;
    private String createdAt;

    // Default constructor
    public User() {}

    // Parameterized constructor
    public User(String userId, String fullName, String email, String passwordHash,
                String phone, String address, String role, String accountStatus,
                String approvalStatus, String createdAt) {
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
        this.userId = userId;
        this.fullName = fullName;
        this.email = email;
        this.passwordHash = passwordHash;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.accountStatus = accountStatus;
        this.approvalStatus = approvalStatus;
        this.createdAt = createdAt;
    }

<<<<<<< HEAD
=======
    // Abstract methods - must be overridden by subclasses (Polymorphism + Abstraction)
    public abstract String getDashboardName();
    public abstract String getRoleDescription();
    public abstract String displayUserInfo();

    // Getters and Setters (Encapsulation)
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    public String getUserId() { return userId; }
    public void setUserId(String userId) { this.userId = userId; }

    public String getFullName() { return fullName; }
    public void setFullName(String fullName) { this.fullName = fullName; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPasswordHash() { return passwordHash; }
    public void setPasswordHash(String passwordHash) { this.passwordHash = passwordHash; }

    public String getPhone() { return phone; }
    public void setPhone(String phone) { this.phone = phone; }

    public String getAddress() { return address; }
    public void setAddress(String address) { this.address = address; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public String getAccountStatus() { return accountStatus; }
    public void setAccountStatus(String accountStatus) { this.accountStatus = accountStatus; }

    public String getApprovalStatus() { return approvalStatus; }
    public void setApprovalStatus(String approvalStatus) { this.approvalStatus = approvalStatus; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

<<<<<<< HEAD
    // OOP Concept: Abstraction - Abstract methods with no implementation.
    // These force subclasses (like Buyer, Seller) to provide their own specific implementations.
    // This allows for Polymorphism later when calling these methods on a User reference.
    public abstract String getDashboardName();
    public abstract String displayUserInfo();

    public String toFileString() {
        return String.join("|", 
            userId != null ? userId : "",
            fullName != null ? fullName : "",
            email != null ? email : "",
            passwordHash != null ? passwordHash : "",
            phone != null ? phone : "",
            address != null ? address : "",
            role != null ? role : "",
            accountStatus != null ? accountStatus : "",
            approvalStatus != null ? approvalStatus : "",
            createdAt != null ? createdAt : ""
        );
=======
    // Convert User object to pipe-separated string for TXT storage
    public String toFileString() {
        return userId + "|" + fullName + "|" + email + "|" + passwordHash + "|"
                + phone + "|" + address + "|" + role + "|" + accountStatus + "|"
                + approvalStatus + "|" + createdAt;
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    }
}
