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

public class RegisterServlet extends HttpServlet {
  private UserDAO userDAO = new UserDAO();

  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, ServletException, IOException {
    String username = request.getParameter("username");
    String password = request.getParameter("password");
    String email = request.getParameter("email");

    User user = new User(username, password, email);
    boolean isRegistered = userDAO.registerUser(user);
    if(isRegistered){
      response.sendRedirect("login.jsp");
    }
    else {
      request.setAttribute("errorMessage", "Registration failed. Please try again.");
      RequestDispatcher dispatcher = request.getRequestDispatcher("register.jsp");
      dispatcher.forward(request, response);
    }
  }
}
