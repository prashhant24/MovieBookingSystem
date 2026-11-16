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

@WebServlet("/SeatServlet")
public class SeatServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        String showId = request.getParameter("show_id");

        if (showId == null) {
            response.sendRedirect("MovieServlet");
            return;
        }

        try {

            Connection con = DBConnection.getConnection();

            String sql =
                "SELECT seat_id, seat_number, status " +
                "FROM seats " +
                "WHERE show_id = ? " +
                "ORDER BY seat_id";

            PreparedStatement ps =
                    con.prepareStatement(sql);

            ps.setInt(1, Integer.parseInt(showId));

            ResultSet rs = ps.executeQuery();

            request.setAttribute("show_id", showId);
            request.setAttribute("seats", rs);

            request.getRequestDispatcher("seatSelection.jsp")
                   .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();

            response.setContentType("text/html");

            response.getWriter().println(
                "<h2>Error loading seats</h2>"
            );

            response.getWriter().println(
                "<p>" + e.getMessage() + "</p>"
            );
        }
    }
}