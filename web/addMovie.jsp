<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>CineBook - Add Movie</title>

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


        /* NAVBAR */

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
            gap: 28px;
        }

        .nav-links a {
            color: #dddddd;
            text-decoration: none;
            font-size: 14px;
            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #e50914;
        }


        /* MAIN */

        .container {
            width: 90%;
            max-width: 850px;

            margin: auto;

            padding: 35px 0 60px;
        }


        /* BACK */

        .back-section {
            margin-bottom: 25px;
        }

        .back-btn {
            display: inline-block;

            background: #1b1b1b;

            border: 1px solid #3a3a3a;

            color: #ffffff;

            text-decoration: none;

            padding: 10px 19px;

            border-radius: 7px;

            font-size: 14px;

            transition: 0.3s;
        }

        .back-btn:hover {
            background: #e50914;
            border-color: #e50914;
        }


        /* HEADER */

        .page-header {
            margin-bottom: 30px;
        }

        .page-header h1 {
            font-size: 33px;
            margin-bottom: 9px;
        }

        .page-header h1 span {
            color: #e50914;
        }

        .page-header p {
            color: #888888;
            font-size: 14px;
        }


        /* FORM CARD */

        .form-card {
            background: #121212;

            border: 1px solid #292929;

            border-radius: 13px;

            padding: 30px;
        }


        /* FORM GRID */

        .form-grid {
            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full-width {
            grid-column: 1 / -1;
        }


        /* LABEL */

        .form-group label {
            color: #cccccc;

            font-size: 13px;

            margin-bottom: 8px;
        }


        /* INPUTS */

        .form-group input,
        .form-group select,
        .form-group textarea {

            width: 100%;

            background: #1b1b1b;

            border: 1px solid #333333;

            color: #ffffff;

            padding: 13px 14px;

            border-radius: 7px;

            outline: none;

            font-size: 14px;

            transition: 0.3s;
        }

        .form-group input:focus,
        .form-group select:focus,
        .form-group textarea:focus {

            border-color: #e50914;

            box-shadow:
                0 0 0 2px rgba(229, 9, 20, 0.12);
        }

        .form-group input::placeholder,
        .form-group textarea::placeholder {
            color: #666666;
        }

        .form-group textarea {
            min-height: 120px;

            resize: vertical;
        }


        /* SELECT */

        .form-group select {
            cursor: pointer;
        }

        .form-group select option {
            background: #1b1b1b;
            color: #ffffff;
        }


        /* BUTTON AREA */

        .button-area {

            display: flex;

            gap: 12px;

            margin-top: 28px;

            padding-top: 25px;

            border-top: 1px solid #292929;
        }


        /* SUBMIT BUTTON */

        .submit-btn {

            flex: 1;

            background: #e50914;

            border: none;

            color: #ffffff;

            padding: 13px;

            border-radius: 7px;

            font-size: 14px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.3s;
        }

        .submit-btn:hover {
            background: #b20710;
        }


        /* CANCEL BUTTON */

        .cancel-btn {

            flex: 1;

            text-align: center;

            background: #1b1b1b;

            border: 1px solid #3a3a3a;

            color: #ffffff;

            text-decoration: none;

            padding: 12px;

            border-radius: 7px;

            font-size: 14px;

            transition: 0.3s;
        }

        .cancel-btn:hover {
            background: #292929;
            border-color: #555555;
        }


        /* NOTE */

        .form-note {

            margin-top: 20px;

            padding: 13px 15px;

            background: #0d0d0d;

            border-left: 3px solid #e50914;

            color: #777777;

            font-size: 12px;

            line-height: 1.5;
        }


        /* FOOTER */

        footer {

            border-top: 1px solid #222222;

            background: #0d0d0d;

            text-align: center;

            padding: 22px;

            color: #666666;

            font-size: 13px;
        }


        /* MOBILE */

        @media (max-width: 700px) {

            .navbar {
                padding: 0 5%;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 12px;
            }

            .container {
                width: 92%;
            }

            .form-card {
                padding: 22px;
            }

            .form-grid {
                grid-template-columns: 1fr;
            }

            .full-width {
                grid-column: auto;
            }

            .page-header h1 {
                font-size: 28px;
            }

            .button-area {
                flex-direction: column;
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

            <a href="index.html">
                Home
            </a>

            <a href="MovieServlet">
                Movies
            </a>

            <a href="adminDashboard.jsp">
                Dashboard
            </a>

        </div>

    </div>


    <!-- MAIN -->

    <div class="container">


        <!-- BACK BUTTON -->

        <div class="back-section">

            <a
                href="javascript:history.back()"
                class="back-btn">

                Back

            </a>

        </div>


        <!-- HEADER -->

        <div class="page-header">

            <h1>
                Add <span>New Movie</span>
            </h1>

            <p>
                Add a movie to the CineBook catalogue.
            </p>

        </div>


        <!-- FORM -->

        <div class="form-card">

            <form
                action="AddMovieServlet"
                method="post">


                <div class="form-grid">


                    <!-- TITLE -->

                    <div class="form-group full-width">

                        <label for="title">
                            Movie Title
                        </label>

                        <input
                            type="text"
                            id="title"
                            name="title"
                            placeholder="Enter movie title"
                            required>

                    </div>


                    <!-- GENRE -->

                    <div class="form-group">

                        <label for="genre">
                            Genre
                        </label>

                        <input
                            type="text"
                            id="genre"
                            name="genre"
                            placeholder="Example: Action, Drama"
                            required>

                    </div>


                    <!-- LANGUAGE -->

                    <div class="form-group">

                        <label for="language">
                            Language
                        </label>

                        <input
                            type="text"
                            id="language"
                            name="language"
                            placeholder="Example: English"
                            required>

                    </div>


                    <!-- DURATION -->

                    <div class="form-group">

                        <label for="duration">
                            Duration (minutes)
                        </label>

                        <input
                            type="number"
                            id="duration"
                            name="duration"
                            placeholder="Example: 180"
                            min="1"
                            required>

                    </div>


                    <!-- RATING -->

                    <div class="form-group">

                        <label for="rating">
                            Rating
                        </label>

                        <input
                            type="number"
                            id="rating"
                            name="rating"
                            placeholder="Example: 8.5"
                            min="0"
                            max="10"
                            step="0.1"
                            required>

                    </div>


                    <!-- DESCRIPTION -->

                    <div class="form-group full-width">

                        <label for="description">
                            Movie Description
                        </label>

                        <textarea
                            id="description"
                            name="description"
                            placeholder="Enter a short description of the movie"
                            required></textarea>

                    </div>


                </div>


                <!-- BUTTONS -->

                <div class="button-area">


                    <a
                        href="adminDashboard.jsp"
                        class="cancel-btn">

                        Cancel

                    </a>


                    <button
                        type="submit"
                        class="submit-btn">

                        Add Movie

                    </button>


                </div>


                <!-- NOTE -->

                <div class="form-note">

                    After adding the movie, you can create its show timings
                    from the Add Show section.

                </div>


            </form>

        </div>

    </div>


    <!-- FOOTER -->

    <footer>

        CineBook - Online Movie Ticket Booking System

    </footer>


</body>
</html>