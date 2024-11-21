package com.example.model;

import java.util.List;

public class Comment {
    private int id;
    private int userId;
    private int reviewId;
    private String content;
    private Integer parentId;  // Can be null for top-level comments
    private int likesCount;

    // Getters and setters
    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public int getReviewId() {
        return reviewId;
    }

    public void setReviewId(int reviewId) {
        this.reviewId = reviewId;
    }

    public String getContent() {
        return content;
    }

    public void setContent(String content) {
        this.content = content;
    }

    public Integer getParentId() {
        return parentId;
    }

    public void setParentId(Integer parentId) {
        this.parentId = parentId;
    }

    public int getLikesCount() {
        return likesCount;
    }

    public void setLikesCount(int likesCount) {
        this.likesCount = likesCount;
    }

    // Relationships (methods to be handled in DAO, not in this class)
    public List<Comment> getReplies() {
        // Return replies if any; DAO logic needed here
        return null;
    }

    public Comment getParent() {
        // Return the parent comment if any; DAO logic needed here
        return null;
    }

    public User getUser() {
        // Return the user who created the comment; DAO logic needed here
        return null;
    }

    public Review getReview() {
        // Return the review to which this comment belongs; DAO logic needed here
        return null;
    }
}
