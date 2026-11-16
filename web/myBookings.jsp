<%@ page import="java.sql.ResultSet" %>

<%
    ResultSet bookings =
        (ResultSet) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>My Bookings - CineBook</title>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }

        .navbar {
            background: #222;
            padding: 18px 40px;
            color: white;
        }

        .navbar h2 {
            display: inline;
            margin-right: 40px;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-right: 20px;
        }

        .container {
            width: 90%;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
            color: #222;
            margin-bottom: 30px;
        }

        .table-box {
            background: white;
            padding: 25px;
            border-radius: 12px;
            box-shadow: 0 0 15px #ccc;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th {
            background: #222;
            color: white;
            padding: 14px;
        }

        td {
            padding: 14px;
            text-align: center;
            border-bottom: 1px solid #ddd;
        }

        tr:hover {
            background: #f5f5f5;
        }

        .confirmed {
            color: #28a745;
            font-weight: bold;
        }

        .amount {
            font-weight: bold;
        }

        .btn {
            display: inline-block;
            text-decoration: none;
            background: #ff4b2b;
            color: white;
            padding: 12px 20px;
            border-radius: 6px;
            margin-top: 25px;
        }

        .btn:hover {
            background: #e63e20;
        }

    </style>

</head>

<body>

<div class="navbar">

    <h2>CineBook</h2>

    <a href="MovieServlet">Movies</a>

    <a href="MyBookingsServlet">My Bookings</a>

    <a href="index.html">Home</a>
    
    <a href="LogoutServlet">Logout</a>

</div>


<div class="container">

    <h1>My Bookings</h1>

    <div class="table-box">

        <table>

            <tr>

                <th>Booking ID</th>

                <th>Movie</th>

                <th>Date</th>

                <th>Time</th>

                <th>Screen</th>

                <th>Total Amount</th>

                <th>Status</th>

            </tr>

            <%
                boolean hasBookings = false;

                while (bookings.next()) {

                    hasBookings = true;
            %>

            <tr>

                <td>
                    <%= bookings.getInt("booking_id") %>
                </td>

                <td>
                    <%= bookings.getString("title") %>
                </td>

                <td>
                    <%= bookings.getDate("show_date") %>
                </td>

                <td>
                    <%= bookings.getString("show_time") %>
                </td>

                <td>
                    <%= bookings.getString("screen") %>
                </td>

                <td class="amount">
                    ?<%= bookings.getDouble("total_amount") %>
                </td>

                <td class="confirmed">
                    <%= bookings.getString("status") %>
                </td>

            </tr>

            <%
                }

                if (!hasBookings) {
            %>

            <tr>

                <td colspan="7">

                    You have no bookings yet.

                </td>

            </tr>

            <%
                }
            %>

        </table>

        <div style="text-align:center;">

            <a href="MovieServlet" class="btn">
                Book a Movie
            </a>

        </div>

    </div>

</div>

</body>

</html>