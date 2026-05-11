package com.carplatform.util;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class PasswordUtil {

    /**
     * Hashes a plain text password using SHA-256.
     * Returns the hashed password as a hexadecimal string.
     */
    public static String hashPassword(String password) {
        try {
            MessageDigest digest = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = digest.digest(password.getBytes());

            // Convert byte array to hexadecimal string
            StringBuilder hexString = new StringBuilder();
            for (byte b : hashBytes) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) {
                    hexString.append('0');
                }
                hexString.append(hex);
            }

            return hexString.toString();

        } catch (NoSuchAlgorithmException e) {
            System.out.println("PasswordUtil - SHA-256 algorithm not found.");
            e.printStackTrace();
            return null;
        }
    }

    /**
     * Checks if a plain text password matches a stored hashed password.
     * Hashes the plain password and compares with the stored hash.
     */
    public static boolean checkPassword(String plainPassword, String hashedPassword) {
        String hashedInput = hashPassword(plainPassword);
        if (hashedInput == null) return false;
        return hashedInput.equals(hashedPassword);
    }
}
