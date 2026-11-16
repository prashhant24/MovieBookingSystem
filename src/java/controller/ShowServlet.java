package controller;

import util.DBConnection;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ShowServlet")
public class ShowServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String movieId = request.getParameter("movie_id");

        if (movieId == null) {
            response.sendRedirect("MovieServlet");
            return;
        }

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT s.show_id, s.show_date, s.show_time, " +
                "s.screen, s.ticket_price, m.title " +
                "FROM shows s " +
                "JOIN movies m ON s.movie_id = m.movie_id " +
                "WHERE s.movie_id = ? " +
                "ORDER BY s.show_date, s.show_time";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(movieId));

            ResultSet rs = ps.executeQuery();

            request.setAttribute("shows", rs);

            request.getRequestDispatcher("shows.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "<h2>Error loading shows</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}