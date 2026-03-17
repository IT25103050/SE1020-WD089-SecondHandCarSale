<%@ page import="java.util.List" %>
<%@ page import="com.wd089.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>All Users</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 20px;
        }

        .container {
            width: 95%;
            margin: auto;
            background: #ffffff;
            padding: 20px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-box {
            text-align: center;
            margin-bottom: 20px;
        }

        .search-box input {
            width: 300px;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 6px;
        }

        .search-box button {
            padding: 10px 16px;
            border: none;
            background-color: #007bff;
            color: white;
            border-radius: 6px;
            cursor: pointer;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin-top: 15px;
        }

        th, td {
            border: 1px solid #ccc;
            padding: 10px;
            text-align: center;
        }

        th {
            background-color: #007bff;
            color: white;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>All Registered Users</h2>

    <div class="search-box">
        <form action="${pageContext.request.contextPath}/user" method="get">
            <input type="hidden" name="action" value="search">
            <input type="text" name="keyword" placeholder="Search by code, name, username, email or role"
                   value="<%= request.getAttribute("keyword") != null ? request.getAttribute("keyword") : "" %>">
            <button type="submit">Search</button>
        </form>
    </div>

    <table>
        <tr>
            <th>ID</th>
            <th>User Code</th>
            <th>First Name</th>
            <th>Last Name</th>
            <th>Username</th>
            <th>Email</th>
            <th>Phone</th>
            <th>Role</th>
            <th>Status</th>
        </tr>

        <%
            List<User> users = (List<User>) request.getAttribute("users");
            if (users != null && !users.isEmpty()) {
                for (User user : users) {
        %>
        <tr>
            <td><%= user.getId() %></td>
            <td><%= user.getUserCode() %></td>
            <td><%= user.getFirstName() %></td>
            <td><%= user.getLastName() %></td>
            <td><%= user.getUsername() %></td>
            <td><%= user.getEmail() %></td>
            <td><%= user.getPhone() %></td>
            <td><%= user.getDisplayRole() %></td>
            <td><%= user.getStatus() %></td>
        </tr>
        <%
            }
        } else {
        %>
        <tr>
            <td colspan="9">No users found.</td>
        </tr>
        <%
            }
        %>
    </table>

    <a class="back-link" href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
</div>
</body>
</html>