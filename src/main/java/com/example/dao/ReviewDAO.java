package com.example.dao;

import com.example.model.Movie;
import com.example.model.Review;
import com.example.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ReviewDAO {
  private Connection connection;

  public ReviewDAO (Connection connection){
    this.connection = connection;
  }

  public boolean addReview(Review review) {
    String sqlQuery = "INSERT INTO reviews (user_id, movie_id, content, rating) VALUES (?, ?, ?, ?)";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setInt(1, review.getUserId());
      statement.setInt(2,review.getMovieId());
      statement.setString(3, review.getContent());
      statement.setInt(4, review.getRating());
      int rowsAffected = statement.executeUpdate();
      return rowsAffected > 0;
    } catch (SQLException e) {
      e.printStackTrace();
      return false;
    }
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

  public Review getReviewById(int review_id){
    String sqlQuery = "SELECT * FROM reviews WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setInt(1, review_id);
      ResultSet result = statement.executeQuery();
      if(result.next()){
        int user_id = result.getInt("user_id");
        int movie_id = result.getInt("movie_id");
        String content = result.getString("content");
        int rating = result.getInt("rating");
        Date createdAt = result.getDate("created_at");

        // Fetch the associated movie and user
        Movie movie = getMovieById(movie_id); // You should have a method to fetch movie
        User user = getUserById(user_id);     // You should have a method to fetch user

        return new Review(user_id, content, rating, movie_id, movie.getTitle(), movie, user);
      }
    } catch (SQLException e) {
      throw new RuntimeException(e);
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

  public boolean updateReview(int reviewId, String newContent, int newRating) {
    String sqlQuery = "UPDATE reviews SET content = ?, rating = ? WHERE id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setString(1, newContent);
      statement.setInt(2, newRating);
      statement.setInt(3, reviewId);
      int rowsAffected = statement.executeUpdate();
      return rowsAffected > 0;
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }

  public boolean deleteReview(int reviewId, int userId) {
    String sqlQuery = "DELETE FROM reviews WHERE id = ? AND user_id = ?";
    try (PreparedStatement statement = connection.prepareStatement(sqlQuery)) {
      statement.setInt(1, reviewId);
      statement.setInt(2, userId); // Make sure the user is the one who created the review
      int rowsAffected = statement.executeUpdate();
      return rowsAffected > 0;
    } catch (SQLException e) {
      e.printStackTrace();
    }
    return false;
  }
}
