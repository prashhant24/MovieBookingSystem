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

@WebServlet("/AddShowServlet")
public class AddShowServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        String movieId =
            request.getParameter("movie_id");

        String showDate =
            request.getParameter("show_date");

        String showTime =
            request.getParameter("show_time");

        String screen =
            request.getParameter("screen");

        String ticketPrice =
            request.getParameter("ticket_price");

        response.setContentType(
            "text/html;charset=UTF-8"
        );

        Connection con = null;

        try {

            con = DBConnection.getConnection();

            // Start transaction
            con.setAutoCommit(false);

            // Insert show
            String showSQL =
                "INSERT INTO shows " +
                "(movie_id, show_date, show_time, screen, ticket_price) " +
                "VALUES (?, TO_DATE(?, 'YYYY-MM-DD'), ?, ?, ?)";

            PreparedStatement showPS =
                con.prepareStatement(
                    showSQL,
                    new String[]{"SHOW_ID"}
                );

            showPS.setInt(
                1,
                Integer.parseInt(movieId)
            );

            showPS.setString(
                2,
                showDate
            );

            showPS.setString(
                3,
                showTime
            );

            showPS.setString(
                4,
                screen
            );

            showPS.setDouble(
                5,
                Double.parseDouble(ticketPrice)
            );

            showPS.executeUpdate();

            // Get newly created show ID
            ResultSet keys =
                showPS.getGeneratedKeys();

            int showId = 0;

            if (keys.next()) {
                showId = keys.getInt(1);
            }

            keys.close();
            showPS.close();

            // Create 20 seats
            String seatSQL =
                "INSERT INTO seats " +
                "(show_id, seat_number, status) " +
                "VALUES (?, ?, 'AVAILABLE')";

            PreparedStatement seatPS =
                con.prepareStatement(seatSQL);

            for (int row = 0; row < 4; row++) {

                for (int column = 1; column <= 5; column++) {

                    String seatNumber =
                        String.valueOf(
                            (char)('A' + row)
                        ) + column;

                    seatPS.setInt(
                        1,
                        showId
                    );

                    seatPS.setString(
                        2,
                        seatNumber
                    );

                    seatPS.executeUpdate();
                }
            }

            seatPS.close();

            // Save everything
            con.commit();

            response.getWriter().println(
                "<html>"
            );

            response.getWriter().println(
                "<head><title>Show Added</title></head>"
            );

            response.getWriter().println(
                "<body style='font-family:Arial;text-align:center;" +
                "padding-top:100px;background:#f4f4f4;'>"
            );

            response.getWriter().println(
                "<h1 style='color:#28a745;'>" +
                "Show Added Successfully!</h1>"
            );

            response.getWriter().println(
                "<p>Show ID: " + showId + "</p>"
            );

            response.getWriter().println(
                "<p>20 seats have been created automatically.</p>"
            );

            response.getWriter().println(
                "<a href='adminDashboard.jsp' " +
                "style='display:inline-block;padding:12px 25px;" +
                "background:#ff4b2b;color:white;" +
                "text-decoration:none;border-radius:6px;'>" +
                "Back to Dashboard</a>"
            );

            response.getWriter().println(
                "</body></html>"
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
                "<h2>Error Adding Show</h2>"
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