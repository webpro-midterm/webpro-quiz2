package com.example.dao;

import com.example.model.User;

import java.sql.*;

public class UserDAO {
  private Connection connection;

  public boolean registerUser(User user){
    String sqlQuery = "INSERT INTO users (username, password, email) VALUES (? ? ?)";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)){
      statement.setString(1, user.getUsername());
      statement.setString(2, user.getPassword());
      statement.setString(3, user.getEmail());

      int rowsAffected = statement.executeUpdate();
      return rowsAffected > 0;
    } catch (SQLException e){
      e.printStackTrace();
      return false;
    }
  }

  public User getUserSafe(String theUsername, String thePassword){
    String sqlQuery = "SELECT * FROM users WHERE username = ? AND password = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)){
      statement.setString(1, theUsername);
      statement.setString(2, thePassword);

      ResultSet result = statement.executeQuery();
      if(result.next()){
        int id = result.getInt("id");
        String email = result.getString("email");
        String username = result.getString("username");
        String password = result.getString("passowrd");
        return new User(id, username, password, email);
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }
}
