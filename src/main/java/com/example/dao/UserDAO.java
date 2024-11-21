package com.example.dao;

import com.example.model.User;
import com.example.util.DBUtil;

import java.sql.*;

public class UserDAO {
  private Connection connection;

  // Constructor to initialize the connection
  public UserDAO() {
    try {
      this.connection = DBUtil.getConnection();
    } catch (SQLException e) {
      e.printStackTrace();
      throw new RuntimeException("Failed to connect to the database.", e);
    }
  }

  // Register a user
  public boolean registerUser(User user) {
    if (connection == null) {
      System.out.println("Database connection is not initialized!");
      return false;
    }
    String sqlQuery = "INSERT INTO users (username, password, email) VALUES (?, ?, ?)";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setString(1, user.getUsername());
      statement.setString(2, user.getPassword());
      statement.setString(3, user.getEmail());

      int rowsAffected = statement.executeUpdate();
      return rowsAffected > 0;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
  }

  // Retrieve a user safely
  public User getUserSafe(String theUsername, String thePassword) {
    if (connection == null) {
      System.out.println("Database connection is not initialized!");
      return null;
    }
    String sqlQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setString(1, theUsername);
      statement.setString(2, thePassword);

      ResultSet result = statement.executeQuery();
      if (result.next()) {

        String email = result.getString("email");
        String username = result.getString("username");
        String password = result.getString("password"); // Correct spelling
        return new User(username, password, email);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }
}
