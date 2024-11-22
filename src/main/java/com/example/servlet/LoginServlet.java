package com.example.servlet;

import com.example.dao.UserDAO;
import com.example.model.Movie;
import com.example.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

public class LoginServlet extends HttpServlet {
  private UserDAO userDAO = new UserDAO();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
    // Get the parameters from the form
    String email = request.getParameter("email");
    String password = request.getParameter("password");

    System.out.println("Received email: " + email);
    System.out.println("Received password: " + password);
    // Try to get the user from the database using the DAO
    User user = userDAO.getUserFromEmail(email, password);



    System.out.println("User retrieved: " + (user != null ? user.getUsername() : "null"));
    if (user != null) {
      // If the user exists, store the user in the session
      HttpSession session = request.getSession();
      session.setAttribute("user", user);
      session.setAttribute("user_id", user.getId());
      System.out.println("user id = " + user.getId());
      System.out.println("email = " + user.getEmail());
      // Redirect to the welcome page or home page
      response.sendRedirect("dashboard.jsp");
    } else {
      // If login fails, redirect back to the login page with an error message
      request.setAttribute("errorMessage", "Invalid username or password");
      RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
      dispatcher.forward(request, response);
    }
  }
}
