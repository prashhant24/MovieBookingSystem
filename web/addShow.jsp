<%@ page import="java.sql.*" %>
<%@ page import="util.DBConnection" %>

<%
    Connection con = null;
    PreparedStatement ps = null;
    ResultSet rs = null;

    try {
        con = DBConnection.getConnection();

        ps = con.prepareStatement(
            "SELECT movie_id, title FROM movies ORDER BY title"
        );

        rs = ps.executeQuery();

    } catch (Exception e) {
        e.printStackTrace();
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>CineBook - Add Show</title>

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
        }

        .nav-links a:hover {
            color: #e50914;
        }

        .container {
            width: 90%;
            max-width: 850px;
            margin: auto;
            padding: 35px 0 60px;
        }

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

        .form-card {
            background: #121212;
            border: 1px solid #292929;
            border-radius: 13px;
            padding: 30px;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .form-group {
            display: flex;
            flex-direction: column;
        }

        .full-width {
            grid-column: 1 / -1;
        }

        label {
            color: #cccccc;
            font-size: 13px;
            margin-bottom: 8px;
        }

        input,
        select {
            width: 100%;
            background: #1b1b1b;
            border: 1px solid #333333;
            color: #ffffff;
            padding: 13px 14px;
            border-radius: 7px;
            outline: none;
            font-size: 14px;
        }

        input:focus,
        select:focus {
            border-color: #e50914;
            box-shadow: 0 0 0 2px rgba(229, 9, 20, 0.12);
        }

        select option {
            background: #1b1b1b;
            color: #ffffff;
        }

        .button-area {
            display: flex;
            gap: 12px;
            margin-top: 28px;
            padding-top: 25px;
            border-top: 1px solid #292929;
        }

        .submit-btn,
        .cancel-btn {
            flex: 1;
            padding: 13px;
            border-radius: 7px;
            font-size: 14px;
            font-weight: bold;
            text-align: center;
            text-decoration: none;
            cursor: pointer;
        }

        .submit-btn {
            background: #e50914;
            border: none;
            color: #ffffff;
        }

        .submit-btn:hover {
            background: #b20710;
        }

        .cancel-btn {
            background: #1b1b1b;
            border: 1px solid #3a3a3a;
            color: #ffffff;
        }

        .cancel-btn:hover {
            background: #292929;
        }

        .note {
            margin-top: 20px;
            padding: 13px 15px;
            background: #0d0d0d;
            border-left: 3px solid #e50914;
            color: #777777;
            font-size: 12px;
            line-height: 1.5;
        }

        footer {
            border-top: 1px solid #222222;
            background: #0d0d0d;
            text-align: center;
            padding: 22px;
            color: #666666;
            font-size: 13px;
        }

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

            .button-area {
                flex-direction: column;
            }
        }

    </style>

</head>

<body>


<div class="navbar">

    <div class="logo">
        CineBook
    </div>

    <div class="nav-links">
        <a href="index.html">Home</a>
        <a href="MovieServlet">Movies</a>
        <a href="adminDashboard.jsp">Dashboard</a>
    </div>

</div>


<div class="container">


    <div class="back-section">

        <a href="javascript:history.back()" class="back-btn">
            Back
        </a>

    </div>


    <div class="page-header">

        <h1>
            Add <span>New Show</span>
        </h1>

        <p>
            Create a movie show with date, timing, screen and ticket price.
        </p>

    </div>


    <div class="form-card">

        <form action="AddShowServlet" method="post">


            <div class="form-grid">


                <div class="form-group full-width">

                    <label for="movie_id">
                        Select Movie
                    </label>

                    <select
                        name="movie_id"
                        id="movie_id"
                        required>

                        <option value="">
                            Select a movie
                        </option>

                        <%
                            if (rs != null) {

                                while (rs.next()) {
                        %>

                        <option value="<%= rs.getInt("movie_id") %>">

                            <%= rs.getString("title") %>

                        </option>

                        <%
                                }
                            }
                        %>

                    </select>

                </div>


                <div class="form-group">

                    <label for="show_date">
                        Show Date
                    </label>

                    <input
                        type="date"
                        name="show_date"
                        id="show_date"
                        required>

                </div>


                <div class="form-group">

                    <label for="show_time">
                        Show Time
                    </label>

                    <input
                        type="text"
                        name="show_time"
                        id="show_time"
                        placeholder="Example: 7:00 PM"
                        required>

                </div>


                <div class="form-group">

                    <label for="screen">
                        Screen
                    </label>

                    <input
                        type="text"
                        name="screen"
                        id="screen"
                        placeholder="Example: Screen 1"
                        required>

                </div>


                <div class="form-group">

                    <label for="ticket_price">
                        Ticket Price
                    </label>

                    <input
                        type="number"
                        name="ticket_price"
                        id="ticket_price"
                        placeholder="Example: 250"
                        min="1"
                        step="0.01"
                        required>

                </div>


            </div>


            <div class="button-area">

                <a
                    href="adminDashboard.jsp"
                    class="cancel-btn">

                    Cancel

                </a>

                <button
                    type="submit"
                    class="submit-btn">

                    Add Show

                </button>

            </div>


            <div class="note">

                Each newly created show will automatically receive
                20 seats from A1 to D5.

            </div>


        </form>

    </div>

</div>


<footer>

    CineBook - Online Movie Ticket Booking System

</footer>


</body>
</html>

<%
    try {
        if (rs != null) rs.close();
        if (ps != null) ps.close();
        if (con != null) con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }
%>