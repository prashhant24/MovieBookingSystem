<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook | Login</title>


    <style>

        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;

            font-family: Arial, Helvetica, sans-serif;
        }


        /* =========================================
           PAGE
        ========================================= */

        body {

            min-height: 100vh;

            background:

                radial-gradient(
                    circle at 20% 20%,
                    rgba(239, 35, 60, 0.10),
                    transparent 30%
                ),

                radial-gradient(
                    circle at 80% 80%,
                    rgba(239, 35, 60, 0.08),
                    transparent 30%
                ),

                #070b10;

            color: white;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 30px;
        }


        /* =========================================
           LOGIN CARD
        ========================================= */

        .login-card {

            width: 100%;

            max-width: 500px;

            background:

                linear-gradient(
                    145deg,
                    #171d24,
                    #0f141a
                );

            border: 1px solid #27313b;

            border-radius: 18px;

            padding: 30px 42px 40px;

            box-shadow:

                0 25px 60px
                rgba(0, 0, 0, 0.45);
        }


        /* =========================================
           BACK BUTTON
        ========================================= */

        .back-wrapper {

            width: 100%;

            margin-bottom: 25px;

            text-align: left;
        }


        .back-button {

            display: inline-flex;

            align-items: center;

            justify-content: center;

            min-width: 85px;

            height: 40px;

            padding: 0 18px;

            background: #161d25;

            color: #d8dee5;

            border: 1px solid #3b4652;

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

                0 7px 20px
                rgba(239, 35, 60, 0.20);
        }


        /* =========================================
           LOGO
        ========================================= */

        .brand {

            text-align: center;

            margin-bottom: 12px;
        }


        .brand h1 {

            font-size: 38px;

            color: white;

            letter-spacing: -1px;
        }


        .brand h1 span {

            color: #ef233c;
        }


        .brand-line {

            width: 55px;

            height: 3px;

            background: #ef233c;

            border-radius: 5px;

            margin: 12px auto 22px;
        }


        /* =========================================
           TITLE
        ========================================= */

        .login-title {

            text-align: center;

            font-size: 24px;

            margin-bottom: 8px;

            color: #f5f7fa;
        }


        .login-subtitle {

            text-align: center;

            color: #8f9aa6;

            font-size: 14px;

            margin-bottom: 30px;
        }


        /* =========================================
           FORM
        ========================================= */

        .form-group {

            margin-bottom: 20px;
        }


        .form-group label {

            display: block;

            margin-bottom: 8px;

            color: #e3e8ed;

            font-size: 14px;

            font-weight: 600;
        }


        .form-group input {

            width: 100%;

            height: 50px;

            padding: 0 15px;

            border-radius: 8px;

            border: 1px solid #35404b;

            background: #0b1015;

            color: white;

            font-size: 15px;

            outline: none;

            transition: 0.25s;
        }


        .form-group input::placeholder {

            color: #687582;
        }


        .form-group input:focus {

            border-color: #ef233c;

            box-shadow:

                0 0 0 3px
                rgba(239, 35, 60, 0.10);
        }


        /* =========================================
           LOGIN BUTTON
        ========================================= */

        .login-button {

            width: 100%;

            height: 50px;

            margin-top: 5px;

            border: none;

            border-radius: 8px;

            background: #ef233c;

            color: white;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            transition: all 0.3s ease;
        }


        .login-button:hover {

            background: #c9182e;

            transform: translateY(-2px);

            box-shadow:

                0 10px 25px
                rgba(239, 35, 60, 0.25);
        }


        /* =========================================
           REGISTER LINK
        ========================================= */

        .register-section {

            text-align: center;

            margin-top: 27px;

            padding-top: 22px;

            border-top: 1px solid #242d36;

            color: #929da8;

            font-size: 14px;
        }


        .register-section a {

            color: #ef233c;

            text-decoration: none;

            font-weight: bold;

            margin-left: 5px;
        }


        .register-section a:hover {

            text-decoration: underline;
        }


        /* =========================================
           HOME LINK
        ========================================= */

        .home-link {

            display: block;

            text-align: center;

            margin-top: 18px;

            color: #9da8b3;

            text-decoration: none;

            font-size: 14px;

            transition: 0.25s;
        }


        .home-link:hover {

            color: white;
        }


        /* =========================================
           ADMIN LINK
        ========================================= */

        .admin-link {

            display: block;

            text-align: center;

            margin-top: 12px;

            color: #727e8a;

            text-decoration: none;

            font-size: 13px;

            transition: 0.25s;
        }


        .admin-link:hover {

            color: #ef233c;
        }


        /* =========================================
           MOBILE
        ========================================= */

        @media (max-width: 600px) {

            body {

                padding: 20px;
            }


            .login-card {

                padding: 25px 22px 32px;

                border-radius: 15px;
            }


            .brand h1 {

                font-size: 32px;
            }


            .login-title {

                font-size: 22px;
            }

        }

    </style>

</head>


<body>


    <!-- =========================================
         LOGIN CARD
    ========================================= -->

    <div class="login-card">


        <!-- BACK BUTTON -->

        <div class="back-wrapper">

            <a href="javascript:history.back()"
               class="back-button">

                Back

            </a>

        </div>



        <!-- BRAND -->

        <div class="brand">

            <h1>
                Cine<span>Book</span>
            </h1>

            <div class="brand-line"></div>

        </div>



        <!-- TITLE -->

        <h2 class="login-title">

            Login to Your Account

        </h2>


        <p class="login-subtitle">

            Sign in to continue booking your movie tickets.

        </p>



        <!-- =====================================
             LOGIN FORM
        ====================================== -->

        <form action="LoginServlet"
              method="post">


            <!-- USERNAME -->

            <div class="form-group">

                <label for="username">

                    Username

                </label>


                <input

                    type="text"

                    id="username"

                    name="username"

                    placeholder="Enter username"

                    required

                    autocomplete="username"

                >

            </div>



            <!-- PASSWORD -->

            <div class="form-group">

                <label for="password">

                    Password

                </label>


                <input

                    type="password"

                    id="password"

                    name="password"

                    placeholder="Enter password"

                    required

                    autocomplete="current-password"

                >

            </div>



            <!-- LOGIN -->

            <button

                type="submit"

                class="login-button">

                Login

            </button>


        </form>



        <!-- REGISTER -->

        <div class="register-section">

            New user?

            <a href="register.jsp">

                Create an account

            </a>

        </div>



        <!-- HOME -->

        <a href="index.html"
           class="home-link">

            Back to CineBook

        </a>



        <!-- ADMIN -->

        <a href="adminLogin.jsp"
           class="admin-link">

            Admin Login

        </a>


    </div>


</body>

</html>