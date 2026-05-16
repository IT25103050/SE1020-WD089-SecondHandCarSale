package com.carplatform.util;

import java.util.List;

public class IDGenerator {

<<<<<<< HEAD
    private static int getNextNumericId(String filePath, String prefix, int defaultStart) {
        List<String> lines = FileHandler.readAllLines(filePath);
        int maxId = defaultStart - 1;
        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length > 0) {
                String idStr = parts[0].trim();
                if (idStr.startsWith(prefix)) {
                    try {
                        int num = Integer.parseInt(idStr.substring(prefix.length()));
                        if (num > maxId) {
                            maxId = num;
                        }
                    } catch (NumberFormatException ignored) {
                        // Ignore parsing exceptions for customized IDs
=======
    /**
     * Generates the next user ID in the format U001, U002, U003, etc.
     * Reads the existing users.txt file, finds the highest existing ID,
     * and returns the next one.
     */
    public static String generateUserId(String filePath) {
        List<String> lines = FileHandler.readAllLines(filePath);

        int maxId = 0;

        for (String line : lines) {
            if (line.trim().isEmpty()) continue;

            String[] parts = line.split("\\|");

            if (parts.length >= 1) {
                String idPart = parts[0].trim(); // e.g., "U001"

                if (idPart.startsWith("U")) {
                    try {
                        int num = Integer.parseInt(idPart.substring(1)); // Remove "U", parse number
                        if (num > maxId) {
                            maxId = num;
                        }
                    } catch (NumberFormatException e) {
                        // Skip invalid ID formats
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
                    }
                }
            }
        }
<<<<<<< HEAD
        return maxId + 1;
    }

    public static String generateUserId(String filePath) {
        return "USR" + getNextNumericId(filePath, "USR", 1001);
=======

        // Increment and format as U001, U002, etc.
        int nextId = maxId + 1;
        return String.format("U%03d", nextId);
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    }
}
