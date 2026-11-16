<%@ page import="java.sql.ResultSet" %>

<%
    /* =====================================================
       GET SHOW ID SAFELY
       ===================================================== */

    Object showIdObject = request.getAttribute("show_id");

    if (showIdObject == null) {
        response.sendRedirect("MovieServlet");
        return;
    }

    int showId = Integer.parseInt(showIdObject.toString());


    /* =====================================================
       GET SHOW INFORMATION
       ===================================================== */

    Object movieTitleObject =
            request.getAttribute("movieTitle");

    Object showDateObject =
            request.getAttribute("showDate");

    Object showTimeObject =
            request.getAttribute("showTime");

    Object screenObject =
            request.getAttribute("screen");

    Object priceObject =
            request.getAttribute("ticketPrice");


    String movieTitle =
            movieTitleObject != null
            ? movieTitleObject.toString()
            : "Movie";


    String showDate =
            showDateObject != null
            ? showDateObject.toString()
            : "";


    String showTime =
            showTimeObject != null
            ? showTimeObject.toString()
            : "";


    String screen =
            screenObject != null
            ? screenObject.toString()
            : "";


    double ticketPrice = 0;

    if (priceObject != null) {

        try {

            ticketPrice =
                    Double.parseDouble(
                            priceObject.toString()
                    );

        } catch (Exception e) {

            ticketPrice = 0;

        }
    }


    /* =====================================================
       GET SEATS
       ===================================================== */

    ResultSet seats =
            (ResultSet) request.getAttribute("seats");

%>


<!DOCTYPE html>

<html>

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook - Select Seats</title>


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

            padding: 0 4%;
        }


        .logo {

            font-size: 30px;

            font-weight: bold;

            color: white;
        }


        .logo span {

            color: #f5223b;
        }


        .nav-links {

            display: flex;

            gap: 10px;

            align-items: center;
        }


        .nav-links a {

            color: white;

            text-decoration: none;

            padding: 10px 18px;

            border-radius: 7px;

            font-size: 14px;

            font-weight: bold;
        }


        .nav-links a:hover {

            background: #1c232b;
        }


        .nav-links .active {

            background: #f5223b;
        }


        /* MAIN */

        .container {

            width: 92%;

            max-width: 1250px;

            margin: auto;

            padding: 30px 0 60px;
        }


        /* HEADER */

        .top-section {

            display: flex;

            justify-content: space-between;

            align-items: center;

            margin-bottom: 25px;
        }


        .heading h1 {

            font-size: 32px;

            margin-bottom: 7px;
        }


        .heading h1 span {

            color: #f5223b;
        }


        .heading p {

            color: #8190a1;

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


        /* SHOW INFO */

        .show-info {

            display: grid;

            grid-template-columns: repeat(4, 1fr);

            background: #111214;

            border: 1px solid #292d32;

            border-radius: 14px;

            padding: 22px;

            margin-bottom: 28px;
        }


        .show-item {

            padding: 0 25px;

            border-right: 1px solid #292d32;
        }


        .show-item:first-child {

            padding-left: 0;
        }


        .show-item:last-child {

            border-right: none;
        }


        .label {

            display: block;

            color: #728091;

            font-size: 12px;

            text-transform: uppercase;

            margin-bottom: 7px;
        }


        .value {

            color: white;

            font-size: 16px;

            font-weight: bold;
        }


        /* SCREEN */

        .screen-area {

            text-align: center;

            margin: 35px auto 45px;
        }


        .screen {

            width: 58%;

            height: 12px;

            background: #f00019;

            margin: auto;

            border-radius: 50%;

            box-shadow: 0 0 25px rgba(245,34,59,0.35);
        }


        .screen-label {

            color: #778595;

            letter-spacing: 4px;

            font-size: 12px;

            margin-top: 16px;
        }


        /* SEAT PANEL */

        .seat-panel {

            background: #111111;

            border: 1px solid #292d32;

            border-radius: 14px;

            padding: 35px;

            margin-bottom: 30px;
        }


        /* LEGEND */

        .legend {

            display: flex;

            justify-content: center;

            gap: 32px;

            margin-bottom: 35px;
        }


        .legend-item {

            display: flex;

            align-items: center;

            gap: 9px;

            color: #9aa5b1;

            font-size: 13px;
        }


        .legend-box {

            width: 20px;

            height: 20px;

            border-radius: 5px;

            border: 1px solid #4a4a4a;

            background: #222222;
        }


        .legend-box.selected {

            background: #f00019;

            border-color: #f00019;
        }


        .legend-box.booked {

            background: #5b5b5b;

            border-color: #5b5b5b;
        }


        /* SEAT LAYOUT */

        .seat-layout {

            width: 330px;

            margin: auto;
        }


        .seat-row {

            display: grid;

            grid-template-columns: 25px repeat(5, 1fr);

            gap: 12px;

            align-items: center;

            margin-bottom: 15px;
        }


        .row-label {

            color: #7c8794;

            font-size: 13px;

            text-align: center;
        }


        .seat input {

            display: none;
        }


        .seat label {

            display: flex;

            align-items: center;

            justify-content: center;

            height: 44px;

            background: #242424;

            border: 1px solid #454545;

            border-radius: 7px;

            color: #d9dfe5;

            font-size: 13px;

            cursor: pointer;

            transition: 0.2s;
        }


        .seat label:hover {

            border-color: #f5223b;

            transform: translateY(-2px);
        }


        /* SELECTED */

        .seat input:checked + label {

            background: #f00019;

            border-color: #f00019;

            color: white;

            box-shadow: 0 0 12px rgba(245,34,59,0.25);
        }


        /* BOOKED */

        .seat.booked label {

            background: #5b5b5b;

            border-color: #5b5b5b;

            color: #d0d0d0;

            cursor: not-allowed;
        }


        /* SUMMARY */

        .summary {

            background: #111111;

            border: 1px solid #292d32;

            border-radius: 14px;

            padding: 25px;

            display: flex;

            justify-content: space-between;

            align-items: center;

            gap: 25px;
        }


        .summary-title {

            font-size: 19px;

            margin-bottom: 7px;
        }


        .selected-text {

            color: #8c99a8;

            font-size: 14px;
        }


        .summary-right {

            display: flex;

            align-items: center;

            gap: 28px;
        }


        .total-label {

            color: #7c8794;

            font-size: 12px;

            margin-bottom: 5px;

            text-align: right;
        }


        .total {

            color: #f00019;

            font-size: 27px;

            font-weight: bold;
        }


        .confirm-btn {

            border: none;

            background: #f00019;

            color: white;

            padding: 14px 25px;

            border-radius: 7px;

            font-size: 14px;

            font-weight: bold;

            cursor: pointer;
        }


        .confirm-btn:hover {

            background: #d90016;
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

        @media(max-width:800px) {

            .show-info {

                grid-template-columns: 1fr 1fr;

                gap: 20px;
            }


            .show-item {

                border-right: none;

                padding: 10px 0;
            }


            .summary {

                flex-direction: column;

                align-items: flex-start;
            }


            .summary-right {

                width: 100%;

                justify-content: space-between;
            }

        }


        @media(max-width:550px) {

            .show-info {

                grid-template-columns: 1fr;
            }


            .seat-panel {

                padding: 20px 10px;
            }


            .screen {

                width: 85%;
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

<div class="container">


    <!-- HEADER -->

    <div class="top-section">


        <div class="heading">

            <h1>
                Select Your <span>Seats</span>
            </h1>

            <p>
                Choose your preferred seats before confirming your booking.
            </p>

        </div>


        <a
            href="javascript:history.back()"
            class="back-btn">

            Back

        </a>

    </div>


    <!-- SHOW DETAILS -->

    <div class="show-info">


        <div class="show-item">

            <span class="label">
                Movie
            </span>

            <span class="value">
                <%= movieTitle %>
            </span>

        </div>


        <div class="show-item">

            <span class="label">
                Date
            </span>

            <span class="value">
                <%= showDate %>
            </span>

        </div>


        <div class="show-item">

            <span class="label">
                Time
            </span>

            <span class="value">
                <%= showTime %>
            </span>

        </div>


        <div class="show-item">

            <span class="label">
                Screen
            </span>

            <span class="value">
                <%= screen %>
            </span>

        </div>


    </div>


    <!-- SCREEN -->

    <div class="screen-area">

        <div class="screen"></div>

        <div class="screen-label">
            SCREEN
        </div>

    </div>


    <!-- BOOKING FORM -->

    <form
        action="BookingServlet"
        method="post"
        onsubmit="return validateBooking();">


        <!-- SHOW ID -->

        <input
            type="hidden"
            name="show_id"
            value="<%= showId %>">


        <!-- SEAT PANEL -->

        <div class="seat-panel">


            <!-- LEGEND -->

            <div class="legend">


                <div class="legend-item">

                    <div class="legend-box"></div>

                    Available

                </div>


                <div class="legend-item">

                    <div class="legend-box selected"></div>

                    Selected

                </div>


                <div class="legend-item">

                    <div class="legend-box booked"></div>

                    Booked

                </div>


            </div>


            <!-- SEATS -->

            <div class="seat-layout">


            <%
                if (seats != null) {

                    String currentRow = "";

                    while (seats.next()) {


                        int seatId =
                                seats.getInt("seat_id");


                        String seatNumber =
                                seats.getString("seat_number");


                        String status =
                                seats.getString("status");


                        String row =
                                seatNumber.substring(0, 1);


                        if (!row.equals(currentRow)) {


                            if (!currentRow.equals("")) {
            %>

                                </div>

            <%
                            }


                            currentRow = row;
            %>


                            <div class="seat-row">


                                <div class="row-label">
                                    <%= row %>
                                </div>


            <%
                        }


                        boolean booked =
                                "BOOKED".equalsIgnoreCase(status);

            %>


                        <div class="seat <%= booked ? "booked" : "" %>">


            <%
                        if (booked) {
            %>


                            <label>
                                <%= seatNumber %>
                            </label>


            <%
                        } else {
            %>


                            <!--
                                IMPORTANT:
                                BookingServlet receives seat_id
                            -->

                            <input
                                type="checkbox"
                                id="seat_<%= seatId %>"
                                name="seat_id"
                                value="<%= seatId %>"
                                data-seat-number="<%= seatNumber %>"
                                data-price="<%= ticketPrice %>">


                            <label
                                for="seat_<%= seatId %>">

                                <%= seatNumber %>

                            </label>


            <%
                        }
            %>


                        </div>


            <%
                    }


                    if (!currentRow.equals("")) {
            %>

                            </div>

            <%
                    }

                }
            %>


            </div>


        </div>


        <!-- BOOKING SUMMARY -->

        <div class="summary">


            <div>


                <div class="summary-title">

                    Booking Summary

                </div>


                <div
                    class="selected-text"
                    id="selectedText">

                    Selected Seats: None

                </div>


            </div>


            <div class="summary-right">


                <div>


                    <div class="total-label">

                        Total Amount

                    </div>


                    <div class="total">

                        Rs.
                        <span id="totalAmount">
                            0.00
                        </span>

                    </div>


                </div>


                <button
                    type="submit"
                    class="confirm-btn">

                    Confirm Booking

                </button>


            </div>


        </div>


    </form>


</div>


<footer>

    CineBook - Online Movie Ticket Booking System

</footer>


<script>


    /* GET ALL AVAILABLE SEATS */

    const seatCheckboxes =
        document.querySelectorAll(
            'input[name="seat_id"]'
        );


    const selectedText =
        document.getElementById(
            "selectedText"
        );


    const totalAmount =
        document.getElementById(
            "totalAmount"
        );


    /* UPDATE BOOKING SUMMARY */

    function updateSummary() {


        let selectedSeats = [];

        let total = 0;


        seatCheckboxes.forEach(
            function(seat) {


                if (seat.checked) {


                    selectedSeats.push(
                        seat.getAttribute(
                            "data-seat-number"
                        )
                    );


                    total += parseFloat(
                        seat.getAttribute(
                            "data-price"
                        )
                    );

                }

            }
        );


        if (selectedSeats.length === 0) {

            selectedText.innerHTML =
                "Selected Seats: None";

        } else {

            selectedText.innerHTML =
                "Selected Seats: "
                + selectedSeats.join(", ");

        }


        totalAmount.innerHTML =
            total.toFixed(2);

    }


    /* SEAT CLICK EVENT */

    seatCheckboxes.forEach(
        function(seat) {

            seat.addEventListener(
                "change",
                updateSummary
            );

        }
    );


    /* FORM VALIDATION */

    function validateBooking() {


        const selected =
            document.querySelectorAll(
                'input[name="seat_id"]:checked'
            );


        if (selected.length === 0) {

            alert(
                "Please select at least one seat."
            );

            return false;
        }


        return true;

    }


    updateSummary();

</script>


</body>

</html>