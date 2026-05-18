package com.carplatform.util;

public class ValidationUtil {

    /**
     * Checks if a string value is null, empty, or consists only of whitespace.
     */
    public static boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Validates an email address format using basic standard checks.
     */
    public static boolean isValidEmail(String email) {
        if (isEmpty(email)) return false;
        return email.contains("@") && email.contains(".");
    }

    /**
     * Checks if a string value represents a strictly positive numeric amount.
     */
    public static boolean isPositiveNumber(String value) {
        if (isEmpty(value)) return false;
        try {
            double num = Double.parseDouble(value.trim());
            return num > 0;
        } catch (NumberFormatException e) {
            return false;
        }
    }

    /**
     * Validates if a rating integer falls within the standard 1 to 5 bounds.
     */
    public static boolean isValidRating(int rating) {
        return rating >= 1 && rating <= 5;
    }
}
