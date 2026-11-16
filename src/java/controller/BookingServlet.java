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

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Get logged-in user's session
        HttpSession session = request.getSession(false);

        if (session == null ||
            session.getAttribute("user_id") == null) {

            response.sendRedirect("login.jsp");
            return;
        }

        // Get user ID
        int userId =
            (Integer) session.getAttribute("user_id");

        // Get show ID
        String showIdString =
            request.getParameter("show_id");

        // Get selected seats
        String[] seatIds =
            request.getParameterValues("seat_id");

        response.setContentType("text/html;charset=UTF-8");

        if (showIdString == null ||
            seatIds == null ||
            seatIds.length == 0) {

            response.getWriter().println(
                "<h2>Please select at least one seat.</h2>"
            );

            response.getWriter().println(
                "<a href='javascript:history.back()'>Go Back</a>"
            );

            return;
        }

        int showId =
            Integer.parseInt(showIdString);

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            // Start transaction
            con.setAutoCommit(false);

            // Get ticket price
            String priceSQL =
                "SELECT ticket_price FROM shows " +
                "WHERE show_id = ?";

            PreparedStatement pricePS =
                con.prepareStatement(priceSQL);

            pricePS.setInt(1, showId);

            ResultSet priceRS =
                pricePS.executeQuery();

            double ticketPrice = 0;

            if (priceRS.next()) {
                ticketPrice =
                    priceRS.getDouble("ticket_price");
            }

            priceRS.close();
            pricePS.close();

            // Check selected seats
            String checkSQL =
                "SELECT status FROM seats " +
                "WHERE seat_id = ? AND show_id = ? " +
                "FOR UPDATE";

            PreparedStatement checkPS =
                con.prepareStatement(checkSQL);

            for (String seatIdString : seatIds) {

                int seatId =
                    Integer.parseInt(seatIdString);

                checkPS.setInt(1, seatId);
                checkPS.setInt(2, showId);

                ResultSet rs =
                    checkPS.executeQuery();

                if (!rs.next()) {

                    rs.close();
                    checkPS.close();

                    con.rollback();

                    response.getWriter().println(
                        "<h2>Invalid seat selected.</h2>"
                    );

                    return;
                }

                String status =
                    rs.getString("status");

                rs.close();

                if ("BOOKED".equalsIgnoreCase(status)) {

                    checkPS.close();

                    con.rollback();

                    response.getWriter().println(
                        "<h2>One of the selected seats is already booked.</h2>"
                    );

                    response.getWriter().println(
                        "<a href='javascript:history.back()'>Choose Again</a>"
                    );

                    return;
                }
            }

            checkPS.close();

            // Calculate total
            double totalAmount =
                ticketPrice * seatIds.length;

            // Insert booking
            String bookingSQL =
                "INSERT INTO bookings " +
                "(user_id, show_id, total_amount, status) " +
                "VALUES (?, ?, ?, 'CONFIRMED')";

            PreparedStatement bookingPS =
                con.prepareStatement(
                    bookingSQL,
                    new String[]{"BOOKING_ID"}
                );

            bookingPS.setInt(1, userId);
            bookingPS.setInt(2, showId);
            bookingPS.setDouble(3, totalAmount);

            bookingPS.executeUpdate();

            ResultSet generatedKeys =
                bookingPS.getGeneratedKeys();

            int bookingId = 0;

            if (generatedKeys.next()) {
                bookingId =
                    generatedKeys.getInt(1);
            }

            generatedKeys.close();
            bookingPS.close();

            // Update seats and insert booking_seats
            String updateSeatSQL =
                "UPDATE seats SET status = 'BOOKED' " +
                "WHERE seat_id = ?";

            String bookingSeatSQL =
                "INSERT INTO booking_seats " +
                "(booking_id, seat_id) " +
                "VALUES (?, ?)";

            PreparedStatement updateSeatPS =
                con.prepareStatement(updateSeatSQL);

            PreparedStatement bookingSeatPS =
                con.prepareStatement(bookingSeatSQL);

            for (String seatIdString : seatIds) {

                int seatId =
                    Integer.parseInt(seatIdString);

                // Mark seat as booked
                updateSeatPS.setInt(1, seatId);
                updateSeatPS.executeUpdate();

                // Save booking-seat relationship
                bookingSeatPS.setInt(1, bookingId);
                bookingSeatPS.setInt(2, seatId);

                bookingSeatPS.executeUpdate();
            }

            updateSeatPS.close();
            bookingSeatPS.close();

            // Complete transaction
            con.commit();

            // Send data to confirmation page
            session.setAttribute(
                "booking_id",
                bookingId
            );

            session.setAttribute(
                "booking_total",
                totalAmount
            );

            session.setAttribute(
                "booking_seats",
                seatIds.length
            );

            response.sendRedirect(
                "bookingConfirmation.jsp"
            );

        } catch (Exception e) {

            try {

                if (con != null) {
                    con.rollback();
                }

            } catch (Exception ex) {
                ex.printStackTrace();
            }

            e.printStackTrace();

            response.getWriter().println(
                "<h2>Booking Error</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );

        } finally {

            try {

                if (con != null) {
                    con.close();
                }

            } catch (Exception e) {
                e.printStackTrace();
            }
        }
    }
}