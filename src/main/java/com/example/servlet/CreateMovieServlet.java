package com.example.servlet;

import com.example.dao.MovieDAO;
import com.example.model.Movie;
import com.example.util.DBUtil;
import jakarta.servlet.RequestDispatcher;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

@WebServlet("/posts/create")
@MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
        maxFileSize = 1024 * 1024 * 10, // 10MB
        maxRequestSize = 1024 * 1024 * 50) // 50MB
public class CreateMovieServlet extends HttpServlet {
  private MovieDAO movieDAO;

  @Override
  public void init() throws ServletException {
    try {
      movieDAO = new MovieDAO(DBUtil.getConnection());
    } catch (SQLException e) {
      throw new RuntimeException(e);
    }
  }

  @Override
  protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    RequestDispatcher dispatcher = request.getRequestDispatcher("posts/create.jsp");
    dispatcher.forward(request, response);
  }

  @Override
  protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    HttpSession session = request.getSession();
    Integer userId = (Integer) session.getAttribute("user_id");

    if (userId == null) {
      response.sendRedirect("/login");
      return;
    }



    String title = request.getParameter("title");
    String description = request.getParameter("description");
    String releaseDate = request.getParameter("release_date");

    // Handle image upload
    Part filePart = request.getPart("image");
    String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
    String uploadPath = getServletContext().getRealPath("/images");
    File uploadDir = new File(uploadPath);

    if (!uploadDir.exists()) {
      uploadDir.mkdirs();
    }

    String filePath = uploadPath + File.separator + fileName;
    filePart.write(filePath);

    String image = "images/" + fileName;

    // Debugging: Print out the upload path and file path
    System.out.println("Image uploaded to: " + filePath);

    Movie movie = new Movie(title, description, releaseDate, image, userId);
    boolean isAdded = movieDAO.addMovie(movie);

    List<Movie> moviesTest = movieDAO.getAllMovies();
    System.out.println("Movies retrieved: " + moviesTest.size());
    for (Movie movieIT : moviesTest) {
      System.out.println(movieIT.getTitle());
    }
    request.setAttribute("movies", moviesTest);


    if (isAdded) {
      response.sendRedirect(request.getContextPath() + "/posts/index.jsp");
    } else {
      request.setAttribute("error", "Failed to add movie");
      RequestDispatcher dispatcher = request.getRequestDispatcher("/create.jsp");
      dispatcher.forward(request, response);
    }
  }
}