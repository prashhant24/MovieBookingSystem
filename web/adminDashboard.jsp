<%@ page import="java.lang.Integer" %>

<%
    String adminUsername =
            (String) session.getAttribute("admin_username");

    if (adminUsername == null) {

        response.sendRedirect("adminLogin.jsp");

        return;
    }


    Integer movieCount =
            (Integer) request.getAttribute("movieCount");

    Integer userCount =
            (Integer) request.getAttribute("userCount");

    Integer bookingCount =
            (Integer) request.getAttribute("bookingCount");

    Integer availableSeats =
            (Integer) request.getAttribute("availableSeats");


    if (movieCount == null) movieCount = 0;
    if (userCount == null) userCount = 0;
    if (bookingCount == null) bookingCount = 0;
    if (availableSeats == null) availableSeats = 0;
%>


<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook - Admin Dashboard</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }


        body {

            background: #070b10;

            color: #ffffff;

            min-height: 100vh;
        }


        /* NAVBAR */

        .navbar {

            height: 76px;

            background: #090e14;

            border-bottom: 1px solid #252b32;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 7%;
        }


        .logo {

            font-size: 29px;

            font-weight: bold;

            color: #ffffff;
        }


        .logo span {

            color: #f5223b;
        }


        .admin-info {

            display: flex;

            align-items: center;

            gap: 20px;

            color: #aab6c3;

            font-size: 13px;
        }


        .admin-name {

            color: #ffffff;

            font-weight: bold;
        }


        .logout-btn {

            text-decoration: none;

            color: #ffffff;

            border: 1px solid #f5223b;

            padding: 10px 18px;

            border-radius: 6px;

            font-size: 13px;

            transition: 0.3s;
        }


        .logout-btn:hover {

            background: #f5223b;
        }


        /* CONTAINER */

        .container {

            width: 86%;

            max-width: 1250px;

            margin: auto;

            padding: 42px 0 70px;
        }


        /* HEADER */

        .header {

            display: flex;

            justify-content: space-between;

            align-items: flex-start;

            margin-bottom: 35px;
        }


        .header h1 {

            font-size: 38px;

            margin-bottom: 9px;
        }


        .header h1 span {

            color: #f5223b;
        }


        .header p {

            color: #8291a2;

            font-size: 14px;
        }


        .back-btn {

            text-decoration: none;

            color: #ffffff;

            background: #141b23;

            border: 1px solid #323c47;

            padding: 11px 20px;

            border-radius: 7px;

            font-size: 13px;

            transition: 0.3s;
        }


        .back-btn:hover {

            background: #f5223b;

            border-color: #f5223b;
        }


        /* STATISTICS */

        .stats {

            display: grid;

            grid-template-columns:
                repeat(4, 1fr);

            gap: 20px;

            margin-bottom: 50px;
        }


        .stat-card {

            background: #111820;

            border: 1px solid #29323c;

            border-radius: 13px;

            padding: 25px;

            position: relative;

            overflow: hidden;

            transition: 0.3s;
        }


        .stat-card:hover {

            transform: translateY(-4px);

            border-color: #f5223b;
        }


        .stat-card::after {

            content: "";

            position: absolute;

            width: 90px;

            height: 90px;

            border-radius: 50%;

            right: -30px;

            bottom: -35px;

            border: 2px solid
                rgba(245, 34, 59, 0.25);
        }


        .stat-title {

            color: #8998a8;

            font-size: 13px;

            margin-bottom: 12px;
        }


        .stat-number {

            font-size: 35px;

            font-weight: bold;

            color: #ffffff;
        }


        .stat-card:first-child
        .stat-number {

            color: #f5223b;
        }


        /* SECTION TITLE */

        .section-title {

            font-size: 24px;

            margin-bottom: 20px;
        }


        .section-title span {

            color: #f5223b;
        }


        /* MANAGEMENT GRID */

        .management {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 20px;
        }


        .management-card {

            background: #111820;

            border: 1px solid #29323c;

            border-radius: 13px;

            padding: 27px;

            min-height: 215px;

            display: flex;

            flex-direction: column;

            justify-content: space-between;

            transition: 0.3s;
        }


        .management-card:hover {

            transform: translateY(-4px);

            border-color: #f5223b;
        }


        .card-top h3 {

            font-size: 19px;

            margin-bottom: 10px;
        }


        .card-top p {

            color: #8291a2;

            font-size: 13px;

            line-height: 1.6;
        }


        .manage-btn {

            display: block;

            text-align: center;

            text-decoration: none;

            padding: 12px;

            border-radius: 7px;

            background: #f5223b;

            color: #ffffff;

            font-size: 13px;

            font-weight: bold;

            transition: 0.3s;
        }


        .manage-btn:hover {

            background: #cf1730;
        }


        .manage-btn.secondary {

            background: #171e26;

            border: 1px solid #35404b;
        }


        .manage-btn.secondary:hover {

            background: #f5223b;

            border-color: #f5223b;
        }


        /* QUICK ACTIONS */

        .quick-section {

            margin-top: 50px;
        }


        .quick-actions {

            display: flex;

            gap: 15px;

            flex-wrap: wrap;
        }


        .quick-btn {

            text-decoration: none;

            color: #d9e0e7;

            background: #111820;

            border: 1px solid #29323c;

            padding: 13px 20px;

            border-radius: 7px;

            font-size: 13px;

            transition: 0.3s;
        }


        .quick-btn:hover {

            border-color: #f5223b;

            color: #ffffff;
        }


        /* FOOTER */

        footer {

            background: #090e14;

            border-top: 1px solid #252b32;

            text-align: center;

            padding: 24px;

            color: #68788a;

            font-size: 13px;
        }


        /* RESPONSIVE */

        @media (max-width: 900px) {

            .stats {

                grid-template-columns:
                    repeat(2, 1fr);
            }


            .management {

                grid-template-columns:
                    repeat(2, 1fr);
            }
        }


        @media (max-width: 650px) {

            .navbar {

                padding: 0 5%;
            }


            .admin-info {

                gap: 8px;
            }


            .container {

                width: 92%;
            }


            .header {

                flex-direction: column;

                gap: 20px;
            }


            .stats {

                grid-template-columns: 1fr;
            }


            .management {

                grid-template-columns: 1fr;
            }
        }

    </style>

</head>


<body>


<!-- NAVBAR -->

<div class="navbar">


    <div class="logo">

        Cine<span>Book</span>

    </div>


    <div class="admin-info">

        <span>
            Admin:
            <span class="admin-name">
                <%= adminUsername %>
            </span>
        </span>


        <a
            href="AdminLogoutServlet"
            class="logout-btn">

            Logout

        </a>

    </div>

</div>


<!-- MAIN -->

<div class="container">


    <!-- HEADER -->

    <div class="header">


        <div>

            <h1>
                Admin <span>Dashboard</span>
            </h1>

            <p>
                Manage your CineBook movie booking system.
            </p>

        </div>


        <a
            href="javascript:history.back()"
            class="back-btn">

            Back

        </a>

    </div>


    <!-- STATISTICS -->

    <div class="stats">


        <div class="stat-card">

            <div class="stat-title">
                Total Movies
            </div>

            <div class="stat-number">
                <%= movieCount %>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-title">
                Registered Users
            </div>

            <div class="stat-number">
                <%= userCount %>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-title">
                Total Bookings
            </div>

            <div class="stat-number">
                <%= bookingCount %>
            </div>

        </div>


        <div class="stat-card">

            <div class="stat-title">
                Available Seats
            </div>

            <div class="stat-number">
                <%= availableSeats %>
            </div>

        </div>


    </div>


    <!-- MANAGEMENT -->

    <h2 class="section-title">

        Management <span>Panel</span>

    </h2>


    <div class="management">


        <!-- MOVIES -->

        <div class="management-card">

            <div class="card-top">

                <h3>
                    Movie Management
                </h3>

                <p>
                    Add new movies and maintain
                    the CineBook movie catalogue.
                </p>

            </div>


            <a
                href="addMovie.jsp"
                class="manage-btn">

                Add Movie

            </a>

        </div>


        <!-- SHOWS -->

        <div class="management-card">

            <div class="card-top">

                <h3>
                    Show Management
                </h3>

                <p>
                    Add movie shows, timings,
                    screens and ticket prices.
                </p>

            </div>


            <a
                href="addShow.jsp"
                class="manage-btn">

                Add Show

            </a>

        </div>


        <!-- BOOKINGS -->

        <div class="management-card">

            <div class="card-top">

                <h3>
                    Booking Management
                </h3>

                <p>
                    View customer bookings,
                    selected seats and amounts.
                </p>

            </div>


            <a
                href="AdminBookingsServlet"
                class="manage-btn secondary">

                View Bookings

            </a>

        </div>


        <!-- USERS -->

        <div class="management-card">

            <div class="card-top">

                <h3>
                    User Management
                </h3>

                <p>
                    View registered CineBook users
                    and their account details.
                </p>

            </div>


            <a
                href="AdminUsersServlet"
                class="manage-btn secondary">

                View Users

            </a>

        </div>


        <!-- SEATS -->

        <div class="management-card">

            <div class="card-top">

                <h3>
                    Seat Management
                </h3>

                <p>
                    Check seat availability and
                    booking status for each show.
                </p>

            </div>


            <a
                href="AdminSeatsServlet"
                class="manage-btn secondary">

                View Seats

            </a>

        </div>


        <!-- MOVIE CATALOGUE -->

        <div class="management-card">

            <div class="card-top">

                <h3>
                    Movie Catalogue
                </h3>

                <p>
                    Open the customer movie catalogue
                    and view available movies.
                </p>

            </div>


            <a
                href="MovieServlet"
                class="manage-btn secondary">

                View Movies

            </a>

        </div>


    </div>


    <!-- QUICK ACTIONS -->

    <div class="quick-section">


        <h2 class="section-title">

            Quick <span>Actions</span>

        </h2>


        <div class="quick-actions">


            <a
                href="index.html"
                class="quick-btn">

                Main Website

            </a>


            <a
                href="addMovie.jsp"
                class="quick-btn">

                Add Movie

            </a>


            <a
                href="addShow.jsp"
                class="quick-btn">

                Add Show

            </a>


            <a
                href="AdminBookingsServlet"
                class="quick-btn">

                All Bookings

            </a>


            <a
                href="AdminUsersServlet"
                class="quick-btn">

                All Users

            </a>


        </div>

    </div>


</div>


<footer>

    CineBook - Online Movie Ticket Booking System

</footer>


</body>

</html>