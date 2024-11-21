package com.example.dao;

import com.example.model.Movie;
import com.example.model.Review;
import com.example.model.User;
import com.example.util.DBUtil;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

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
        System.out.println("Received password from DAO: " + password);
        return new User(username, password, email);
      }
    } catch (SQLException e) {
      e.printStackTrace();
      System.out.println("nothing");
    }
    return null;
  }

  public User getUserFromEmail(String theEmail, String thePassword) {
    if (connection == null) {
      System.out.println("Database connection is not initialized!");
      return null;
    }
    String sqlQuery = "SELECT id, email, username, password FROM users WHERE email = ? AND password = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setString(1, theEmail);
      statement.setString(2, thePassword);
      System.out.println("Executing query: " + sqlQuery);
      ResultSet result = statement.executeQuery();
      if (result.next()) {
        System.out.println("User found in database.");
        // Fetch fields from the database
        int id = result.getInt("id"); // Get user ID
        String email = result.getString("email");
        String username = result.getString("username");
        String password = result.getString("password");

        // Log the retrieved values for debugging
        System.out.println("ID: " + id + ", Email: " + email + ", Username: " + username);

        // Create and return a User object with the ID
        return new User(id, username, password, email);
      }
    } catch (SQLException e) {
      e.printStackTrace();
      System.out.println("Error occurred while fetching user.");
    }
    return null; // Return null if no user is found
  }



  public User getUserById(int userId){
    String sql = "SELECT * FROM users WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
      statement.setInt(1, userId);
      ResultSet resultSet = statement.executeQuery();
      if(resultSet.next()){
        return new User(
                resultSet.getInt("id"),
                resultSet.getString("name"),
                resultSet.getString("email"),
                resultSet.getString("password")
        );
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }

  public Movie getMovieById(int id) {
    String sql = "SELECT * FROM movies WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sql)) {
      statement.setInt(1, id);
      ResultSet resultSet = statement.executeQuery();
      if (resultSet.next()) {
        Movie movie = new Movie(resultSet.getInt("id"), resultSet.getString("title"),
                resultSet.getString("description"), resultSet.getString("release_date"),
                resultSet.getString("image"), resultSet.getInt("user_id"));

        movie.setReviews(getReviewsForMovie(id));
        return movie;
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return null;
  }

  public List<Review> getReviewsForMovie(int movieID) {
    List<Review> reviews = new ArrayList<>();
    String sqlQuery = "SELECT * FROM reviews WHERE movie_id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setInt(1, movieID);
      ResultSet result = statement.executeQuery();

      while(result.next()){
        int user_id = result.getInt("user_id");
        String content = result.getString("content");
        int rating = result.getInt("rating");
        int movie_id = result.getInt(("movie_id"));
        Movie movie = getMovieById(movie_id);
        User user = getUserById(user_id);

        Review review = new Review(user_id, content, rating, movie_id, movie.getTitle(), movie, user);
        reviews.add(review);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
    return reviews;
  }
}
