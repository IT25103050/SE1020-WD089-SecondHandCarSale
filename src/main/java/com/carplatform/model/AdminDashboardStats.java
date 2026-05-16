package com.carplatform.model;

public class AdminDashboardStats {
    private int totalUsers;
    private int totalBuyers;
    private int totalSellers;
    private int totalDealers;
    private int totalCars;
    private int pendingCars;
    private int approvedCars;
    private int soldCars;
    private int availableCars;
    private int pendingTransactions;
    private int completedTransactions;
    private int totalReviews;

    // Getters and Setters
    public int getTotalUsers() { return totalUsers; }
    public void setTotalUsers(int totalUsers) { this.totalUsers = totalUsers; }

    public int getTotalBuyers() { return totalBuyers; }
    public void setTotalBuyers(int totalBuyers) { this.totalBuyers = totalBuyers; }

    public int getTotalSellers() { return totalSellers; }
    public void setTotalSellers(int totalSellers) { this.totalSellers = totalSellers; }

    public int getTotalDealers() { return totalDealers; }
    public void setTotalDealers(int totalDealers) { this.totalDealers = totalDealers; }

    public int getTotalCars() { return totalCars; }
    public void setTotalCars(int totalCars) { this.totalCars = totalCars; }

    public int getPendingCars() { return pendingCars; }
    public void setPendingCars(int pendingCars) { this.pendingCars = pendingCars; }

    public int getApprovedCars() { return approvedCars; }
    public void setApprovedCars(int approvedCars) { this.approvedCars = approvedCars; }

    public int getSoldCars() { return soldCars; }
    public void setSoldCars(int soldCars) { this.soldCars = soldCars; }

    public int getAvailableCars() { return availableCars; }
    public void setAvailableCars(int availableCars) { this.availableCars = availableCars; }

    public int getPendingTransactions() { return pendingTransactions; }
    public void setPendingTransactions(int pendingTransactions) { this.pendingTransactions = pendingTransactions; }

    public int getCompletedTransactions() { return completedTransactions; }
    public void setCompletedTransactions(int completedTransactions) { this.completedTransactions = completedTransactions; }

    public int getTotalReviews() { return totalReviews; }
    public void setTotalReviews(int totalReviews) { this.totalReviews = totalReviews; }
}
