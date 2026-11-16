<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String userName = (String) session.getAttribute("user_name");

    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }

    Object bookingIdObj =
            session.getAttribute("booking_id");

    Object bookingTotalObj =
            session.getAttribute("booking_total");

    Object bookingSeatsObj =
            session.getAttribute("booking_seats");


    String bookingId = "N/A";

    if (bookingIdObj != null) {
        bookingId = bookingIdObj.toString();
    }


    int seatCount = 0;

    if (bookingSeatsObj != null) {
        try {
            seatCount =
                    Integer.parseInt(
                            bookingSeatsObj.toString()
                    );
        } catch (Exception e) {
            seatCount = 0;
        }
    }


    double totalAmount = 0.0;

    if (bookingTotalObj != null) {
        try {
            totalAmount =
                    Double.parseDouble(
                            bookingTotalObj.toString()
                    );
        } catch (Exception e) {
            totalAmount = 0.0;
        }
    }
%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook - Booking Confirmed</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, Helvetica, sans-serif;
        }


        body {

            min-height: 100vh;

            background:
                radial-gradient(
                    circle at top,
                    #241016 0%,
                    #090b0f 45%,
                    #050607 100%
                );

            color: white;

            display: flex;

            flex-direction: column;
        }


        /* NAVBAR */

        .navbar {

            height: 62px;

            background: #080d13;

            border-bottom: 1px solid #252d35;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 6%;
        }


        .logo {

            font-size: 25px;

            font-weight: bold;

            color: white;
        }


        .logo span {

            color: #f5223b;
        }


        .nav-links {

            display: flex;

            gap: 5px;
        }


        .nav-links a {

            color: #dce2e8;

            text-decoration: none;

            padding: 9px 15px;

            border-radius: 6px;

            font-size: 12px;

            font-weight: bold;
        }


        .nav-links a:hover {

            background: #171e26;
        }


        .nav-links .active {

            background: #f5223b;

            color: white;
        }


        /* MAIN */

        .main {

            flex: 1;

            display: flex;

            justify-content: center;

            align-items: center;

            padding: 35px 20px;
        }


        /* CARD */

        .confirmation-card {

            width: 100%;

            max-width: 760px;

            background: #11161c;

            border: 1px solid #2b353f;

            border-radius: 14px;

            padding: 38px 45px;

            text-align: center;

            box-shadow:
                0 15px 45px rgba(0,0,0,0.45);
        }


        /* SUCCESS */

        .success-mark {

            width: 70px;

            height: 70px;

            margin: 0 auto 18px;

            border-radius: 50%;

            border: 3px solid #16c45b;

            display: flex;

            align-items: center;

            justify-content: center;

            color: #16c45b;

            font-size: 25px;

            font-weight: bold;
        }


        /* TITLE */

        h1 {

            font-size: 31px;

            margin-bottom: 10px;
        }


        h1 span {

            color: #f5223b;
        }


        .thank-you {

            color: #91a0af;

            font-size: 14px;

            margin-bottom: 28px;

        }


        .thank-you strong {

            color: white;
        }


        /* DETAILS */

        .details {

            background: #0a0f14;

            border: 1px solid #2b353e;

            border-radius: 11px;

            padding: 18px 25px;

            text-align: left;

            margin-bottom: 25px;
        }


        .detail-row {

            display: flex;

            justify-content: space-between;

            align-items: center;

            padding: 13px 0;

            border-bottom: 1px solid #222a32;
        }


        .detail-row:last-child {

            border-bottom: none;
        }


        .detail-label {

            color: #8090a0;

            font-size: 13px;
        }


        .detail-value {

            color: white;

            font-size: 14px;

            font-weight: bold;
        }


        .booking-id {

            color: #f5223b;
        }


        .amount {

            color: #f5223b;

            font-size: 18px;
        }


        .confirmed {

            color: #16c45b;
        }


        /* BUTTONS */

        .buttons {

            display: flex;

            justify-content: center;

            gap: 12px;

            flex-wrap: wrap;
        }


        .btn {

            display: inline-block;

            text-decoration: none;

            padding: 11px 23px;

            border-radius: 6px;

            font-size: 13px;

            font-weight: bold;

            transition: 0.2s;
        }


        .primary {

            background: #f5223b;

            color: white;
        }


        .primary:hover {

            background: #d9162e;
        }


        .secondary {

            background: #151c23;

            color: white;

            border: 1px solid #394550;
        }


        .secondary:hover {

            background: #202a34;

            border-color: #f5223b;
        }


        /* FOOTER */

        footer {

            text-align: center;

            border-top: 1px solid #202830;

            padding: 16px;

            color: #61707e;

            font-size: 10px;
        }


        @media(max-width:600px) {

            .confirmation-card {

                padding: 30px 18px;
            }


            h1 {

                font-size: 25px;
            }


            .navbar {

                padding: 0 3%;
            }


            .logo {

                font-size: 22px;
            }


            .nav-links a {

                padding: 7px;

                font-size: 10px;
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


    <div class="nav-links">

        <a href="index.html">
            Home
        </a>

        <a href="MovieServlet">
            Movies
        </a>

        <a href="welcome.jsp" class="active">
            Account
        </a>

    </div>

</nav>



<!-- MAIN -->

<main class="main">


    <div class="confirmation-card">


        <!-- SUCCESS -->

        <div class="success-mark">

            OK

        </div>


        <!-- TITLE -->

        <h1>

            Booking <span>Confirmed!</span>

        </h1>


        <p class="thank-you">

            Thank you,
            <strong><%= userName %></strong>!

            Your movie ticket has been booked successfully.

        </p>


        <!-- BOOKING DETAILS -->

        <div class="details">


            <div class="detail-row">

                <span class="detail-label">

                    Booking ID

                </span>


                <span class="detail-value booking-id">

                    #<%= bookingId %>

                </span>

            </div>


            <div class="detail-row">

                <span class="detail-label">

                    Number of Seats

                </span>


                <span class="detail-value">

                    <%= seatCount %>

                </span>

            </div>


            <div class="detail-row">

                <span class="detail-label">

                    Total Amount

                </span>


                <span class="detail-value amount">

                    Rs. <%= String.format("%.2f", totalAmount) %>

                </span>

            </div>


            <div class="detail-row">

                <span class="detail-label">

                    Status

                </span>


                <span class="detail-value confirmed">

                    CONFIRMED

                </span>

            </div>


        </div>


        <!-- BUTTONS -->

        <div class="buttons">


            <a href="MovieServlet"
               class="btn primary">

                Book Another Movie

            </a>


            <a href="welcome.jsp"
               class="btn secondary">

                Account

            </a>


            <a href="index.html"
               class="btn secondary">

                Home

            </a>


        </div>


    </div>


</main>



<footer>

    CineBook - Online Movie Ticket Booking System

</footer>


</body>

</html>