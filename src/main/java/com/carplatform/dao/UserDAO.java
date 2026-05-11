package com.carplatform.dao;

import com.carplatform.model.*;
import com.carplatform.util.FileHandler;
import com.carplatform.util.PasswordUtil;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

public class UserDAO {

    private final String FILE_PATH;

    public UserDAO(String filePath) {
        this.FILE_PATH = filePath;
        FileHandler.ensureFileExists(FILE_PATH);
    }

    // ----------------------------------------------------------------
    // Parse a single line from users.txt into a User object
    // ----------------------------------------------------------------
    private User parseLine(String line) {
        if (line == null || line.trim().isEmpty()) return null;

        String[] parts = line.split("\\|");

        if (parts.length < 10) return null; // Validate array length

        String userId        = parts[0].trim();
        String fullName      = parts[1].trim();
        String email         = parts[2].trim();
        String passwordHash  = parts[3].trim();
        String phone         = parts[4].trim();
        String address       = parts[5].trim();
        String role          = parts[6].trim();
        String accountStatus = parts[7].trim();
        String approvalStatus= parts[8].trim();
        String createdAt     = parts[9].trim();

        switch (role) {
            case "Buyer":
                return new Buyer(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
            case "Seller":
                return new Seller(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
            case "Dealer":
                return new Dealer(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
            case "Admin":
                return new Admin(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
            default:
                return null;
        }
    }

    // ----------------------------------------------------------------
    // Add a new user - appends a line to users.txt
    // ----------------------------------------------------------------
    public void addUser(User user) {
        FileHandler.writeLine(FILE_PATH, user.toFileString());
    }

    // ----------------------------------------------------------------
    // Get all users from users.txt
    // ----------------------------------------------------------------
    public List<User> getAllUsers() {
        List<User> users = new ArrayList<>();
        List<String> lines = FileHandler.readAllLines(FILE_PATH);

        for (String line : lines) {
            User user = parseLine(line);
            if (user != null) {
                users.add(user);
            }
        }

        return users;
    }

    // ----------------------------------------------------------------
    // Get a user by their userId
    // ----------------------------------------------------------------
    public User getUserById(String userId) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 1 && parts[0].trim().equals(userId)) {
                return parseLine(line);
            }
        }

        return null;
    }

    // ----------------------------------------------------------------
    // Get a user by their email
    // ----------------------------------------------------------------
    public User getUserByEmail(String email) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 3 && parts[2].trim().equalsIgnoreCase(email)) {
                return parseLine(line);
            }
        }

        return null;
    }

    // ----------------------------------------------------------------
    // Update an existing user's record in users.txt
    // ----------------------------------------------------------------
    public void updateUser(User user) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 1 && parts[0].trim().equals(user.getUserId())) {
                updatedLines.add(user.toFileString()); // Replace with updated data
            } else {
                updatedLines.add(line);
            }
        }

        FileHandler.overwriteFile(FILE_PATH, updatedLines);
    }

    // ----------------------------------------------------------------
    // Deactivate a user by setting accountStatus to Inactive
    // ----------------------------------------------------------------
    public void deactivateUser(String userId) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 8 && parts[0].trim().equals(userId)) {
                parts[7] = "Inactive"; // Update accountStatus
                updatedLines.add(String.join("|", parts));
            } else {
                updatedLines.add(line);
            }
        }

        FileHandler.overwriteFile(FILE_PATH, updatedLines);
    }

    // ----------------------------------------------------------------
    // Delete a user completely from users.txt
    // ----------------------------------------------------------------
    public void deleteUser(String userId) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 1 && !parts[0].trim().equals(userId)) {
                updatedLines.add(line); // Keep lines that don't match
            }
        }

        FileHandler.overwriteFile(FILE_PATH, updatedLines);
    }

    // ----------------------------------------------------------------
    // Validate login by email and password
    // Returns the User if valid, null otherwise
    // ----------------------------------------------------------------
    public User validateLogin(String email, String password) {
        User user = getUserByEmail(email);

        if (user == null) return null;
        if (!PasswordUtil.checkPassword(password, user.getPasswordHash())) return null;

        return user;
    }

    // ----------------------------------------------------------------
    // Check if an email already exists in users.txt
    // ----------------------------------------------------------------
    public boolean isEmailExists(String email) {
        return getUserByEmail(email) != null;
    }

    // ----------------------------------------------------------------
    // Get all users with a specific role
    // ----------------------------------------------------------------
    public List<User> getUsersByRole(String role) {
        List<User> result = new ArrayList<>();
        List<User> allUsers = getAllUsers();

        for (User user : allUsers) {
            if (user.getRole().equalsIgnoreCase(role)) {
                result.add(user);
            }
        }

        return result;
    }

    // ----------------------------------------------------------------
    // Approve a user by setting approvalStatus to Approved
    // ----------------------------------------------------------------
    public void approveUser(String userId) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 9 && parts[0].trim().equals(userId)) {
                parts[8] = "Approved"; // Update approvalStatus
                updatedLines.add(String.join("|", parts));
            } else {
                updatedLines.add(line);
            }
        }

        FileHandler.overwriteFile(FILE_PATH, updatedLines);
    }

    // ----------------------------------------------------------------
    // Reject a user by setting approvalStatus to Rejected
    // ----------------------------------------------------------------
    public void rejectUser(String userId) {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<String> updatedLines = new ArrayList<>();

        for (String line : lines) {
            String[] parts = line.split("\\|");
            if (parts.length >= 9 && parts[0].trim().equals(userId)) {
                parts[8] = "Rejected"; // Update approvalStatus
                updatedLines.add(String.join("|", parts));
            } else {
                updatedLines.add(line);
            }
        }

        FileHandler.overwriteFile(FILE_PATH, updatedLines);
    }
}
