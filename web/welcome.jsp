<%@ page contentType="text/html;charset=UTF-8" %>

<%
    String userName = (String) session.getAttribute("user_name");

    if (userName == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook | Welcome</title>


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
                    rgba(239, 35, 60, 0.12),
                    transparent 30%
                ),

                radial-gradient(
                    circle at 80% 80%,
                    rgba(239, 35, 60, 0.08),
                    transparent 32%
                ),

                #070b10;

            color: white;

            display: flex;

            align-items: center;

            justify-content: center;

            padding: 30px;
        }


        /* =========================================
           WELCOME CARD
        ========================================= */

        .welcome-card {

            width: 100%;

            max-width: 720px;

            background:

                linear-gradient(
                    145deg,
                    #171d24,
                    #0f141a
                );

            border: 1px solid #27313b;

            border-radius: 20px;

            padding: 30px 45px 45px;

            box-shadow:

                0 25px 65px
                rgba(0, 0, 0, 0.45);
        }


        /* =========================================
           BACK BUTTON
        ========================================= */

        .back-wrapper {

            width: 100%;

            text-align: left;

            margin-bottom: 30px;
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
           BRAND
        ========================================= */

        .brand {

            text-align: center;

            margin-bottom: 28px;
        }


        .brand h1 {

            font-size: 34px;

            letter-spacing: -1px;

            color: white;
        }


        .brand h1 span {

            color: #ef233c;
        }


        .brand-line {

            width: 55px;

            height: 3px;

            background: #ef233c;

            border-radius: 5px;

            margin: 12px auto 0;
        }


        /* =========================================
           WELCOME
        ========================================= */

        .welcome-title {

            text-align: center;

            font-size: 38px;

            color: white;

            margin-bottom: 12px;
        }


        .welcome-title span {

            color: #ef233c;
        }


        .welcome-message {

            text-align: center;

            color: #aeb8c4;

            font-size: 16px;

            line-height: 1.6;

            margin-bottom: 35px;
        }


        /* =========================================
           QUICK ACTIONS
        ========================================= */

        .actions {

            display: grid;

            grid-template-columns:
                repeat(2, 1fr);

            gap: 18px;
        }


        .action-card {

            min-height: 125px;

            padding: 24px;

            background: #11171e;

            border: 1px solid #28323c;

            border-radius: 12px;

            text-align: center;

            transition: all 0.3s ease;
        }


        .action-card:hover {

            border-color: #ef233c;

            transform: translateY(-4px);

            background: #151b22;

            box-shadow:

                0 12px 25px
                rgba(0, 0, 0, 0.25);
        }


        .action-card h2 {

            font-size: 19px;

            margin-bottom: 8px;

            color: white;
        }


        .action-card p {

            color: #7f8b97;

            font-size: 13px;

            line-height: 1.5;

            margin-bottom: 17px;
        }


        .action-button {

            display: inline-block;

            padding: 10px 18px;

            background: #ef233c;

            color: white;

            border-radius: 7px;

            text-decoration: none;

            font-size: 13px;

            font-weight: bold;

            transition: 0.25s;
        }


        .action-button:hover {

            background: #c9182e;

            transform: translateY(-2px);
        }


        /* =========================================
           LOGOUT
        ========================================= */

        .logout-section {

            margin-top: 28px;

            padding-top: 25px;

            border-top: 1px solid #252e37;

            text-align: center;
        }


        .logout-button {

            display: inline-block;

            padding: 12px 30px;

            background: #323a43;

            color: white;

            border-radius: 8px;

            text-decoration: none;

            font-size: 14px;

            font-weight: bold;

            transition: 0.25s;
        }


        .logout-button:hover {

            background: #ef233c;

            transform: translateY(-2px);
        }


        /* =========================================
           HOME
        ========================================= */

        .home-link {

            display: block;

            text-align: center;

            margin-top: 20px;

            color: #8f9aa6;

            text-decoration: none;

            font-size: 14px;

            transition: 0.25s;
        }


        .home-link:hover {

            color: white;
        }


        /* =========================================
           MOBILE
        ========================================= */

        @media (max-width: 650px) {

            body {

                padding: 20px;
            }


            .welcome-card {

                padding: 25px 20px 30px;
            }


            .welcome-title {

                font-size: 30px;
            }


            .actions {

                grid-template-columns: 1fr;
            }

        }

    </style>

</head>


<body>


    <!-- =========================================
         MAIN CARD
    ========================================= -->

    <div class="welcome-card">


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



        <!-- WELCOME MESSAGE -->

        <h2 class="welcome-title">

            Welcome,
            <span><%= userName %></span>!

        </h2>


        <p class="welcome-message">

            You have successfully logged in to CineBook.
            Choose an option below to continue.

        </p>



        <!-- =====================================
             ACTIONS
        ====================================== -->

        <div class="actions">


            <!-- BROWSE MOVIES -->

            <div class="action-card">

                <h2>
                    Browse Movies
                </h2>

                <p>
                    Explore available movies,
                    details and show timings.
                </p>

                <a href="MovieServlet"
                   class="action-button">

                    Browse Movies

                </a>

            </div>



            <!-- MY BOOKINGS -->

            <div class="action-card">

                <h2>
                    My Bookings
                </h2>

                <p>
                    View your previously booked
                    movie tickets.
                </p>

                <a href="MyBookingsServlet"
                   class="action-button">

                    My Bookings

                </a>

            </div>


        </div>



        <!-- =====================================
             LOGOUT
        ====================================== -->

        <div class="logout-section">

            <a href="LogoutServlet"
               class="logout-button">

                Logout

            </a>

        </div>



        <!-- HOME -->

        <a href="index.html"
           class="home-link">

            Back to CineBook

        </a>


    </div>


</body>

</html>