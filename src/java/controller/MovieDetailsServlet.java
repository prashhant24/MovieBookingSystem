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

@WebServlet("/MovieDetailsServlet")
public class MovieDetailsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String id = request.getParameter("movie_id");

        if (id == null) {
            response.sendRedirect("MovieServlet");
            return;
        }

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT * FROM movies WHERE movie_id = ?";

            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(id));

            ResultSet rs = ps.executeQuery();

            if (rs.next()) {

                request.setAttribute("movie_id",
                        rs.getInt("movie_id"));

                request.setAttribute("title",
                        rs.getString("title"));

                request.setAttribute("genre",
                        rs.getString("genre"));

                request.setAttribute("language",
                        rs.getString("language"));

                request.setAttribute("duration",
                        rs.getInt("duration"));

                request.setAttribute("rating",
                        rs.getDouble("rating"));

                request.setAttribute("description",
                        rs.getString("description"));

                request.getRequestDispatcher("movieDetails.jsp")
                       .forward(request, response);

            } else {

                response.getWriter().println(
                        "<h2>Movie not found!</h2>"
                );
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<h2>Error loading movie details</h2>"
            );

            response.getWriter().println(
                    "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}