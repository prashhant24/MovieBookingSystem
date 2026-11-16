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

@WebServlet("/AdminLoginServlet")
public class AdminLoginServlet extends HttpServlet {

    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String username =
                request.getParameter("username");

        String password =
                request.getParameter("password");


        try {

            Connection con =
                    DBConnection.getConnection();


            String sql =
                    "SELECT admin_id, username " +
                    "FROM admin " +
                    "WHERE username = ? AND password = ?";


            PreparedStatement ps =
                    con.prepareStatement(sql);


            ps.setString(1, username);
            ps.setString(2, password);


            ResultSet rs =
                    ps.executeQuery();


            if (rs.next()) {

                HttpSession session =
                        request.getSession();

                session.setAttribute(
                        "admin_id",
                        rs.getInt("admin_id")
                );

                session.setAttribute(
                        "admin_username",
                        rs.getString("username")
                );


                /*
                 * Important:
                 * Load dashboard statistics
                 * through AdminDashboardServlet.
                 */

                response.sendRedirect(
                        "AdminDashboardServlet"
                );

            } else {

                response.sendRedirect(
                        "adminLogin.jsp?error=invalid"
                );

            }


            rs.close();
            ps.close();
            con.close();


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "adminLogin.jsp?error=database"
            );
        }

    }

}