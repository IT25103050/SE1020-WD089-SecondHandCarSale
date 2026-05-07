package com.carplatform.dao;

import com.carplatform.model.Dealer;
import com.carplatform.util.FileHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * DealerProfileDAO - Data Access Object for Dealer profiles.
 * Reads and writes dealer data from/to users.txt.
 *
 * users.txt format:
 * userId|fullName|email|passwordHash|phone|address|role|accountStatus|approvalStatus|createdAt
 */
public class DealerProfileDAO {

    private String filePath;

    public DealerProfileDAO(String filePath) {
        this.filePath = filePath;
    }

    /**
     * Get a dealer by their userId.
     * Returns null if not found or if role is not Dealer.
     */
    public Dealer getDealerById(String dealerId) {
        List<String> lines = FileHandler.readAllLines(filePath);
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[0].equals(dealerId) && parts[6].equals("Dealer")) {
                return parseDealer(parts);
            }
        }
        return null;
    }

    /**
     * Update a dealer's profile in users.txt.
     * Replaces the matching userId line with updated data.
     */
    public boolean updateDealerProfile(Dealer dealer) {
        List<String> lines = FileHandler.readAllLines(filePath);
        List<String> updatedLines = new ArrayList<>();
        boolean found = false;

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[0].equals(dealer.getSellerId())) {
                // Keep original passwordHash (parts[3])
                String updatedLine = dealer.toFileString(parts[3]);
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
     * Deactivate a dealer by setting accountStatus to Inactive.
     * Does NOT delete the record from users.txt.
     */
    public boolean deactivateDealer(String dealerId) {
        List<String> lines = FileHandler.readAllLines(filePath);
        List<String> updatedLines = new ArrayList<>();
        boolean found = false;

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[0].equals(dealerId)) {
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
     * Get all dealers (role = Dealer) from users.txt.
     */
    public List<Dealer> getAllDealers() {
        List<Dealer> dealers = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[6].equals("Dealer")) {
                dealers.add(parseDealer(parts));
            }
        }
        return dealers;
    }

    /**
     * Get all approved dealers (role = Dealer, approvalStatus = Approved).
     */
    public List<Dealer> getApprovedDealers() {
        List<Dealer> dealers = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 10 && parts[6].equals("Dealer") && parts[8].equals("Approved")) {
                dealers.add(parseDealer(parts));
            }
        }
        return dealers;
    }

    /**
     * Check if a dealer is approved.
     */
    public boolean isDealerApproved(String dealerId) {
        Dealer dealer = getDealerById(dealerId);
        if (dealer != null) {
            return "Approved".equals(dealer.getApprovalStatus());
        }
        return false;
    }

    /**
     * Parse a line's parts into a Dealer object.
     * Uses fullName as dealerName since users.txt has no separate dealer name field.
     */
    private Dealer parseDealer(String[] parts) {
        Dealer dealer = new Dealer();
        dealer.setSellerId(parts[0]);
        dealer.setFullName(parts[1]);
        dealer.setEmail(parts[2]);
        // parts[3] = passwordHash (not stored in model)
        dealer.setPhone(parts[4]);
        dealer.setAddress(parts[5]);
        dealer.setRole(parts[6]);
        dealer.setAccountStatus(parts[7]);
        dealer.setApprovalStatus(parts[8]);
        dealer.setCreatedAt(parts[9]);
        // Use fullName as dealerName
        dealer.setDealerName(parts[1]);
        dealer.setDealerDescription("");
        return dealer;
    }
}
