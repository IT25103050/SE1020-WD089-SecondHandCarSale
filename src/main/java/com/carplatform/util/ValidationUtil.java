package com.carplatform.util;

<<<<<<< HEAD
public class ValidationUtil {

    /**
     * Checks if a string value is null, empty, or consists only of whitespace.
=======
import java.util.regex.Pattern;

public class ValidationUtil {

    /**
     * Checks if a string value is null or empty (blank).
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
     */
    public static boolean isEmpty(String value) {
        return value == null || value.trim().isEmpty();
    }

    /**
<<<<<<< HEAD
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
=======
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
>>>>>>> 72867b429e0544ccbb50deb5367d8f96de89429c
    }
}
