package com.example.model;

import java.util.List;

public class User {
    private int id;
    private String name;
    private String email;
    private String password;

    // Constructor
    public User(String name, String password, String email) {
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // Constructor with 'id' for retrieving user information (e.g., login)
    public User(int id, String name, String password, String email) {
        this.id = id;
        this.name = name;
        this.email = email;
        this.password = password;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getUsername() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

}
