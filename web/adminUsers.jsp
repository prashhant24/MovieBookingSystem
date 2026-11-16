<%@ page import="java.sql.ResultSet" %>

<%
    ResultSet users =
            (ResultSet) request.getAttribute("users");

    boolean hasUsers = false;

    String adminUsername =
            (String) session.getAttribute("admin_username");

    if (adminUsername == null) {
        response.sendRedirect("adminLogin.jsp");
        return;
    }
%>

<!DOCTYPE html>
<html>
<head>

    <meta charset="UTF-8">
    <title>CineBook - Registered Users</title>

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
            width: 92%;
            max-width: 1200px;
            margin: auto;
            padding: 35px 0 60px;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            gap: 20px;
            margin-bottom: 30px;
        }

        .heading h1 {
            font-size: 33px;
            margin-bottom: 9px;
        }

        .heading h1 span {
            color: #e50914;
        }

        .heading p {
            color: #888888;
            font-size: 14px;
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
        }

        .back-btn:hover {
            background: #e50914;
            border-color: #e50914;
        }

        .table-card {
            background: #121212;
            border: 1px solid #292929;
            border-radius: 12px;
            overflow-x: auto;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 750px;
        }

        th {
            background: #1b1b1b;
            color: #e50914;
            text-align: left;
            padding: 15px;
            font-size: 12px;
            text-transform: uppercase;
        }

        td {
            padding: 15px;
            border-top: 1px solid #292929;
            color: #dddddd;
            font-size: 13px;
        }

        tr:hover td {
            background: #171717;
        }

        .user-id {
            color: #e50914;
            font-weight: bold;
        }

        .username {
            color: #ffffff;
            font-weight: bold;
        }

        .no-users {
            background: #121212;
            border: 1px solid #292929;
            border-radius: 12px;
            text-align: center;
            padding: 50px 20px;
        }

        .no-users h2 {
            margin-bottom: 10px;
        }

        .no-users p {
            color: #777777;
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
                width: 94%;
            }

            .top-section {
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
        <a href="adminDashboard.jsp">Dashboard</a>
        <a href="AdminLogoutServlet">Logout</a>
    </div>

</div>


<div class="container">


    <div class="top-section">

        <div class="heading">

            <h1>
                Registered <span>Users</span>
            </h1>

            <p>
                View users registered in the CineBook system.
            </p>

        </div>

        <a
            href="javascript:history.back()"
            class="back-btn">

            Back

        </a>

    </div>


    <%
        if (users != null) {
    %>

    <div class="table-card">

        <table>

            <thead>

                <tr>

                    <th>User ID</th>
                    <th>Name</th>
                    <th>Email</th>
                    <th>Mobile</th>
                    <th>Username</th>

                </tr>

            </thead>

            <tbody>

            <%
                while (users.next()) {

                    hasUsers = true;

                    int userId =
                            users.getInt("user_id");

                    String name =
                            users.getString("name");

                    String email =
                            users.getString("email");

                    String mobile =
                            users.getString("mobile");

                    String username =
                            users.getString("username");
            %>

                <tr>

                    <td class="user-id">
                        #<%= userId %>
                    </td>

                    <td>
                        <%= name %>
                    </td>

                    <td>
                        <%= email %>
                    </td>

                    <td>
                        <%= mobile %>
                    </td>

                    <td class="username">
                        <%= username %>
                    </td>

                </tr>

            <%
                }
            %>

            </tbody>

        </table>

    </div>

    <%
        }

        if (!hasUsers) {
    %>

    <div class="no-users">

        <h2>
            No Users Found
        </h2>

        <p>
            There are currently no registered users.
        </p>

    </div>

    <%
        }
    %>

</div>


<footer>
    CineBook - Online Movie Ticket Booking System
</footer>


</body>
</html>