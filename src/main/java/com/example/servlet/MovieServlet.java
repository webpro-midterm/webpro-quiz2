package com.example.servlet;

import com.example.dao.MovieDAO;
import com.example.model.Movie;
import com.example.util.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.File;
import java.io.IOException;
import java.nio.file.Paths;
import java.sql.SQLException;
import java.util.List;

public class MovieServlet extends HttpServlet {
    private MovieDAO movieDAO;

    @Override
    public void init() throws ServletException {
        try {
            movieDAO = new MovieDAO(DBUtil.getConnection());
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    // Show the list of all movies
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movies = movieDAO.getAllMovies();
        request.setAttribute("movies", movies);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
        dispatcher.forward(request, response);
    }

    // Show the form for creating a new movie
    @WebServlet("/posts/create")
    @MultipartConfig(fileSizeThreshold = 1024 * 1024 * 2, // 2MB
            maxFileSize = 1024 * 1024 * 10, // 10MB
            maxRequestSize = 1024 * 1024 * 50) // 50MB
    public static class CreateMovieServlet extends HttpServlet {
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
            RequestDispatcher dispatcher = request.getRequestDispatcher("/create");
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
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            String image = "images/" + fileName;

            Movie movie = new Movie(title, description, releaseDate, image, userId);
            boolean isAdded = movieDAO.addMovie(movie);

            if (isAdded) {
                response.sendRedirect(request.getContextPath() + "/posts");
            } else {
                request.setAttribute("error", "Failed to add movie");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/create");
                dispatcher.forward(request, response);
            }
        }
    }

    // Show the form for editing an existing movie
    @WebServlet("/movies/edit")
    @MultipartConfig
    public static class EditMovieServlet extends HttpServlet {
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
            int movieId = Integer.parseInt(request.getParameter("id"));
            Movie movie = movieDAO.getMovieById(movieId);
            request.setAttribute("movie", movie);
            RequestDispatcher dispatcher = request.getRequestDispatcher("/edit.jsp");
            dispatcher.forward(request, response);
        }

        @Override
        protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
            HttpSession session = request.getSession();
            String userIdParam = request.getParameter("user_id");

            if (userIdParam == null || userIdParam.isEmpty()) {
                response.sendRedirect("/login");
                return;
            }

            int userId;
            try {
                userId = Integer.parseInt(userIdParam);
            } catch (NumberFormatException e) {
                response.sendRedirect("/login");
                return;
            }

            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String releaseDate = request.getParameter("release_date");

            // Handle image upload
            Part filePart = request.getPart("image");
            String fileName = Paths.get(filePart.getSubmittedFileName()).getFileName().toString();
            String uploadPath = getServletContext().getRealPath("") + File.separator + "images";
            File uploadDir = new File(uploadPath);

            if (!uploadDir.exists()) {
                uploadDir.mkdirs();
            }

            String filePath = uploadPath + File.separator + fileName;
            filePart.write(filePath);

            String image = "images/" + fileName;

            Movie movie = new Movie(id, title, description, releaseDate, image, userId);
            boolean isUpdated = movieDAO.updateMovie(movie);

            if (isUpdated) {
                response.sendRedirect("/posts");
            } else {
                request.setAttribute("error", "Failed to update movie");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/edit.jsp");
                dispatcher.forward(request, response);
            }
        }
    }

    // Delete a movie
    @WebServlet("/posts/delete")
    public static class DeleteMovieServlet extends HttpServlet {
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
            int movieId = Integer.parseInt(request.getParameter("id"));
            boolean isDeleted = movieDAO.deleteMovie(movieId);

            if (isDeleted) {
                response.sendRedirect("/movies");
            } else {
                request.setAttribute("error", "Failed to delete movie");
                RequestDispatcher dispatcher = request.getRequestDispatcher("/index.jsp");
                dispatcher.forward(request, response);
            }
        }
    }
}
