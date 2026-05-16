package com.carplatform.util;

import java.util.List;

public class IDGenerator {

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
                    }
                }
            }
        }
        return maxId + 1;
    }

    public static String generateUserId(String filePath) {
        return "USR" + getNextNumericId(filePath, "USR", 1001);
    }
}
