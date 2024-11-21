package com.example.dao;

import com.example.model.Movie;
import com.example.model.Review;
import com.example.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MovieDAO {
    private Connection connection;

    public MovieDAO(Connection connection) {
        this.connection = connection;
    }

    public boolean addMovie(Movie movie) {
        String sql = "INSERT INTO movies (title, description, release_date, image, user_id) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getDescription());
            statement.setString(3, movie.getReleaseDate());
            statement.setString(4, movie.getImage());
            statement.setInt(5, movie.getUserId());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
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

    public User getUserByID(int userId){
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

    public List<Movie> getAllMovies() {
        List<Movie> movies = new ArrayList<>();
        String sql = "SELECT * FROM movies";
        try (Statement statement = connection.createStatement()) {
            ResultSet resultSet = statement.executeQuery(sql);
            while (resultSet.next()) {
                Movie movie = new Movie(resultSet.getInt("id"), resultSet.getString("title"),
                        resultSet.getString("description"), resultSet.getString("release_date"),
                        resultSet.getString("image"), resultSet.getInt("user_id"));
                movie.setReviews(getReviewsForMovie(movie.getId()));
                movies.add(movie);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return movies;
    }

    public boolean updateMovie(Movie movie) {
        String sql = "UPDATE movies SET title = ?, description = ?, release_date = ?, image = ?, user_id = ? WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setString(1, movie.getTitle());
            statement.setString(2, movie.getDescription());
            statement.setString(3, movie.getReleaseDate());
            statement.setString(4, movie.getImage());
            statement.setInt(5, movie.getUserId());
            statement.setInt(6, movie.getId());

            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    public boolean deleteMovie(int id) {
        String sql = "DELETE FROM movies WHERE id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, id);
            return statement.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }

    private List<Review> getReviewsForMovie(int movieId) {
        List<Review> reviews = new ArrayList<>();
        String sql = "SELECT * FROM reviews WHERE movie_id = ?";
        try (PreparedStatement statement = connection.prepareStatement(sql)) {
            statement.setInt(1, movieId);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {
                int userId = resultSet.getInt("user_id");
                User user = getUserByID(userId);
                Movie movie = getMovieById(movieId);
                reviews.add(new Review(resultSet.getInt("id"), resultSet.getString("content"),
                        resultSet.getInt("rating"), resultSet.getInt("movie_id"),
                        resultSet.getString("title"), movie, user));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return reviews;
    }
}
