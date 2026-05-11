package com.carplatform.model;

public abstract class User {

    private String userId;
    private String fullName;
    private String email;
    private String passwordHash;
    private String phone;
    private String address;
    private String role;
    private String accountStatus;
    private String approvalStatus;
    private String createdAt;

    // Default constructor
    public User() {}

    // Parameterized constructor
    public User(String userId, String fullName, String email, String passwordHash,
                String phone, String address, String role, String accountStatus,
                String approvalStatus, String createdAt) {
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

    // Abstract methods - must be overridden by subclasses (Polymorphism + Abstraction)
    public abstract String getDashboardName();
    public abstract String getRoleDescription();
    public abstract String displayUserInfo();

    // Getters and Setters (Encapsulation)
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

    // Convert User object to pipe-separated string for TXT storage
    public String toFileString() {
        return userId + "|" + fullName + "|" + email + "|" + passwordHash + "|"
                + phone + "|" + address + "|" + role + "|" + accountStatus + "|"
                + approvalStatus + "|" + createdAt;
    }
}
