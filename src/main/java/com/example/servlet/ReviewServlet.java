package com.example.servlet;

import com.example.dao.ReviewDAO;
import com.example.model.Review;
import com.example.model.Movie;
import com.example.model.User;

import com.example.dao.CommentDao;
import com.example.dao.MovieDAO;
import com.example.model.Comment;
import com.example.model.Movie;
import com.example.model.Review;

import jakarta.servlet.*;
import jakarta.servlet.http.*;
import java.io.IOException;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.List;


public class ReviewServlet extends HttpServlet {
  private ReviewDAO reviewDAO;
  private Connection connection;

  //handle GET requests to display reviews for a specific movie
  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int movieId = Integer.parseInt(request.getParameter("movie_id"));

    //fetch reviews for the movie
    List<Review> reviews = reviewDAO.getReviewsForMovie(movieId);

    //set the reviews in request scope and forward to JSP page to display them
    request.setAttribute("reviews", reviews);
    request.getRequestDispatcher("/reviews.jsp").forward(request, response);
  }

  //handle POST requests to add a new review
  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    int userId = Integer.parseInt(request.getParameter("user_id"));
    int movieId = Integer.parseInt(request.getParameter("movie_id"));
    String content = request.getParameter("content");
    int rating = Integer.parseInt(request.getParameter("rating"));

    //create a new review object
    Review review = new Review(userId, content, rating, movieId, "", null, null);

    //call addReview method to insert the review into the database
    boolean isAdded = reviewDAO.addReview(review);

    if (isAdded) {
      response.sendRedirect("movie?id=" + movieId);
    }
    else {
      response.sendRedirect("error.jsp");
    }
  }

  @Override
  public void destroy() {
    try {
      if (connection != null) {
        connection.close();  // Close connection when servlet is destroyed
      }
    } catch (SQLException e) {
      e.printStackTrace();
    }
  }
}
