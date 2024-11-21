package com.example.servlet;

import com.example.dao.CommentDao;
import com.example.dao.MovieDAO;
import com.example.model.Comment;
import com.example.model.Movie;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.util.List;

public class CommentServlet extends HttpServlet {
    private Connection conn;

    public CommentServlet() {
        // Initialize your database connection here (e.g., using JDBC)
    }

    // Display comments for a specific review
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int reviewId = Integer.parseInt(request.getParameter("reviewId"));
        CommentDao commentDao = new CommentDao(conn);
        try {
            List<Comment> comments = commentDao.getCommentsByReviewId(reviewId);
            request.setAttribute("comments", comments);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/WEB-INF/views/comments.jsp");
            dispatcher.forward(request, response);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }

    // Add a new comment
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        int userId = Integer.parseInt(request.getParameter("userId"));
        int reviewId = Integer.parseInt(request.getParameter("reviewId"));
        String content = request.getParameter("content");
        int parentId = Integer.parseInt(request.getParameter("parentId"));
        int likesCount = 0; // Initially no likes

        Comment comment = new Comment();
        comment.setUserId(userId);
        comment.setReviewId(reviewId);
        comment.setContent(content);
        comment.setParentId(parentId);
        comment.setLikesCount(likesCount);

        CommentDao commentDao = new CommentDao(conn);
        try {
            commentDao.addComment(comment);
            response.sendRedirect("comments?reviewId=" + reviewId);
        } catch (Exception e) {
            e.printStackTrace();
            response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
        }
    }
}
