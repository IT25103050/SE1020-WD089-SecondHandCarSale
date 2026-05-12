package com.carplatform.dao;

import com.carplatform.model.AdminUserRecord;
import com.carplatform.util.FileHandler;
import java.util.ArrayList;
import java.util.List;

public class AdminUserDAO {
    private final String USERS_FILE;

    public AdminUserDAO(String basePath) {
        USERS_FILE = basePath + "/users.txt";
    }

    public List<AdminUserRecord> getAllUsers() {
        List<AdminUserRecord> users = new ArrayList<>();
        for (String line : FileHandler.readLines(USERS_FILE)) {
            String[] p = line.split("\\|");
            if (p.length >= 10) {
                users.add(new AdminUserRecord(p[0], p[1], p[2], p[4], p[5], p[6], p[7], p[8], p[9]));
            }
        }
        return users;
    }

    public AdminUserRecord getUserById(String userId) {
        for (AdminUserRecord u : getAllUsers()) {
            if (u.getUserId().equals(userId)) return u;
        }
        return null;
    }

    public List<AdminUserRecord> getPendingDealers() {
        List<AdminUserRecord> pending = new ArrayList<>();
        for (AdminUserRecord u : getAllUsers()) {
            if ("Dealer".equalsIgnoreCase(u.getRole()) && "Pending".equalsIgnoreCase(u.getApprovalStatus())) {
                pending.add(u);
            }
        }
        return pending;
    }

    public void approveDealer(String userId) {
        updateUserField(userId, 8, "Approved");
    }

    public void rejectDealer(String userId) {
        updateUserField(userId, 8, "Rejected");
    }

    public void deactivateUser(String userId) {
        updateUserField(userId, 7, "Inactive");
    }

    public void activateUser(String userId) {
        updateUserField(userId, 7, "Active");
    }

    public void deleteUser(String userId) {
        List<String> lines = FileHandler.readLines(USERS_FILE);
        List<String> newLines = new ArrayList<>();
        for (String line : lines) {
            if (!line.startsWith(userId + "|")) {
                newLines.add(line);
            }
        }
        FileHandler.writeLines(USERS_FILE, newLines);
    }

    private void updateUserField(String userId, int index, String newValue) {
        List<String> lines = FileHandler.readLines(USERS_FILE);
        List<String> newLines = new ArrayList<>();
        for (String line : lines) {
            String[] p = line.split("\\|");
            if (p.length >= 10 && p[0].equals(userId)) {
                p[index] = newValue;
                newLines.add(String.join("|", p));
            } else {
                newLines.add(line);
            }
        }
        FileHandler.writeLines(USERS_FILE, newLines);
    }
}
