package com.example.servlet;

import com.example.dao.MovieDAO;
import com.example.model.Movie;
import com.example.util.DBUtil;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
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
            // Get the user_id from session (ensure user is logged in)
            HttpSession session = request.getSession();
            Integer userId = (Integer) session.getAttribute("user_id");
            System.out.println("doPost is triggered ");


            if (userId == null) {
                // If user is not logged in, redirect to login page
                response.sendRedirect("/login");
                return;
            }

            // Get the other movie details from the form
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String releaseDate = request.getParameter("release_date");
            String image = request.getParameter("image");
            System.out.println("Title: " + title);
            // Create a Movie object with the user_id from the session
            Movie movie = new Movie(title, description, releaseDate, image, userId);
            System.out.println("Title " + movie.getTitle());
            boolean isAdded = movieDAO.addMovie(movie);
            System.out.println("Movie Added: " + isAdded);
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
            // Get the user_id from session (ensure user is logged in)
            HttpSession session = request.getSession();
            String userIdParam = request.getParameter("user_id");

            if (userIdParam == null || userIdParam.isEmpty()) {
                // If the user_id parameter is missing, redirect to login page
                response.sendRedirect("/login");
                System.out.println("parameter missing");
                return;
            }

            int userId;
            try {
                userId = Integer.parseInt(userIdParam);  // Try to parse the user_id
            } catch (NumberFormatException e) {
                // If the user_id is not a valid number, redirect to login page
                System.out.println("nothing");
                response.sendRedirect("/login");
                return;
            }
            System.out.println(userId);
            System.out.println(userIdParam);
            System.out.println("user");
            // Get movie details from the form
            int id = Integer.parseInt(request.getParameter("id"));
            String title = request.getParameter("title");
            String description = request.getParameter("description");
            String releaseDate = request.getParameter("release_date");
            String image = request.getParameter("image");

            // Create a Movie object with the user_id from session
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
