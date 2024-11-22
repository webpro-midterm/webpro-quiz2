package com.example.model;

import java.io.File;
import java.util.List;

public class Movie {
    private int id;
    private String title;
    private String description;
    private String releaseDate;
    private String image;
    private int userId;
    private List<Review> reviews; // List of reviews related to the movie

    // Constructor
    public Movie(int id, String title, String description, String releaseDate, String image, int userId) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.releaseDate = releaseDate;
        this.image = image;
        this.userId = userId;
    }

    public Movie(String title, String description, String releaseDate, String image, int userId) {
        this.title = title;
        this.description = description;
        this.releaseDate = releaseDate;
        this.image = image;
        this.userId = userId;
    }

    // Getters and Setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getReleaseDate() {
        return releaseDate;
    }

    public void setReleaseDate(String releaseDate) {
        this.releaseDate = releaseDate;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public List<Review> getReviews() {
        return reviews;
    }

    public void setReviews(List<Review> reviews) {
        this.reviews = reviews;
    }

    // New method to get the image path
    public String getImagePath() {
        // Path where images are stored in the project
        String imagesFolder = "D:/ITS/Study/Semester 3/Web Programming/Quiz2/quiz2-webpro/target/quiz2-webpro-1.0-SNAPSHOT/images/";
        File imageFile = new File(imagesFolder, this.image);

        if (!imageFile.exists()) {
            // Handle missing image, e.g., return a default image path
            return "/images/default.jpg";  // Default image path
        }
        return "/images/" + this.image; // Correct image path
    }
}
