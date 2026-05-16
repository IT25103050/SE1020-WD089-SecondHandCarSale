package com.carplatform.model;

// OOP Concept: Abstraction - User is an abstract class that provides a base template
// for other specific user types (Buyer, Seller, Dealer, Admin) to inherit from.
public abstract class User {
    // OOP Concept: Encapsulation - Private fields restrict direct access to data.
    // Data is accessed and modified only through public getter and setter methods.
    private String userId;
    private String fullName;
    private String email;
    private String passwordHash;
    private String phone;
    private String address;
    private String role;
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
    }
}
