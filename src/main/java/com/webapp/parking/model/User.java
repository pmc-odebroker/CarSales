package com.webapp.parking.model;

public class User {
    private int userId;
    private String name;
    private String email;
    private String role;
    private String status;

    // Constructor, getters, and setters
    public User(int userId, String name, String email, String role, String status) {
        this.userId = userId;
        this.name = name;
        this.email = email;
        this.role = role;
        this.status = status;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    @Override
    public String toString() {
        return "{id=" + userId + ", name='" + name + "', email='" + email + "', role='" + role + "', status='" + status + "'}";
    }

}
