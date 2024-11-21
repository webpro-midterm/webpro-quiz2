package com.example.servlet;

import com.example.dao.UserDAO;
import com.example.model.User;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

public class LoginServlet extends HttpServlet {
  private UserDAO userDAO = new UserDAO();

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
    // Get the parameters from the form
    String username = request.getParameter("username");
    String password = request.getParameter("password");

    // Try to get the user from the database using the DAO
    User user = userDAO.getUserSafe(username, password);

    if (user != null) {
      // If the user exists, store the user in the session
      HttpSession session = request.getSession();
      session.setAttribute("user", user);

      // Redirect to the welcome page or home page
      response.sendRedirect("welcome.jsp");
    } else {
      // If login fails, redirect back to the login page with an error message
      request.setAttribute("errorMessage", "Invalid username or password");
      RequestDispatcher dispatcher = request.getRequestDispatcher("login.jsp");
      dispatcher.forward(request, response);
    }
  }
}
