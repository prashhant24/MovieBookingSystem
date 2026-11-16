package controller;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import util.DBConnection;

@WebServlet("/AdminSeatsServlet")
public class AdminSeatsServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        /* Check admin login */

        if (session == null ||
            session.getAttribute("admin_username") == null) {

            response.sendRedirect("adminLogin.jsp");
            return;
        }


        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;


        try {

            con = DBConnection.getConnection();


            String sql =
                    "SELECT " +
                    "s.seat_id, " +
                    "s.seat_number, " +
                    "s.status, " +
                    "sh.show_id, " +
                    "sh.show_date, " +
                    "sh.show_time, " +
                    "sh.screen, " +
                    "m.title AS movie_title " +
                    "FROM seats s " +
                    "JOIN shows sh " +
                    "ON s.show_id = sh.show_id " +
                    "JOIN movies m " +
                    "ON sh.movie_id = m.movie_id " +
                    "ORDER BY sh.show_date, sh.show_time, s.seat_id";


            ps = con.prepareStatement(sql);

            rs = ps.executeQuery();


            request.setAttribute("seats", rs);


            RequestDispatcher rd =
                    request.getRequestDispatcher(
                            "adminSeats.jsp"
                    );

            rd.forward(request, response);


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

        /*
         * Do not close ResultSet/PreparedStatement/Connection here.
         *
         * The ResultSet is being passed to the JSP through
         * request.setAttribute("seats", rs).
         */
    }
}