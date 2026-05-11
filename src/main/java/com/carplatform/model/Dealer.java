package com.carplatform.model;

public class Dealer extends Seller {

    // Dealer extends Seller (Inheritance chain: Dealer -> Seller -> User)
    // Dealers have an approvalStatus that can be Pending or Approved

    // Default constructor
    public Dealer() {
        super();
        setRole("Dealer");
        setApprovalStatus("Pending"); // Dealers start with Pending approval
    }

    // Parameterized constructor
    public Dealer(String userId, String fullName, String email, String passwordHash,
                  String phone, String address, String accountStatus,
                  String approvalStatus, String createdAt) {
        super(userId, fullName, email, passwordHash, phone, address,
              accountStatus, approvalStatus, createdAt);
        setRole("Dealer");
        setApprovalStatus(approvalStatus); // Can be Pending or Approved
    }

    // Polymorphism - Overriding methods from Seller and User
    @Override
    public String getDashboardName() {
        return "Dealer Dashboard";
    }

    @Override
    public String getRoleDescription() {
        return "A registered dealer who manages car inventory. Requires admin approval.";
    }

    @Override
    public String displayUserInfo() {
        return "Dealer: " + getFullName() + " | Email: " + getEmail()
                + " | Approval: " + getApprovalStatus() + " | Status: " + getAccountStatus();
    }

    // Check if the dealer is approved
    public boolean isApproved() {
        return "Approved".equalsIgnoreCase(getApprovalStatus());
    }
}
