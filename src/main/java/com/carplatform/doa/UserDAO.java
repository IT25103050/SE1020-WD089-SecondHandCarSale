package com.carplatform.dao;

import com.carplatform.model.*;
import com.carplatform.util.FileHandler;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class UserDAO {

    private static final String FILE_PATH = "c:/Users/aruno/Desktop/untitled/src/main/webapp/WEB-INF/data/users.txt";

    public List<User> getAllUsers() {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<User> users = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.trim().isEmpty()) continue;
            String[] parts = line.split("\\|");
            if (parts.length < 10) continue;
            {
                String userId = safeGet(parts, 0);
                String fullName = safeGet(parts, 1);
                String email = safeGet(parts, 2);
                String passwordHash = safeGet(parts, 3);
                String phone = safeGet(parts, 4);
                String address = safeGet(parts, 5);
                String role = safeGet(parts, 6);
                String accountStatus = safeGet(parts, 7);
                String approvalStatus = safeGet(parts, 8);
                String createdAt = safeGet(parts, 9);

                User user = createUserInstance(role);
                user.setUserId(userId);
                user.setFullName(fullName);
                user.setEmail(email);
                user.setPasswordHash(passwordHash);
                user.setPhone(phone);
                user.setAddress(address);
                user.setRole(role);
                user.setAccountStatus(accountStatus);
                user.setApprovalStatus(approvalStatus);
                user.setCreatedAt(createdAt);

                users.add(user);
            }
        }
        return users;
    }

    public User getUserById(String userId) {
        if (userId == null) return null;
        for (User user : getAllUsers()) {
            if (userId.equalsIgnoreCase(user.getUserId())) {
                return user;
            }
        }
        return null;
    }

    public User getUserByEmail(String email) {
        if (email == null) return null;
        for (User user : getAllUsers()) {
            if (email.equalsIgnoreCase(user.getEmail())) {
                return user;
            }
        }
        return null;
    }

    public void saveUser(User user) {
        if (user == null) return;
        FileHandler.writeLine(FILE_PATH, user.toFileString());
    }

    public void updateUser(User updatedUser) {
        if (updatedUser == null || updatedUser.getUserId() == null) return;
        List<User> users = getAllUsers();
        List<String> newLines = new ArrayList<>();
        for (User user : users) {
            if (user.getUserId().equalsIgnoreCase(updatedUser.getUserId())) {
                newLines.add(updatedUser.toFileString());
            } else {
                newLines.add(user.toFileString());
            }
        }
        FileHandler.overwriteFile(FILE_PATH, newLines);
    }

    public void deleteUser(String userId) {
        if (userId == null) return;
        List<User> users = getAllUsers();
        List<String> newLines = new ArrayList<>();
        for (User user : users) {
            if (!user.getUserId().equalsIgnoreCase(userId)) {
                newLines.add(user.toFileString());
            }
        }
        FileHandler.overwriteFile(FILE_PATH, newLines);
    }

    public List<User> getPendingDealers() {
        List<User> pending = new ArrayList<>();
        for (User user : getAllUsers()) {
            if ("Dealer".equalsIgnoreCase(user.getRole()) && "PENDING".equalsIgnoreCase(user.getApprovalStatus())) {
                pending.add(user);
            }
        }
        return pending;
    }

    private User createUserInstance(String role) {
        return new User() {
            @Override
            public String getDashboardName() {
                return role + " Dashboard";
            }

            @Override
            public String displayUserInfo() {
                return getFullName() + " (" + role + ")";
            }
        };
    }

    private String safeGet(String[] parts, int index) {
        return index < parts.length ? parts[index].trim() : "";
    }

    public boolean emailExists(String email) {
        return getUserByEmail(email) != null;
    }

    public void updateApprovalStatus(String userId, String status) {
        User user = getUserById(userId);
        if (user != null) {
            user.setApprovalStatus(status);
            updateUser(user);
        }
    }

    public void updateAccountStatus(String userId, String status) {
        User user = getUserById(userId);
        if (user != null) {
            user.setAccountStatus(status);
            updateUser(user);
        }
    }

    public List<User> getUsersByRole(String role) {
        List<User> result = new ArrayList<>();
        for (User user : getAllUsers()) {
            if (role != null && role.equalsIgnoreCase(user.getRole())) {
                result.add(user);
            }
        }
        return result;
    }
}
