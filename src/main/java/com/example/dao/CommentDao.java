package com.example.dao;

import com.example.model.Comment;
import com.example.model.Review;
import com.example.model.User;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class CommentDao {

    private Connection conn;

    public CommentDao(Connection conn) {
        this.conn = conn;
    }

    // Fetch all comments for a review
    public List<Comment> getCommentsByReviewId(int reviewId) throws SQLException {
        List<Comment> comments = new ArrayList<>();
        String sql = "SELECT * FROM comments WHERE review_id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, reviewId);
            try (ResultSet rs = stmt.executeQuery()) {
                while (rs.next()) {
                    Comment comment = new Comment();
                    comment.setId(rs.getInt("id"));
                    comment.setUserId(rs.getInt("user_id"));
                    comment.setReviewId(rs.getInt("review_id"));
                    comment.setContent(rs.getString("content"));
                    comment.setParentId(rs.getInt("parent_id"));
                    comment.setLikesCount(rs.getInt("likes_count"));
                    comments.add(comment);
                }
            }
        }
        return comments;
    }

    // Insert a new comment
    public void addComment(Comment comment) throws SQLException {
        String sql = "INSERT INTO comments (user_id, review_id, content, parent_id, likes_count) VALUES (?, ?, ?, ?, ?)";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, comment.getUserId());
            stmt.setInt(2, comment.getReviewId());
            stmt.setString(3, comment.getContent());
            stmt.setObject(4, comment.getParentId(), Types.INTEGER);  // Handle null parentId
            stmt.setInt(5, comment.getLikesCount());
            stmt.executeUpdate();
        }
    }

    // Get the parent comment
    public Comment getParentComment(int parentId) throws SQLException {
        Comment comment = null;
        String sql = "SELECT * FROM comments WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, parentId);
            try (ResultSet rs = stmt.executeQuery()) {
                if (rs.next()) {
                    comment = new Comment();
                    comment.setId(rs.getInt("id"));
                    comment.setUserId(rs.getInt("user_id"));
                    comment.setReviewId(rs.getInt("review_id"));
                    comment.setContent(rs.getString("content"));
                    comment.setParentId(rs.getInt("parent_id"));
                    comment.setLikesCount(rs.getInt("likes_count"));
                }
            }
        }
        return comment;
    }

    // Like a comment (increment likes_count)
    public void likeComment(int commentId) throws SQLException {
        String sql = "UPDATE comments SET likes_count = likes_count + 1 WHERE id = ?";
        try (PreparedStatement stmt = conn.prepareStatement(sql)) {
            stmt.setInt(1, commentId);
            stmt.executeUpdate();
        }
    }
}
