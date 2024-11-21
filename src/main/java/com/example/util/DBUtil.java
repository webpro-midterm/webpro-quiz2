package com.example.util;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBUtil {

    private static final String DB_URL = "jdbc:mysql://localhost:3306/webpro-quiz2";  // Replace with your DB URL
    private static final String DB_USER = "root";  // Replace with your DB user
    private static final String DB_PASSWORD = "";  // Replace with your DB password

    // Method to establish a connection
    public static Connection getConnection() throws SQLException {
        try {
            // Load MySQL JDBC driver (optional for some configurations)
            Class.forName("com.mysql.cj.jdbc.Driver");
            return DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
        } catch (ClassNotFoundException | SQLException e) {
            e.printStackTrace();
            throw new SQLException("Database connection failed.", e);
        }
    }
}
