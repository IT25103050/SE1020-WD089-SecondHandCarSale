package com.wd089.model;

public class RegularUser extends User {

    public RegularUser() {
        super();
    }

    public RegularUser(int id, String userCode, String firstName, String lastName, String username,
                       String email, String phone, String password, String role, String status) {
        super(id, userCode, firstName, lastName, username, email, phone, password, role, status);
    }

    @Override
    public String getAccessType() {
        return "REGULAR_USER";
    }
}