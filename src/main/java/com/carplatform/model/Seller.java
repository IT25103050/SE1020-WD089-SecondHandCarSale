package com.carplatform.model;

/**
 * Seller model class - Parent class for Dealer.
 * Demonstrates Encapsulation, Abstraction, and Information Hiding.
 * Fields are private (information hiding) with public getters/setters (encapsulation).
 * Contains overridable methods for polymorphism.
 */
public class Seller {

    // Private fields - Information Hiding & Encapsulation
    private String sellerId;
    private String fullName;
    private String email;
    private String phone;
    private String address;
    private String role;
    private String accountStatus;
    private String approvalStatus;
    private String createdAt;

    // Default constructor
    public Seller() {
    }

    // Parameterized constructor
    public Seller(String sellerId, String fullName, String email, String phone,
                  String address, String role, String accountStatus,
                  String approvalStatus, String createdAt) {
        this.sellerId = sellerId;
        this.fullName = fullName;
        this.email = email;
        this.phone = phone;
        this.address = address;
        this.role = role;
        this.accountStatus = accountStatus;
        this.approvalStatus = approvalStatus;
        this.createdAt = createdAt;
    }

    // --- Getters and Setters (Encapsulation) ---

    public String getSellerId() {
        return sellerId;
    }

    public void setSellerId(String sellerId) {
        this.sellerId = sellerId;
    }

    public String getFullName() {
        return fullName;
    }

    public void setFullName(String fullName) {
        this.fullName = fullName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getApprovalStatus() {
        return approvalStatus;
    }

    public void setApprovalStatus(String approvalStatus) {
        this.approvalStatus = approvalStatus;
    }

    public String getCreatedAt() {
        return createdAt;
    }

    public void setCreatedAt(String createdAt) {
        this.createdAt = createdAt;
    }

    // --- Overridable methods for Polymorphism ---

    /**
     * Returns the profile type. Overridden in Dealer.
     * Demonstrates Polymorphism.
     */
    public String getProfileType() {
        return "Seller";
    }

    /**
     * Returns the dashboard title. Overridden in Dealer.
     * Demonstrates Polymorphism.
     */
    public String getDashboardTitle() {
        return "Seller Dashboard";
    }

    /**
     * Returns a profile summary string. Overridden in Dealer.
     * Demonstrates Polymorphism.
     */
    public String displayProfileSummary() {
        return "Seller: " + fullName + " | Email: " + email + " | Phone: " + phone
                + " | Status: " + accountStatus;
    }

    /**
     * Converts seller data to pipe-separated string for file storage.
     */
    public String toFileString(String passwordHash) {
        return sellerId + "|" + fullName + "|" + email + "|" + passwordHash + "|"
                + phone + "|" + address + "|" + role + "|" + accountStatus + "|"
                + approvalStatus + "|" + createdAt;
    }
}
