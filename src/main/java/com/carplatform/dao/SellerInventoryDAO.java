package com.carplatform.dao;

import com.carplatform.model.SellerInventoryItem;
import com.carplatform.util.FileHandler;

import java.util.ArrayList;
import java.util.List;

/**
 * SellerInventoryDAO - Data Access Object for Seller/Dealer inventory.
 * Reads car data from cars.txt filtered by sellerId.
 *
 * cars.txt format:
 * carId|sellerId|brand|model|year|price|mileage|fuelType|transmission|location|condition|description|imagePath|carStatus|approvalStatus|createdAt
 */
public class SellerInventoryDAO {

    private String filePath;

    public SellerInventoryDAO(String filePath) {
        this.filePath = filePath;
    }

    /**
     * Get all inventory items for a specific seller/dealer.
     */
    public List<SellerInventoryItem> getInventoryBySellerId(String sellerId) {
        List<SellerInventoryItem> inventory = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 16 && parts[1].equals(sellerId)) {
                inventory.add(parseInventoryItem(parts));
            }
        }
        return inventory;
    }

    /**
     * Get available inventory items for a seller/dealer (carStatus = Available).
     */
    public List<SellerInventoryItem> getAvailableInventoryBySellerId(String sellerId) {
        List<SellerInventoryItem> inventory = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 16 && parts[1].equals(sellerId) && parts[13].equals("Available")) {
                inventory.add(parseInventoryItem(parts));
            }
        }
        return inventory;
    }

    /**
     * Get sold inventory items for a seller/dealer (carStatus = Sold).
     */
    public List<SellerInventoryItem> getSoldInventoryBySellerId(String sellerId) {
        List<SellerInventoryItem> inventory = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 16 && parts[1].equals(sellerId) && parts[13].equals("Sold")) {
                inventory.add(parseInventoryItem(parts));
            }
        }
        return inventory;
    }

    /**
     * Get pending inventory items for a seller/dealer (approvalStatus = Pending).
     */
    public List<SellerInventoryItem> getPendingInventoryBySellerId(String sellerId) {
        List<SellerInventoryItem> inventory = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(filePath);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 16 && parts[1].equals(sellerId) && parts[14].equals("Pending")) {
                inventory.add(parseInventoryItem(parts));
            }
        }
        return inventory;
    }

    /**
     * Count total listings for a seller/dealer.
     */
    public int countTotalListings(String sellerId) {
        return getInventoryBySellerId(sellerId).size();
    }

    /**
     * Count available listings for a seller/dealer.
     */
    public int countAvailableListings(String sellerId) {
        return getAvailableInventoryBySellerId(sellerId).size();
    }

    /**
     * Count sold listings for a seller/dealer.
     */
    public int countSoldListings(String sellerId) {
        return getSoldInventoryBySellerId(sellerId).size();
    }

    /**
     * Count pending listings for a seller/dealer.
     */
    public int countPendingListings(String sellerId) {
        return getPendingInventoryBySellerId(sellerId).size();
    }

    /**
     * Parse a line's parts into a SellerInventoryItem object.
     * cars.txt: carId|sellerId|brand|model|year|price|mileage|fuelType|transmission|location|condition|description|imagePath|carStatus|approvalStatus|createdAt
     * Index:      0      1      2     3    4     5      6        7          8          9       10         11          12        13          14            15
     */
    private SellerInventoryItem parseInventoryItem(String[] parts) {
        SellerInventoryItem item = new SellerInventoryItem();
        item.setCarId(parts[0]);
        item.setSellerId(parts[1]);
        item.setBrand(parts[2]);
        item.setModel(parts[3]);

        try {
            item.setYear(Integer.parseInt(parts[4]));
        } catch (NumberFormatException e) {
            item.setYear(0);
        }

        try {
            item.setPrice(Double.parseDouble(parts[5]));
        } catch (NumberFormatException e) {
            item.setPrice(0);
        }

        try {
            item.setMileage(Integer.parseInt(parts[6]));
        } catch (NumberFormatException e) {
            item.setMileage(0);
        }

        item.setFuelType(parts[7]);
        item.setTransmission(parts[8]);
        item.setLocation(parts[9]);
        item.setCarStatus(parts[13]);
        item.setApprovalStatus(parts[14]);
        return item;
    }
}
