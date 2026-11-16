<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">

    <title>CineBook - Admin Login</title>

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

            display: flex;
            flex-direction: column;
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
            gap: 30px;
        }

        .nav-links a {
            color: #dddddd;

            text-decoration: none;

            font-size: 15px;

            transition: 0.3s;
        }

        .nav-links a:hover {
            color: #e50914;
        }


        /* MAIN */

        .main {
            flex: 1;

            display: flex;

            align-items: center;
            justify-content: center;

            padding: 50px 20px;
        }


        /* LOGIN CARD */

        .login-card {
            width: 100%;
            max-width: 430px;

            background: #121212;

            border: 1px solid #292929;

            border-radius: 14px;

            padding: 35px;

            box-shadow:
                0 15px 45px rgba(0, 0, 0, 0.5);
        }


        /* BACK BUTTON */

        .back-section {
            margin-bottom: 25px;
        }

        .back-btn {
            display: inline-block;

            background: #1b1b1b;

            border: 1px solid #3a3a3a;

            color: #ffffff;

            text-decoration: none;

            padding: 10px 18px;

            border-radius: 7px;

            font-size: 14px;

            transition: 0.3s;
        }

        .back-btn:hover {
            background: #e50914;

            border-color: #e50914;
        }


        /* HEADER */

        .login-header {
            text-align: center;

            margin-bottom: 30px;
        }

        .login-header h1 {
            font-size: 29px;

            margin-bottom: 10px;
        }

        .login-header h1 span {
            color: #e50914;
        }

        .login-header p {
            color: #888888;

            font-size: 14px;

            line-height: 1.5;
        }


        /* FORM */

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            display: block;

            color: #cccccc;

            font-size: 14px;

            margin-bottom: 8px;
        }

        .form-group input {
            width: 100%;

            padding: 13px 14px;

            background: #1b1b1b;

            border: 1px solid #333333;

            border-radius: 7px;

            color: #ffffff;

            font-size: 14px;

            outline: none;

            transition: 0.3s;
        }

        .form-group input:focus {
            border-color: #e50914;

            box-shadow:
                0 0 0 2px rgba(229, 9, 20, 0.12);
        }

        .form-group input::placeholder {
            color: #666666;
        }


        /* LOGIN BUTTON */

        .login-btn {
            width: 100%;

            padding: 13px;

            background: #e50914;

            border: none;

            border-radius: 7px;

            color: #ffffff;

            font-size: 15px;

            font-weight: bold;

            cursor: pointer;

            transition: 0.3s;

            margin-top: 5px;
        }

        .login-btn:hover {
            background: #b20710;
        }


        /* LINKS */

        .bottom-links {
            text-align: center;

            margin-top: 25px;

            padding-top: 20px;

            border-top: 1px solid #292929;
        }

        .bottom-links a {
            color: #999999;

            text-decoration: none;

            font-size: 13px;

            margin: 0 8px;

            transition: 0.3s;
        }

        .bottom-links a:hover {
            color: #e50914;
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

        @media (max-width: 600px) {

            .navbar {
                padding: 0 5%;
            }

            .nav-links {
                gap: 12px;
            }

            .nav-links a {
                font-size: 13px;
            }

            .login-card {
                padding: 28px 22px;
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

            <a href="login.jsp">
                User Login
            </a>

        </div>

    </div>


    <!-- MAIN -->

    <div class="main">


        <div class="login-card">


            <!-- BACK BUTTON -->

            <div class="back-section">

                <a
                    href="javascript:history.back()"
                    class="back-btn">

                    Back

                </a>

            </div>


            <!-- HEADER -->

            <div class="login-header">

                <h1>
                    <span>Admin</span> Login
                </h1>

                <p>
                    Sign in to manage movies, shows, bookings and users.
                </p>

            </div>


            <!-- LOGIN FORM -->

            <form
                action="AdminLoginServlet"
                method="post">


                <div class="form-group">

                    <label for="username">
                        Username
                    </label>

                    <input
                        type="text"
                        id="username"
                        name="username"
                        placeholder="Enter admin username"
                        required>

                </div>


                <div class="form-group">

                    <label for="password">
                        Password
                    </label>

                    <input
                        type="password"
                        id="password"
                        name="password"
                        placeholder="Enter admin password"
                        required>

                </div>


                <button
                    type="submit"
                    class="login-btn">

                    Login to Admin Panel

                </button>


            </form>


            <!-- LINKS -->

            <div class="bottom-links">

                <a href="index.html">
                    Home
                </a>

                <a href="login.jsp">
                    User Login
                </a>

            </div>


        </div>

    </div>


    <!-- FOOTER -->

    <footer>

        CineBook - Online Movie Ticket Booking System

    </footer>


</body>
</html>