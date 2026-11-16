<%@ page import="java.sql.ResultSet" %>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>CineBook - Movies</title>

    <style>

        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }

        body {
            background:
                radial-gradient(circle at 50% 0%, #250914, #080a0e 55%);
            color: #ffffff;
            min-height: 100vh;
        }

        .navbar {
            height: 62px;
            background: #080d13;
            border-bottom: 1px solid #27313b;
            display: flex;
            align-items: center;
            justify-content: space-between;
            padding: 0 6%;
        }

        .logo {
            font-size: 26px;
            font-weight: bold;
        }

        .logo span {
            color: #f5223b;
        }

        .nav a {
            color: #dce2e8;
            text-decoration: none;
            font-size: 13px;
            font-weight: bold;
            padding: 10px 17px;
            border-radius: 7px;
            margin-left: 4px;
        }

        .nav a:hover,
        .nav .active {
            background: #f5223b;
            color: white;
        }

        .container {
            width: 94%;
            max-width: 1220px;
            margin: auto;
            padding: 24px 0 50px;
        }

        .top {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 18px;
        }

        .back {
            color: white;
            text-decoration: none;
            border: 1px solid #39444e;
            background: #11171d;
            padding: 8px 16px;
            border-radius: 6px;
            font-size: 12px;
        }

        .back:hover {
            border-color: #f5223b;
        }

        .heading {
            text-align: center;
            margin-bottom: 25px;
        }

        .heading h1 {
            font-size: 28px;
            margin-bottom: 7px;
        }

        .heading h1 span {
            color: #f5223b;
        }

        .heading p {
            color: #82909e;
            font-size: 12px;
        }

        .movies-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 22px;
        }

        .movie-card {
            background: #111820;
            border: 1px solid #29343e;
            border-radius: 12px;
            overflow: hidden;
            transition: 0.25s;
        }

        .movie-card:hover {
            transform: translateY(-4px);
            border-color: #f5223b;
        }

        .poster {
            width: 100%;
            height: 330px;
            object-fit: cover;
            display: block;
            background: #090d12;
        }

        .movie-content {
            padding: 16px;
        }

        .movie-title {
            font-size: 19px;
            margin-bottom: 12px;
        }

        .details {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 7px;
        }

        .detail {
            background: #0a1016;
            border: 1px solid #26313a;
            padding: 9px;
            border-radius: 6px;
        }

        .label {
            display: block;
            color: #71808e;
            font-size: 9px;
            text-transform: uppercase;
            margin-bottom: 4px;
            letter-spacing: 1px;
        }

        .value {
            font-size: 11px;
            font-weight: bold;
        }

        .rating {
            margin-top: 10px;
            background: #24141a;
            border: 1px solid #57212d;
            padding: 10px;
            border-radius: 6px;
            display: flex;
            justify-content: space-between;
            font-size: 12px;
        }

        .rating-value {
            color: #f5223b;
            font-weight: bold;
        }

        .description {
            color: #8794a1;
            font-size: 11px;
            line-height: 1.6;
            margin: 12px 0;
            min-height: 35px;
        }

        .btn {
            display: block;
            width: 100%;
            text-align: center;
            text-decoration: none;
            background: #f5223b;
            color: white;
            padding: 10px;
            border-radius: 6px;
            font-size: 12px;
            font-weight: bold;
        }

        .btn:hover {
            background: #d9162e;
        }

        footer {
            text-align: center;
            color: #5e6a76;
            font-size: 10px;
            border-top: 1px solid #202832;
            padding: 18px;
            margin-top: 20px;
        }

        @media(max-width: 850px) {
            .movies-grid {
                grid-template-columns: repeat(2, 1fr);
            }
        }

        @media(max-width: 550px) {
            .movies-grid {
                grid-template-columns: 1fr;
            }

            .navbar {
                padding: 0 3%;
            }

            .nav a {
                padding: 8px;
                font-size: 11px;
            }
        }

    </style>

</head>

<body>


<div class="navbar">

    <div class="logo">
        Cine<span>Book</span>
    </div>

    <div class="nav">

        <a href="index.html">Home</a>

        <a href="MovieServlet" class="active">Movies</a>

        <a href="register.jsp">Register</a>

        <a href="login.jsp">Login</a>

        <a href="adminLogin.jsp">Admin</a>

    </div>

</div>


<div class="container">


    <div class="top">

        <a href="index.html" class="back">
            Back
        </a>

    </div>


    <div class="heading">

        <h1>
            Now <span>Showing</span>
        </h1>

        <p>
            Choose your favourite movie and continue to book your tickets.
        </p>

    </div>


    <div class="movies-grid">


<%

    ResultSet movies =
        (ResultSet) request.getAttribute("movies");

    while (movies != null && movies.next()) {

        int movieId = movies.getInt("movie_id");

        String title = movies.getString("title");

        String genre = movies.getString("genre");

        String language = movies.getString("language");

        int duration = movies.getInt("duration");

        double rating = movies.getDouble("rating");

        String description =
            movies.getString("description");

        String poster = "images/default.jpg";

        if (title.equalsIgnoreCase("Avengers: Endgame")) {
            poster = "images/avengers end game.jpg";
        }
        else if (title.equalsIgnoreCase("3 Idiots")) {
            poster = "images/3 idiots.jpg";
        }
        else if (title.equalsIgnoreCase("Interstellar")) {
            poster = "images/interstellar.jpg";
        }
        else if (title.equalsIgnoreCase("Dangal")) {
            poster = "images/Dangal.jpg";
        }
        else if (title.equalsIgnoreCase("F1")) {
            poster = "images/f1.jpg";
        }

%>


        <div class="movie-card">


            <img src="<%= poster %>"
                 class="poster"
                 alt="<%= title %>">


            <div class="movie-content">


                <h2 class="movie-title">
                    <%= title %>
                </h2>


                <div class="details">


                    <div class="detail">

                        <span class="label">
                            Genre
                        </span>

                        <span class="value">
                            <%= genre %>
                        </span>

                    </div>


                    <div class="detail">

                        <span class="label">
                            Language
                        </span>

                        <span class="value">
                            <%= language %>
                        </span>

                    </div>


                    <div class="detail">

                        <span class="label">
                            Duration
                        </span>

                        <span class="value">
                            <%= duration %> min
                        </span>

                    </div>


                    <div class="detail">

                        <span class="label">
                            Movie ID
                        </span>

                        <span class="value">
                            #<%= movieId %>
                        </span>

                    </div>


                </div>


                <div class="rating">

                    <span>
                        Rating
                    </span>

                    <span class="rating-value">
                        <%= rating %> / 10
                    </span>

                </div>


                <p class="description">

                    <%= description %>

                </p>


                <a href="MovieDetailsServlet?movie_id=<%= movieId %>"
                   class="btn">

                    View Details

                </a>


            </div>

        </div>


<%

    }

%>


    </div>

</div>


<footer>

    CineBook | Online Movie Ticket Booking System

</footer>


</body>
</html>