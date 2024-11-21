package com.example.model;

public class Review {

    private int id;
    private String content;
    private int rating;
    private int movieId;
    private String movieTitle;
    private Movie movie;  // Movie object
    private User user;    // User object

    // Modified constructor to accept Movie and User objects
    public Review(int id, String content, int rating, int movieId, String movieTitle, Movie movie, User user) {
        this.id = id;
        this.content = content;
        this.rating = rating;
        this.movieId = movieId;
        this.movieTitle = movieTitle;
        this.movie = movie;
        this.user = user;
    }

    // Getter and Setter methods
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

    public int getMovieId() {
        return movieId;
    }

    public void setMovieId(int movieId) {
        this.movieId = movieId;
    }

    public String getMovieTitle() {
        return movieTitle;
    }

    public void setMovieTitle(String movieTitle) {
        this.movieTitle = movieTitle;
    }

    public Movie getMovie() {
        return movie;
    }

    public void setMovie(Movie movie) {
        this.movie = movie;
    }

    public User getUser() {
        return user;
    }

    public void setUser(User user) {
        this.user = user;
    }
}
