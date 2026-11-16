<%@ page import="java.sql.ResultSet" %>

<%
    ResultSet bookings =
        (ResultSet) request.getAttribute("bookings");
%>

<!DOCTYPE html>
<html>

<head>

    <meta charset="UTF-8">

    <title>All Bookings - CineBook Admin</title>

    <style>

        body {
            margin: 0;
            font-family: Arial, sans-serif;
            background: #f4f4f4;
        }

        .navbar {
            background: #222;
            color: white;
            padding: 20px 40px;
        }

        .navbar h2 {
            display: inline;
        }

        .back {
            float: right;
            color: white;
            text-decoration: none;
            background: #555;
            padding: 9px 16px;
            border-radius: 5px;
        }

        .container {
            width: 95%;
            margin: 40px auto;
        }

        h1 {
            text-align: center;
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
            min-width: 1000px;
        }

        th {
            background: #222;
            color: white;
            padding: 14px;
        }

        td {
            padding: 13px;
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
            margin-top: 25px;
            padding: 12px 25px;
            background: #ff4b2b;
            color: white;
            text-decoration: none;
            border-radius: 6px;
        }

    </style>

</head>

<body>
    
<div class="back-wrapper">
    <a href="javascript:history.back()" class="back-button">
        Back
    </a>
</div>

<div class="navbar">

    <h2>CineBook Admin</h2>

    <a href="adminDashboard.jsp"
       class="back">
        Dashboard
    </a>

</div>


<div class="container">

    <h1>All Bookings</h1>

    <div class="table-box">

        <table>

            <tr>

                <th>Booking ID</th>
                <th>User</th>
                <th>Movie</th>
                <th>Date</th>
                <th>Time</th>
                <th>Screen</th>
                <th>Seats</th>
                <th>Amount</th>
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
                    <%= bookings.getString("user_name") %>
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

                <td>
                    <%= bookings.getString("seats") %>
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

                <td colspan="9">
                    No bookings found.
                </td>

            </tr>

            <%
                }
            %>

        </table>


        <div style="text-align:center;">

            <a href="adminDashboard.jsp"
               class="btn">
                Back to Dashboard
            </a>

        </div>

    </div>

</div>

</body>

</html>