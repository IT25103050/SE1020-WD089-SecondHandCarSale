package com.carplatform.util;

/**
 * ValidationUtil utility class.
 * Provides basic validation methods for seller/dealer profile fields.
 */
public class ValidationUtil {

    /**
     * Checks if a string is null or empty (after trimming).
     */
    public static boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Validates phone number format.
     * Must start with 0 and be 10 digits long.
     */
    public static boolean isValidPhone(String phone) {
        if (isEmpty(phone)) {
            return false;
        }
        return phone.matches("^0\\d{9}$");
    }

    /**
     * Validates email format using a basic pattern.
     */
    public static boolean isValidEmail(String email) {
        if (isEmpty(email)) {
            return false;
        }
        return email.matches("^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$");
    }

    /**
     * Validates that address is not empty and has reasonable length.
     */
    public static boolean isValidAddress(String address) {
        if (isEmpty(address)) {
            return false;
        }
        return address.trim().length() >= 3 && address.trim().length() <= 200;
    }
}
