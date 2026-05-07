package com.carplatform.model;

/**
 * Dealer model class - Extends Seller.
 * Demonstrates Inheritance and Polymorphism.
 * Dealer IS-A Seller with additional dealer-specific fields.
 */
public class Dealer extends Seller {

    // Additional dealer-specific fields - Encapsulation
    private String dealerName;
    private String dealerDescription;

    // Default constructor
    public Dealer() {
        super();
    }

    // Parameterized constructor
    public Dealer(String sellerId, String fullName, String email, String phone,
                  String address, String role, String accountStatus,
                  String approvalStatus, String createdAt,
                  String dealerName, String dealerDescription) {
        super(sellerId, fullName, email, phone, address, role,
                accountStatus, approvalStatus, createdAt);
        this.dealerName = dealerName;
        this.dealerDescription = dealerDescription;
    }

    // --- Getters and Setters ---

    public String getDealerName() {
        return dealerName;
    }

    public void setDealerName(String dealerName) {
        this.dealerName = dealerName;
    }

    public String getDealerDescription() {
        return dealerDescription;
    }

    public void setDealerDescription(String dealerDescription) {
        this.dealerDescription = dealerDescription;
    }

    // --- Overridden methods - Polymorphism ---

    /**
     * Returns "Dealer" as the profile type.
     * Overrides Seller.getProfileType() - Polymorphism.
     */
    @Override
    public String getProfileType() {
        return "Dealer";
    }

    /**
     * Returns "Dealer Dashboard" as the dashboard title.
     * Overrides Seller.getDashboardTitle() - Polymorphism.
     */
    @Override
    public String getDashboardTitle() {
        return "Dealer Dashboard";
    }

    /**
     * Returns a dealer-specific profile summary.
     * Overrides Seller.displayProfileSummary() - Polymorphism.
     */
    @Override
    public String displayProfileSummary() {
        return "Dealer: " + dealerName + " | Email: " + getEmail() + " | Phone: " + getPhone()
                + " | Approval: " + getApprovalStatus() + " | Status: " + getAccountStatus();
    }
}
