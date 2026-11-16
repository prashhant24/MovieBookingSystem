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
import javax.servlet.http.HttpSession;

@WebServlet("/MyBookingsServlet")
public class MyBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Check login session
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user_id") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        int userId =
            (Integer) session.getAttribute("user_id");

        try {

            Connection con =
                DBConnection.getConnection();

            String sql =
                "SELECT b.booking_id, " +
                "m.title, " +
                "s.show_date, " +
                "s.show_time, " +
                "s.screen, " +
                "b.total_amount, " +
                "b.status " +
                "FROM bookings b " +
                "JOIN shows s ON b.show_id = s.show_id " +
                "JOIN movies m ON s.movie_id = m.movie_id " +
                "WHERE b.user_id = ? " +
                "ORDER BY b.booking_date DESC";

            PreparedStatement ps =
                con.prepareStatement(sql);

            ps.setInt(1, userId);

            ResultSet rs =
                ps.executeQuery();

            request.setAttribute("bookings", rs);

            request.getRequestDispatcher(
                "myBookings.jsp"
            ).forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType(
                "text/html;charset=UTF-8"
            );

            response.getWriter().println(
                "<h2>Error loading bookings</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}