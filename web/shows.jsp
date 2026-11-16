<%@ page import="java.sql.ResultSet" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.sql.Date" %>

<%
    ResultSet shows = (ResultSet) request.getAttribute("shows");
    boolean hasShows = false;
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>CineBook - Shows & Timings</title>

    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }

        body {
            background: #080808;
            color: #ffffff;
            min-height: 100vh;
        }

        .navbar {
            height: 70px;
            background: #111111;
            border-bottom: 1px solid #292929;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 7%;
        }

        .logo {
            font-size: 27px;
            font-weight: bold;
            color: #e50914;
            letter-spacing: 1px;
        }

        .nav-links {
            display: flex;
            gap: 30px;
        }

        .nav-links a {
            color: #dddddd;
            text-decoration: none;
            font-size: 15px;
        }

        .nav-links a:hover {
            color: #e50914;
        }

        .container {
            width: 86%;
            max-width: 1100px;
            margin: auto;
            padding: 35px 0 60px;
        }

        .back-section {
            margin-bottom: 25px;
        }

        .back-btn {
            display: inline-block;
            background: #1b1b1b;
            border: 1px solid #3a3a3a;
            color: #ffffff;
            text-decoration: none;
            padding: 11px 20px;
            border-radius: 7px;
            font-size: 14px;
            transition: 0.3s;
        }

        .back-btn:hover {
            background: #e50914;
            border-color: #e50914;
        }

        .page-header {
            margin-bottom: 35px;
        }

        .page-header h1 {
            font-size: 34px;
            margin-bottom: 10px;
        }

        .page-header h1 span {
            color: #e50914;
        }

        .page-header p {
            color: #999999;
            font-size: 15px;
        }

        .shows-grid {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(290px, 1fr));
            gap: 22px;
        }

        .show-card {
            background: #121212;
            border: 1px solid #292929;
            border-radius: 12px;
            padding: 25px;
            transition: 0.3s;
        }

        .show-card:hover {
            transform: translateY(-4px);
            border-color: #e50914;
            box-shadow: 0 10px 30px rgba(229, 9, 20, 0.12);
        }

        .show-title {
            font-size: 21px;
            font-weight: bold;
            margin-bottom: 20px;
        }

        .show-info {
            margin-bottom: 20px;
        }

        .info-row {
            display: flex;
            justify-content: space-between;
            padding: 10px 0;
            border-bottom: 1px solid #242424;
            font-size: 14px;
        }

        .info-label {
            color: #888888;
        }

        .info-value {
            color: #eeeeee;
            font-weight: 500;
            text-align: right;
        }

        .price {
            color: #e50914;
            font-size: 20px;
            font-weight: bold;
        }

        .select-btn {
            display: block;
            width: 100%;
            text-align: center;
            text-decoration: none;
            background: #e50914;
            color: #ffffff;
            padding: 13px;
            border-radius: 7px;
            font-size: 15px;
            font-weight: bold;
            transition: 0.3s;
        }

        .select-btn:hover {
            background: #b20710;
        }

        .no-shows {
            background: #121212;
            border: 1px solid #292929;
            border-radius: 12px;
            padding: 45px 25px;
            text-align: center;
        }

        .no-shows h2 {
            margin-bottom: 10px;
        }

        .no-shows p {
            color: #888888;
            margin-bottom: 22px;
        }

        footer {
            border-top: 1px solid #222222;
            background: #0d0d0d;
            text-align: center;
            padding: 22px;
            color: #666666;
            font-size: 13px;
        }

        @media (max-width: 700px) {

            .navbar {
                padding: 0 5%;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 13px;
            }

            .container {
                width: 92%;
            }

            .page-header h1 {
                font-size: 28px;
            }
        }
    </style>
</head>

<body>

    <!-- NAVBAR -->
    <div class="navbar">

        <div class="logo">
            CineBook
        </div>

        <div class="nav-links">
            <a href="index.html">Home</a>
            <a href="MovieServlet">Movies</a>
            <a href="welcome.jsp">Account</a>
        </div>

    </div>


    <!-- MAIN CONTENT -->
    <div class="container">

        <!-- BACK BUTTON -->
        <div class="back-section">
            <a href="javascript:history.back()" class="back-btn">
                Back
            </a>
        </div>


        <!-- PAGE HEADER -->
        <div class="page-header">

            <h1>
                <span>Shows</span> & Timings
            </h1>

            <p>
                Select your preferred show timing to continue.
            </p>

        </div>


        <!-- SHOW CARDS -->
        <div class="shows-grid">

            <%
                if (shows != null) {

                    while (shows.next()) {

                        hasShows = true;

                        int showId = shows.getInt("show_id");
                        String title = shows.getString("title");
                        Date showDate = shows.getDate("show_date");
                        String showTime = shows.getString("show_time");
                        String screen = shows.getString("screen");
                        double ticketPrice = shows.getDouble("ticket_price");

                        String formattedDate = "";

                        if (showDate != null) {

                            SimpleDateFormat sdf =
                                    new SimpleDateFormat("dd MMM yyyy");

                            formattedDate = sdf.format(showDate);
                        }
            %>

            <div class="show-card">

                <div class="show-title">
                    <%= title %>
                </div>

                <div class="show-info">

                    <div class="info-row">

                        <span class="info-label">
                            Date
                        </span>

                        <span class="info-value">
                            <%= formattedDate %>
                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Show Time
                        </span>

                        <span class="info-value">
                            <%= showTime %>
                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Screen
                        </span>

                        <span class="info-value">
                            <%= screen %>
                        </span>

                    </div>


                    <div class="info-row">

                        <span class="info-label">
                            Ticket Price
                        </span>

                        <span class="price">
                            Rs. <%= String.format("%.2f", ticketPrice) %>
                        </span>

                    </div>

                </div>


                <a
                    href="SeatServlet?show_id=<%= showId %>"
                    class="select-btn">

                    Select Seats

                </a>

            </div>

            <%
                    }
                }
            %>

        </div>


        <!-- NO SHOWS -->
        <%
            if (!hasShows) {
        %>

        <div class="no-shows">

            <h2>
                No Shows Available
            </h2>

            <p>
                There are currently no shows available for this movie.
            </p>

            <a href="MovieServlet" class="back-btn">
                Back to Movies
            </a>

        </div>

        <%
            }
        %>

    </div>


    <!-- FOOTER -->
    <footer>
        CineBook - Online Movie Ticket Booking System
    </footer>

</body>
</html>