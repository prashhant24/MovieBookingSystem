<%@ page contentType="text/html;charset=UTF-8" %>

<%
    Integer movieId = (Integer) request.getAttribute("movie_id");
    String title = (String) request.getAttribute("title");
    String genre = (String) request.getAttribute("genre");
    String language = (String) request.getAttribute("language");
    Integer duration = (Integer) request.getAttribute("duration");
    Double rating = (Double) request.getAttribute("rating");
    String description = (String) request.getAttribute("description");

    String posterImage = "images/default.jpg";

    if (title != null) {

        if (title.equalsIgnoreCase("Avengers: Endgame")) {
            posterImage = "images/avengers end game.jpg";
        }

        else if (title.equalsIgnoreCase("3 Idiots")) {
            posterImage = "images/3 idiots.jpg";
        }

        else if (title.equalsIgnoreCase("Interstellar")) {
            posterImage = "images/interstellar.jpg";
        }

        else if (title.equalsIgnoreCase("Dangal")) {
            posterImage = "images/Dangal.jpg";
        }

        else if (title.equalsIgnoreCase("F1")) {
            posterImage = "images/f1.jpg";
        }
    }
%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook | Movie Details</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;

            font-family: Arial, Helvetica, sans-serif;
        }


        /* =========================================
           BODY
        ========================================= */

        body {

            min-height: 100vh;

            background:

                radial-gradient(
                    circle at 85% 20%,
                    rgba(239, 35, 60, 0.12),
                    transparent 30%
                ),

                #070b10;

            color: white;
        }


        /* =========================================
           NAVBAR
        ========================================= */

        .navbar {

            height: 78px;

            background: #0b1016;

            border-bottom: 1px solid #202933;

            display: flex;

            align-items: center;

            justify-content: space-between;

            padding: 0 6%;

            position: sticky;

            top: 0;

            z-index: 100;
        }


        .logo {

            color: white;

            text-decoration: none;

            font-size: 28px;

            font-weight: 800;

            letter-spacing: -1px;
        }


        .logo span {

            color: #ef233c;
        }


        .nav-links {

            display: flex;

            gap: 8px;
        }


        .nav-links a {

            color: #cbd2d9;

            text-decoration: none;

            padding: 10px 16px;

            border-radius: 7px;

            font-size: 14px;

            font-weight: 600;

            transition: 0.25s;
        }


        .nav-links a:hover {

            background: #1a2129;

            color: white;
        }


        .nav-links .active {

            background: #ef233c;

            color: white;
        }


        /* =========================================
           MAIN CONTAINER
        ========================================= */

        .container {

            width: 88%;

            max-width: 1150px;

            margin: auto;

            padding: 35px 0 60px;
        }


        /* =========================================
           BACK BUTTON
        ========================================= */

        .back-wrapper {

            margin-bottom: 25px;
        }


        .back-button {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 88px;

            height: 40px;

            padding: 0 18px;

            background: #141b22;

            color: #d8dee5;

            border: 1px solid #34404b;

            border-radius: 8px;

            text-decoration: none;

            font-size: 14px;

            font-weight: 600;

            transition: all 0.25s ease;
        }


        .back-button:hover {

            background: #ef233c;

            color: white;

            border-color: #ef233c;

            transform: translateX(-3px);

            box-shadow:

                0 8px 20px
                rgba(239, 35, 60, 0.20);
        }


        /* =========================================
           MOVIE DETAILS CARD
        ========================================= */

        .movie-details-card {

            display: grid;

            grid-template-columns: 330px 1fr;

            gap: 42px;

            padding: 32px;

            background:

                linear-gradient(
                    145deg,
                    #151c23,
                    #0e141a
                );

            border: 1px solid #27313b;

            border-radius: 18px;

            box-shadow:

                0 20px 50px
                rgba(0, 0, 0, 0.30);
        }


        /* =========================================
           POSTER
        ========================================= */

        .poster-container {

            width: 100%;

            height: 475px;

            border-radius: 12px;

            overflow: hidden;

            background: #111820;

            border: 1px solid #303b46;
        }


        .poster {

            width: 100%;

            height: 100%;

            object-fit: cover;

            display: block;
        }


        /* =========================================
           MOVIE INFORMATION
        ========================================= */

        .movie-info {

            display: flex;

            flex-direction: column;

            justify-content: center;
        }


        .small-heading {

            color: #ef233c;

            font-size: 12px;

            font-weight: bold;

            letter-spacing: 3px;

            text-transform: uppercase;

            margin-bottom: 12px;
        }


        .movie-title {

            font-size: 42px;

            line-height: 1.15;

            margin-bottom: 20px;

            color: white;
        }


        /* =========================================
           RATING
        ========================================= */

        .rating-box {

            display: inline-flex;

            align-items: center;

            gap: 12px;

            width: fit-content;

            padding: 11px 15px;

            margin-bottom: 24px;

            background: rgba(239, 35, 60, 0.08);

            border: 1px solid rgba(239, 35, 60, 0.22);

            border-radius: 8px;
        }


        .rating-label {

            color: #8e9aa6;

            font-size: 13px;

            font-weight: 600;
        }


        .rating-value {

            color: #ef233c;

            font-size: 17px;

            font-weight: bold;
        }


        /* =========================================
           MOVIE META
        ========================================= */

        .movie-meta {

            display: grid;

            grid-template-columns:
                repeat(3, 1fr);

            gap: 12px;

            margin-bottom: 25px;
        }


        .meta-box {

            background: #0b1117;

            border: 1px solid #252f39;

            border-radius: 8px;

            padding: 13px;
        }


        .meta-label {

            display: block;

            color: #66737f;

            font-size: 11px;

            text-transform: uppercase;

            margin-bottom: 6px;

            letter-spacing: 0.5px;
        }


        .meta-value {

            color: #e0e5ea;

            font-size: 14px;

            font-weight: 600;
        }


        /* =========================================
           DESCRIPTION
        ========================================= */

        .description-heading {

            font-size: 16px;

            margin-bottom: 9px;

            color: #e6ebef;
        }


        .description {

            color: #929da8;

            font-size: 14px;

            line-height: 1.75;

            margin-bottom: 28px;

            max-width: 650px;
        }


        /* =========================================
           BOOKING BUTTON
        ========================================= */

        .show-button {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            width: 100%;

            min-height: 52px;

            background: #ef233c;

            color: white;

            text-decoration: none;

            border-radius: 8px;

            font-size: 15px;

            font-weight: bold;

            transition: all 0.25s ease;
        }


        .show-button:hover {

            background: #c9182e;

            transform: translateY(-2px);

            box-shadow:

                0 10px 25px
                rgba(239, 35, 60, 0.22);
        }


        /* =========================================
           FOOTER
        ========================================= */

        .footer {

            border-top: 1px solid #202933;

            text-align: center;

            padding: 25px;

            color: #66727e;

            font-size: 12px;
        }


        /* =========================================
           ERROR
        ========================================= */

        .error-card {

            text-align: center;

            padding: 70px 30px;

            background: #11171e;

            border: 1px solid #27313b;

            border-radius: 15px;
        }


        .error-card h2 {

            margin-bottom: 12px;

            color: white;
        }


        .error-card p {

            color: #8995a1;

            margin-bottom: 25px;
        }


        /* =========================================
           TABLET
        ========================================= */

        @media (max-width: 850px) {

            .movie-details-card {

                grid-template-columns: 260px 1fr;

                gap: 25px;

                padding: 25px;
            }


            .poster-container {

                height: 400px;
            }


            .movie-title {

                font-size: 32px;
            }


            .movie-meta {

                grid-template-columns: 1fr 1fr;
            }

        }


        /* =========================================
           MOBILE
        ========================================= */

        @media (max-width: 650px) {

            .navbar {

                height: auto;

                padding: 18px 5%;

                gap: 15px;

                flex-direction: column;
            }


            .nav-links {

                width: 100%;

                justify-content: center;
            }


            .container {

                width: 92%;

                padding-top: 25px;
            }


            .movie-details-card {

                grid-template-columns: 1fr;

                padding: 20px;
            }


            .poster-container {

                height: 430px;

                max-width: 300px;

                margin: auto;
            }


            .movie-info {

                display: block;
            }


            .movie-title {

                font-size: 30px;
            }


            .movie-meta {

                grid-template-columns: 1fr 1fr;
            }

        }

    </style>

</head>


<body>


    <!-- =========================================
         NAVBAR
    ========================================= -->

    <nav class="navbar">


        <a href="index.html"
           class="logo">

            Cine<span>Book</span>

        </a>


        <div class="nav-links">


            <a href="index.html">

                Home

            </a>


            <a href="MovieServlet"
               class="active">

                Movies

            </a>


            <a href="welcome.jsp">

                Account

            </a>


        </div>


    </nav>



    <!-- =========================================
         MAIN
    ========================================= -->

    <main class="container">


        <!-- BACK BUTTON -->

        <div class="back-wrapper">

            <a href="javascript:history.back()"
               class="back-button">

                Back

            </a>

        </div>



        <%

            if (movieId != null && title != null) {

        %>


        <!-- =====================================
             MOVIE DETAILS
        ====================================== -->

        <div class="movie-details-card">


            <!-- POSTER -->

            <div class="poster-container">

                <img

                    src="<%= posterImage %>"

                    alt="<%= title %>"

                    class="poster"

                >

            </div>



            <!-- INFORMATION -->

            <div class="movie-info">


                <div class="small-heading">

                    Movie Details

                </div>


                <h1 class="movie-title">

                    <%= title %>

                </h1>



                <!-- RATING -->

                <div class="rating-box">


                    <span class="rating-label">

                        Rating

                    </span>


                    <span class="rating-value">

                        <%= String.format(
                            "%.1f",
                            rating
                        ) %> / 10

                    </span>


                </div>



                <!-- MOVIE META -->

                <div class="movie-meta">


                    <div class="meta-box">

                        <span class="meta-label">

                            Genre

                        </span>


                        <span class="meta-value">

                            <%= genre %>

                        </span>

                    </div>



                    <div class="meta-box">

                        <span class="meta-label">

                            Language

                        </span>


                        <span class="meta-value">

                            <%= language %>

                        </span>

                    </div>



                    <div class="meta-box">

                        <span class="meta-label">

                            Duration

                        </span>


                        <span class="meta-value">

                            <%= duration %> min

                        </span>

                    </div>


                </div>



                <!-- DESCRIPTION -->

                <h3 class="description-heading">

                    About the Movie

                </h3>


                <p class="description">

                    <%= description %>

                </p>



                <!-- SHOWS -->

                <a

                    href="ShowServlet?movie_id=<%= movieId %>"

                    class="show-button">

                    View Shows & Timings

                </a>


            </div>


        </div>


        <%

            } else {

        %>


        <!-- =====================================
             MOVIE NOT FOUND
        ====================================== -->

        <div class="error-card">


            <h2>

                Movie Details Not Available

            </h2>


            <p>

                The requested movie could not be found.

            </p>


            <a href="MovieServlet"
               class="back-button">

                View Movies

            </a>


        </div>


        <%

            }

        %>


    </main>



    <!-- =========================================
         FOOTER
    ========================================= -->

    <footer class="footer">

        CineBook | Online Movie Ticket Booking System

    </footer>


</body>

</html>