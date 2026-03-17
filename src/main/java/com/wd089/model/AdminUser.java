package com.wd089.model;

public class AdminUser extends User {

    public AdminUser() {
        super();
    }

    public AdminUser(int id, String userCode, String firstName, String lastName, String username,
                     String email, String phone, String password, String role, String status) {
        super(id, userCode, firstName, lastName, username, email, phone, password, role, status);
    }

    @Override
    public String getAccessType() {
        return "ADMIN_PRIVILEGES";
    }

    @Override
    public String getDisplayRole() {
        return "Admin";
    }
}