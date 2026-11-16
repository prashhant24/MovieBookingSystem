package controller;

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

import util.DBConnection;

@WebServlet("/AdminDashboardServlet")
public class AdminDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {


        HttpSession session =
                request.getSession(false);


        if (session == null ||
            session.getAttribute("admin_username") == null) {

            response.sendRedirect("adminLogin.jsp");

            return;
        }


        Connection con = null;


        try {

            con = DBConnection.getConnection();


            // MOVIES

            PreparedStatement ps1 =
                    con.prepareStatement(
                        "SELECT COUNT(*) FROM movies"
                    );

            ResultSet rs1 =
                    ps1.executeQuery();

            if (rs1.next()) {

                request.setAttribute(
                    "movieCount",
                    rs1.getInt(1)
                );
            }


            // USERS

            PreparedStatement ps2 =
                    con.prepareStatement(
                        "SELECT COUNT(*) FROM users"
                    );

            ResultSet rs2 =
                    ps2.executeQuery();

            if (rs2.next()) {

                request.setAttribute(
                    "userCount",
                    rs2.getInt(1)
                );
            }


            // BOOKINGS

            PreparedStatement ps3 =
                    con.prepareStatement(
                        "SELECT COUNT(*) FROM bookings"
                    );

            ResultSet rs3 =
                    ps3.executeQuery();

            if (rs3.next()) {

                request.setAttribute(
                    "bookingCount",
                    rs3.getInt(1)
                );
            }


            // AVAILABLE SEATS

            PreparedStatement ps4 =
                    con.prepareStatement(
                        "SELECT COUNT(*) " +
                        "FROM seats " +
                        "WHERE status = 'AVAILABLE'"
                    );

            ResultSet rs4 =
                    ps4.executeQuery();

            if (rs4.next()) {

                request.setAttribute(
                    "availableSeats",
                    rs4.getInt(1)
                );
            }


            rs1.close();
            rs2.close();
            rs3.close();
            rs4.close();

            ps1.close();
            ps2.close();
            ps3.close();
            ps4.close();

            con.close();


            request.getRequestDispatcher(
                    "adminDashboard.jsp"
            ).forward(request, response);


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "adminLogin.jsp"
            );
        }

    }
}