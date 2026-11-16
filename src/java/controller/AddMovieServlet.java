package controller;

import util.DBConnection;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/AddMovieServlet")
public class AddMovieServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String title =
            request.getParameter("title");

        String genre =
            request.getParameter("genre");

        String language =
            request.getParameter("language");

        String durationString =
            request.getParameter("duration");

        String ratingString =
            request.getParameter("rating");

        String description =
            request.getParameter("description");

        response.setContentType(
            "text/html;charset=UTF-8"
        );

        String sql =
            "INSERT INTO movies " +
            "(title, genre, language, duration, rating, description) " +
            "VALUES (?, ?, ?, ?, ?, ?)";

        try {

            int duration =
                Integer.parseInt(durationString);

            double rating =
                Double.parseDouble(ratingString);

            Connection con =
                DBConnection.getConnection();

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setString(1, title);
            ps.setString(2, genre);
            ps.setString(3, language);
            ps.setInt(4, duration);
            ps.setDouble(5, rating);
            ps.setString(6, description);

            int result =
                ps.executeUpdate();

            if (result > 0) {

                PrintWriter out =
                    response.getWriter();

                out.println("<html>");
                out.println("<head>");
                out.println("<title>Movie Added</title>");

                out.println(
                    "<style>" +
                    "body{font-family:Arial;text-align:center;" +
                    "padding-top:100px;background:#f4f4f4;}" +
                    "h1{color:#28a745;}" +
                    "a{display:inline-block;margin-top:20px;" +
                    "padding:12px 25px;background:#ff4b2b;" +
                    "color:white;text-decoration:none;" +
                    "border-radius:6px;}" +
                    "</style>"
                );

                out.println("</head>");
                out.println("<body>");

                out.println(
                    "<h1>Movie Added Successfully!</h1>"
                );

                out.println(
                    "<p>" + title +
                    " has been added to CineBook.</p>"
                );

                out.println(
                    "<a href='adminDashboard.jsp'>" +
                    "Back to Dashboard</a>"
                );

                out.println("</body>");
                out.println("</html>");

            } else {

                response.getWriter().println(
                    "<h2>Movie could not be added.</h2>"
                );
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                "<h2>Error Adding Movie</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}