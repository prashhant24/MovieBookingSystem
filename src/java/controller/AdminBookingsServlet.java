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

@WebServlet("/AdminBookingsServlet")
public class AdminBookingsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session =
                request.getSession(false);

        // Check admin login
        if (session == null ||
            session.getAttribute("admin_id") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }

        try {

            Connection con =
                    DBConnection.getConnection();

            String sql =
                "SELECT b.booking_id, " +
                "u.name AS user_name, " +
                "m.title, " +
                "s.show_date, " +
                "s.show_time, " +
                "s.screen, " +
                "b.total_amount, " +
                "b.status, " +
                "LISTAGG(bs2.seat_number, ', ') " +
                "WITHIN GROUP (ORDER BY bs2.seat_number) " +
                "AS seats " +

                "FROM bookings b " +

                "JOIN users u " +
                "ON b.user_id = u.user_id " +

                "JOIN shows s " +
                "ON b.show_id = s.show_id " +

                "JOIN movies m " +
                "ON s.movie_id = m.movie_id " +

                "LEFT JOIN booking_seats bs " +
                "ON b.booking_id = bs.booking_id " +

                "LEFT JOIN seats bs2 " +
                "ON bs.seat_id = bs2.seat_id " +

                "GROUP BY b.booking_id, " +
                "u.name, " +
                "m.title, " +
                "s.show_date, " +
                "s.show_time, " +
                "s.screen, " +
                "b.total_amount, " +
                "b.status " +

                "ORDER BY b.booking_id DESC";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ResultSet rs =
                    ps.executeQuery();

            request.setAttribute(
                    "bookings",
                    rs
            );

            request.getRequestDispatcher(
                    "adminBookings.jsp"
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