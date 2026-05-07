package com.carplatform.dao;

import com.carplatform.model.Seller;
import com.carplatform.util.FileHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * SellerProfileDAO - Data Access Object for Seller profiles.
 * Reads and writes seller data from/to users.txt.
 *
 * users.txt format:
 * userId|fullName|email|passwordHash|phone|address|role|accountStatus|approvalStatus|createdAt
 */
public class SellerProfileDAO {

    private String filePath;

    public SellerProfileDAO(String filePath) {
        this.filePath = filePath;
    }

    /**
     * Get a seller by their userId.
     * Returns null if not found or if role is not Seller.
     */
    public Seller getSellerById(String sellerId) {
        List<String> lines = FileHandler.readAllLines(filePath);
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[0].equals(sellerId) && parts[6].equals("Seller")) {
                return parseSeller(parts);
            }
        }
        return null;
    }

    /**
     * Update a seller's profile in users.txt.
     * Replaces the matching userId line with updated data.
     * Keeps passwordHash and other unchanged fields intact.
     */
    public boolean updateSellerProfile(Seller seller) {
        List<String> lines = FileHandler.readAllLines(filePath);
        List<String> updatedLines = new ArrayList<>();
        boolean found = false;

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[0].equals(seller.getSellerId())) {
                // Keep original passwordHash (parts[3])
                String updatedLine = seller.toFileString(parts[3]);
                updatedLines.add(updatedLine);
                found = true;
            } else {
                updatedLines.add(line);
            }
        }

        if (found) {
            FileHandler.writeAllLines(filePath, updatedLines);
        }
        return found;
    }

    /**
     * Deactivate a seller by setting accountStatus to Inactive.
     * Does NOT delete the record from users.txt.
     */
    public boolean deactivateSeller(String sellerId) {
        List<String> lines = FileHandler.readAllLines(filePath);
        List<String> updatedLines = new ArrayList<>();
        boolean found = false;

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[0].equals(sellerId)) {
                // Set accountStatus (index 7) to Inactive
                parts[7] = "Inactive";
                updatedLines.add(String.join("|", parts));
                found = true;
            } else {
                updatedLines.add(line);
            }
        }

        if (found) {
            FileHandler.writeAllLines(filePath, updatedLines);
        }
        return found;
    }

    /**
     * Get all sellers (role = Seller) from users.txt.
     */
    public List<Seller> getAllSellers() {
        List<Seller> sellers = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[6].equals("Seller")) {
                sellers.add(parseSeller(parts));
            }
        }
        return sellers;
    }

    /**
     * Get all active sellers (role = Seller, accountStatus = Active).
     */
    public List<Seller> getActiveSellers() {
        List<Seller> sellers = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[6].equals("Seller") && parts[7].equals("Active")) {
                sellers.add(parseSeller(parts));
            }
        }
        return sellers;
    }

    /**
     * Parse a line's parts into a Seller object.
     * Format: userId|fullName|email|passwordHash|phone|address|role|accountStatus|approvalStatus|createdAt
     */
    private Seller parseSeller(String[] parts) {
        Seller seller = new Seller();
        seller.setSellerId(parts[0]);
        seller.setFullName(parts[1]);
        seller.setEmail(parts[2]);
        // parts[3] = passwordHash (not stored in model)
        seller.setPhone(parts[4]);
        seller.setAddress(parts[5]);
        seller.setRole(parts[6]);
        seller.setAccountStatus(parts[7]);
        seller.setApprovalStatus(parts[8]);
        seller.setCreatedAt(parts[9]);
        return seller;
    }
}
