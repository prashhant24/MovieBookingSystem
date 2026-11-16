<%@ page contentType="text/html;charset=UTF-8" %>

<!DOCTYPE html>

<html lang="en">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title>CineBook | Create Account</title>


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
           REGISTER CARD
        ========================================= */

        .register-card {

            width: 100%;

            max-width: 560px;

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

            margin-bottom: 20px;

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
           BRAND
        ========================================= */

        .brand {

            text-align: center;

            margin-bottom: 10px;
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

            margin: 11px auto 20px;
        }


        /* =========================================
           TITLE
        ========================================= */

        .register-title {

            text-align: center;

            font-size: 24px;

            margin-bottom: 8px;

            color: #f5f7fa;
        }


        .register-subtitle {

            text-align: center;

            color: #8f9aa6;

            font-size: 14px;

            line-height: 1.5;

            margin-bottom: 27px;
        }


        /* =========================================
           FORM
        ========================================= */

        .form-group {

            margin-bottom: 17px;
        }


        .form-group label {

            display: block;

            margin-bottom: 7px;

            color: #e3e8ed;

            font-size: 14px;

            font-weight: 600;
        }


        .form-group input {

            width: 100%;

            height: 47px;

            padding: 0 14px;

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
           TWO COLUMN ROW
        ========================================= */

        .form-row {

            display: grid;

            grid-template-columns: 1fr 1fr;

            gap: 18px;
        }


        /* =========================================
           REGISTER BUTTON
        ========================================= */

        .register-button {

            width: 100%;

            height: 50px;

            margin-top: 7px;

            border: none;

            border-radius: 8px;

            background: #ef233c;

            color: white;

            font-size: 16px;

            font-weight: bold;

            cursor: pointer;

            transition: all 0.3s ease;
        }


        .register-button:hover {

            background: #c9182e;

            transform: translateY(-2px);

            box-shadow:

                0 10px 25px
                rgba(239, 35, 60, 0.25);
        }


        /* =========================================
           LOGIN LINK
        ========================================= */

        .login-section {

            text-align: center;

            margin-top: 24px;

            padding-top: 20px;

            border-top: 1px solid #242d36;

            color: #929da8;

            font-size: 14px;
        }


        .login-section a {

            color: #ef233c;

            text-decoration: none;

            font-weight: bold;

            margin-left: 5px;
        }


        .login-section a:hover {

            text-decoration: underline;
        }


        /* =========================================
           HOME LINK
        ========================================= */

        .home-link {

            display: block;

            text-align: center;

            margin-top: 16px;

            color: #8d98a4;

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

        @media (max-width: 600px) {

            body {

                padding: 20px;
            }


            .register-card {

                padding: 25px 22px 32px;

                border-radius: 15px;
            }


            .brand h1 {

                font-size: 32px;
            }


            .register-title {

                font-size: 22px;
            }


            .form-row {

                grid-template-columns: 1fr;

                gap: 0;
            }

        }

    </style>

</head>


<body>


    <!-- =========================================
         REGISTER CARD
    ========================================= -->

    <div class="register-card">


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

        <h2 class="register-title">

            Create Your Account

        </h2>


        <p class="register-subtitle">

            Register with CineBook and start booking
            your favourite movies.

        </p>



        <!-- =====================================
             REGISTRATION FORM
        ====================================== -->

        <form action="RegisterServlet"
              method="post">


            <!-- NAME -->

            <div class="form-group">

                <label for="name">

                    Full Name

                </label>


                <input

                    type="text"

                    id="name"

                    name="name"

                    placeholder="Enter your full name"

                    required

                    autocomplete="name"

                >

            </div>



            <!-- EMAIL + MOBILE -->

            <div class="form-row">


                <div class="form-group">

                    <label for="email">

                        Email

                    </label>


                    <input

                        type="email"

                        id="email"

                        name="email"

                        placeholder="Enter email"

                        required

                        autocomplete="email"

                    >

                </div>



                <div class="form-group">

                    <label for="mobile">

                        Mobile

                    </label>


                    <input

                        type="tel"

                        id="mobile"

                        name="mobile"

                        placeholder="Enter mobile"

                        maxlength="15"

                        autocomplete="tel"

                    >

                </div>


            </div>



            <!-- USERNAME -->

            <div class="form-group">

                <label for="username">

                    Username

                </label>


                <input

                    type="text"

                    id="username"

                    name="username"

                    placeholder="Choose a username"

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

                    placeholder="Create a password"

                    required

                    autocomplete="new-password"

                >

            </div>



            <!-- REGISTER BUTTON -->

            <button

                type="submit"

                class="register-button">

                Create Account

            </button>


        </form>



        <!-- LOGIN -->

        <div class="login-section">

            Already have an account?

            <a href="login.jsp">

                Login

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