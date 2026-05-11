package com.carplatform.util;

import java.util.regex.Pattern;

public class ValidationUtil {

    /**
     * Checks if a string value is null or empty (blank).
     */
    public static boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
     * Validates an email address using a basic regex pattern.
     */
    public static boolean isValidEmail(String email) {
        if (isEmpty(email)) return false;
        String emailRegex = "^[\\w.-]+@[\\w.-]+\\.[a-zA-Z]{2,}$";
        return Pattern.matches(emailRegex, email.trim());
    }

    /**
     * Validates a Sri Lankan phone number.
     * Accepts 10-digit numbers starting with 07.
     */
    public static boolean isValidPhone(String phone) {
        if (isEmpty(phone)) return false;
        String phoneRegex = "^07[0-9]{8}$";
        return Pattern.matches(phoneRegex, phone.trim());
    }

    /**
     * Checks if the password and confirm password fields match.
     */
    public static boolean isPasswordMatch(String password, String confirmPassword) {
        if (isEmpty(password) || isEmpty(confirmPassword)) return false;
        return password.equals(confirmPassword);
    }
}
