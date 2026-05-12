package com.carplatform.dao;

import com.carplatform.model.AdminDashboardStats;
import com.carplatform.util.FileHandler;
import java.util.List;

public class AdminDAO {
    private final String USERS_FILE;
    private final String CARS_FILE;
    private final String TRANSACTIONS_FILE;
    private final String REVIEWS_FILE;

    public AdminDAO(String basePath) {
        USERS_FILE = basePath + "/users.txt";
        CARS_FILE = basePath + "/cars.txt";
        TRANSACTIONS_FILE = basePath + "/transactions.txt";
        REVIEWS_FILE = basePath + "/reviews.txt";
    }

    public AdminDashboardStats getDashboardStats() {
        AdminDashboardStats stats = new AdminDashboardStats();
        stats.setTotalUsers(countTotalUsers());
        stats.setTotalBuyers(countUsersByRole("Buyer"));
        stats.setTotalSellers(countUsersByRole("Seller"));
        stats.setTotalDealers(countUsersByRole("Dealer"));
        stats.setTotalCars(countTotalCars());
        stats.setPendingCars(countCarsByApprovalStatus("Pending"));
        stats.setApprovedCars(countCarsByApprovalStatus("Approved"));
        stats.setSoldCars(countCarsByCarStatus("Sold"));
        stats.setAvailableCars(countCarsByCarStatus("Available"));
        stats.setPendingTransactions(countTransactionsByStatus("Pending"));
        stats.setCompletedTransactions(countTransactionsByStatus("Completed"));
        stats.setTotalReviews(countTotalReviews());
        return stats;
    }

    public int countTotalUsers() {
        return FileHandler.readLines(USERS_FILE).size();
    }

    public int countUsersByRole(String role) {
        int count = 0;
        for (String line : FileHandler.readLines(USERS_FILE)) {
            String[] parts = line.split("\\|");
            if (parts.length > 6 && parts[6].equalsIgnoreCase(role)) {
                count++;
            }
        }
        return count;
    }

    public int countTotalCars() {
        return FileHandler.readLines(CARS_FILE).size();
    }

    public int countCarsByApprovalStatus(String status) {
        int count = 0;
        for (String line : FileHandler.readLines(CARS_FILE)) {
            String[] parts = line.split("\\|");
            if (parts.length > 14 && parts[14].equalsIgnoreCase(status)) {
                count++;
            }
        }
        return count;
    }

    public int countCarsByCarStatus(String status) {
        int count = 0;
        for (String line : FileHandler.readLines(CARS_FILE)) {
            String[] parts = line.split("\\|");
            if (parts.length > 13 && parts[13].equalsIgnoreCase(status)) {
                count++;
            }
        }
        return count;
    }

    public int countTransactionsByStatus(String status) {
        int count = 0;
        for (String line : FileHandler.readLines(TRANSACTIONS_FILE)) {
            String[] parts = line.split("\\|");
            if (parts.length > 5 && parts[5].equalsIgnoreCase(status)) {
                count++;
            }
        }
        return count;
    }

    public int countTotalReviews() {
        return FileHandler.readLines(REVIEWS_FILE).size();
    }
}
