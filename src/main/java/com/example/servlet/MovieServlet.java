package com.example.servlet;

import com.example.dao.MovieDAO;
import com.example.model.Movie;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import java.io.IOException;
import java.util.List;
import com.example.util.DBUtil;


@WebServlet("/movies")
public class MovieServlet extends HttpServlet {
    private MovieDAO movieDAO;

    @Override
    public void init() throws ServletException {
        movieDAO = new MovieDAO(DBUtil.getConnection());
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Movie> movies = movieDAO.getAllMovies();
        request.setAttribute("movies", movies);
        RequestDispatcher dispatcher = request.getRequestDispatcher("/movieList.jsp");
        dispatcher.forward(request, response);
    }
}
