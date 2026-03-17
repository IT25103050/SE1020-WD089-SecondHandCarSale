<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Second Hand Car Sale - User Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 80px auto;
            background: #ffffff;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 0 12px rgba(0,0,0,0.1);
            text-align: center;
        }

        h1 {
            margin-bottom: 10px;
            color: #333;
        }

        p {
            color: #666;
            margin-bottom: 30px;
        }

        .msg {
            margin-bottom: 15px;
            font-weight: bold;
            color: green;
        }

        .btn {
            display: block;
            width: 100%;
            padding: 14px;
            margin: 12px 0;
            background-color: #007bff;
            color: white;
            text-decoration: none;
            border-radius: 6px;
            font-size: 16px;
            box-sizing: border-box;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .btn-secondary {
            background-color: #28a745;
        }

        .btn-secondary:hover {
            background-color: #1e7e34;
        }

        .btn-dark {
            background-color: #343a40;
        }

        .btn-dark:hover {
            background-color: #1f2327;
        }
    </style>
</head>
<body>
<div class="container">
    <h1>User Management Module</h1>
    <p>Second Hand Car Sale and Purchase Platform</p>

    <%
        String deleted = request.getParameter("deleted");
        if ("1".equals(deleted)) {
    %>
    <div class="msg">User account deleted successfully.</div>
    <%
        }
    %>

    <a class="btn" href="${pageContext.request.contextPath}/user/register.jsp">Register New User</a>
    <a class="btn btn-secondary" href="${pageContext.request.contextPath}/user/login.jsp">User Login</a>
    <a class="btn btn-dark" href="${pageContext.request.contextPath}/user?action=list">View All Users</a>
</div>
</body>
</html>