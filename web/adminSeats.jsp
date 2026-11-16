<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>

<%
    /* ADMIN SESSION CHECK */

    String adminUsername =
            (String) session.getAttribute("admin_username");

    if (adminUsername == null) {

        response.sendRedirect("adminLogin.jsp");

        return;
    }


    ResultSet seats =
            (ResultSet) request.getAttribute("seats");
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook - Seat Management</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }


        body {

            background: #08090b;

            color: white;

            min-height: 100vh;
        }


        /* NAVBAR */

        .navbar {

            height: 64px;

            background: #090e14;

            border-bottom: 1px solid #252b32;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 5%;
        }


        .logo {

            font-size: 30px;

            font-weight: bold;

            color: white;
        }


        .logo span {

            color: #f5223b;
        }


        .admin-area {

            display: flex;

            align-items: center;

            gap: 15px;

            color: #9aa5b1;

            font-size: 14px;
        }


        .logout {

            text-decoration: none;

            color: white;

            border: 1px solid #f5223b;

            padding: 9px 18px;

            border-radius: 7px;

            font-size: 13px;
        }


        .logout:hover {

            background: #f5223b;
        }


        /* MAIN */

        .container {

            width: 92%;

            max-width: 1250px;

            margin: auto;

            padding: 35px 0 60px;
        }


        /* HEADER */

        .header {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 30px;
        }


        .header h1 {

            font-size: 32px;

            margin-bottom: 7px;
        }


        .header h1 span {

            color: #f5223b;
        }


        .header p {

            color: #7f8b98;

            font-size: 14px;
        }


        .back-btn {

            text-decoration: none;

            color: white;

            background: #151c24;

            border: 1px solid #35404b;

            padding: 11px 20px;

            border-radius: 7px;

            font-size: 13px;
        }


        .back-btn:hover {

            background: #f5223b;

            border-color: #f5223b;
        }


        /* INFO */

        .info-box {

            background: #111214;

            border: 1px solid #292d32;

            border-radius: 12px;

            padding: 18px 22px;

            margin-bottom: 22px;

            color: #8c99a8;

            font-size: 14px;
        }


        .info-box strong {

            color: white;
        }


        /* TABLE CONTAINER */

        .table-container {

            background: #111111;

            border: 1px solid #292d32;

            border-radius: 14px;

            overflow-x: auto;
        }


        table {

            width: 100%;

            border-collapse: collapse;

            min-width: 850px;
        }


        thead {

            background: #171a1e;
        }


        th {

            text-align: left;

            padding: 17px 18px;

            color: #8d99a7;

            font-size: 12px;

            text-transform: uppercase;

            letter-spacing: 0.5px;

            border-bottom: 1px solid #292d32;
        }


        td {

            padding: 17px 18px;

            border-bottom: 1px solid #22272d;

            color: #dce1e6;

            font-size: 14px;
        }


        tbody tr:hover {

            background: #15191e;
        }


        tbody tr:last-child td {

            border-bottom: none;
        }


        /* SEAT NUMBER */

        .seat-number {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 45px;

            padding: 7px 10px;

            border-radius: 6px;

            background: #22262b;

            border: 1px solid #3b4249;

            color: white;

            font-weight: bold;
        }


        /* STATUS */

        .status {

            display: inline-block;

            padding: 6px 12px;

            border-radius: 20px;

            font-size: 12px;

            font-weight: bold;
        }


        .available {

            background: rgba(25,182,90,0.12);

            color: #25c968;

            border: 1px solid rgba(25,182,90,0.35);
        }


        .booked {

            background: rgba(245,34,59,0.12);

            color: #f5223b;

            border: 1px solid rgba(245,34,59,0.35);
        }


        .other {

            background: #25282c;

            color: #aab2bb;

            border: 1px solid #3b4147;
        }


        /* MOVIE */

        .movie-name {

            color: white;

            font-weight: bold;

            margin-bottom: 4px;
        }


        .show-id {

            color: #687584;

            font-size: 12px;
        }


        /* EMPTY */

        .empty {

            text-align: center;

            padding: 60px 20px;

            color: #7f8b98;
        }


        /* FOOTER */

        footer {

            border-top: 1px solid #252b32;

            background: #090e14;

            text-align: center;

            padding: 24px;

            color: #657384;

            font-size: 13px;
        }


        /* RESPONSIVE */

        @media(max-width:700px) {

            .header {

                align-items: flex-start;

                gap: 20px;
            }


            .header h1 {

                font-size: 26px;
            }


            .admin-area span {

                display: none;
            }


            .navbar {

                padding: 0 3%;
            }

        }

    </style>

</head>


<body>


<!-- NAVBAR -->

<nav class="navbar">


    <div class="logo">

        Cine<span>Book</span>

    </div>


    <div class="admin-area">

        <span>
            Admin: <%= adminUsername %>
        </span>


        <a
            href="AdminLogoutServlet"
            class="logout">

            Logout

        </a>

    </div>

</nav>


<!-- MAIN -->

<div class="container">


    <!-- HEADER -->

    <div class="header">


        <div>

            <h1>

                Seat <span>Management</span>

            </h1>


            <p>

                Check seat availability and booking status.

            </p>

        </div>


        <a
            href="adminDashboard.jsp"
            class="back-btn">

            Back

        </a>


    </div>


    <!-- INFO -->

    <div class="info-box">

        <strong>Seat Management:</strong>

        This section displays all seats created for every movie show,
        along with their current availability status.

    </div>


    <!-- TABLE -->

    <div class="table-container">


        <%
            if (seats != null) {

                boolean hasSeats = false;
        %>


        <table>


            <thead>

                <tr>

                    <th>
                        Seat ID
                    </th>

                    <th>
                        Seat
                    </th>

                    <th>
                        Movie
                    </th>

                    <th>
                        Date
                    </th>

                    <th>
                        Time
                    </th>

                    <th>
                        Screen
                    </th>

                    <th>
                        Status
                    </th>

                </tr>

            </thead>


            <tbody>


            <%
                while (seats.next()) {

                    hasSeats = true;


                    int seatId =
                            seats.getInt("seat_id");


                    String seatNumber =
                            seats.getString("seat_number");


                    String movieTitle =
                            seats.getString("movie_title");


                    String showTime =
                            seats.getString("show_time");


                    String screen =
                            seats.getString("screen");


                    String status =
                            seats.getString("status");


                    String showDate = "";

                    Date date =
                            seats.getDate("show_date");


                    if (date != null) {

                        SimpleDateFormat sdf =
                                new SimpleDateFormat(
                                        "dd MMM yyyy"
                                );

                        showDate =
                                sdf.format(date);
                    }


                    String statusClass =
                            "other";


                    if ("AVAILABLE".equalsIgnoreCase(status)) {

                        statusClass = "available";

                    } else if ("BOOKED".equalsIgnoreCase(status)) {

                        statusClass = "booked";
                    }
            %>


                <tr>


                    <td>

                        #<%= seatId %>

                    </td>


                    <td>

                        <span class="seat-number">

                            <%= seatNumber %>

                        </span>

                    </td>


                    <td>

                        <div class="movie-name">

                            <%= movieTitle %>

                        </div>


                        <div class="show-id">

                            Show ID:
                            <%= seats.getInt("show_id") %>

                        </div>

                    </td>


                    <td>

                        <%= showDate %>

                    </td>


                    <td>

                        <%= showTime %>

                    </td>


                    <td>

                        <%= screen %>

                    </td>


                    <td>

                        <span
                            class="status <%= statusClass %>">

                            <%= status %>

                        </span>

                    </td>


                </tr>


            <%
                }


                if (!hasSeats) {
            %>


                <tr>

                    <td
                        colspan="7"
                        class="empty">

                        No seats found.

                    </td>

                </tr>


            <%
                }
            %>


            </tbody>


        </table>


        <%
            }
        %>


    </div>


</div>


<!-- FOOTER -->

<footer>

    CineBook - Online Movie Ticket Booking System

</footer>


</body>

</html>