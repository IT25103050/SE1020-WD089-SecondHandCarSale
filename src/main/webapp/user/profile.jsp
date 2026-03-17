<%@ page import="com.wd089.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html>
<head>
    <title>User Profile</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f6f8;
            margin: 0;
            padding: 0;
        }

        .container {
            width: 500px;
            margin: 40px auto;
            background: #ffffff;
            padding: 25px;
            border-radius: 10px;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
        }

        h2 {
            text-align: center;
            margin-bottom: 10px;
        }

        .welcome {
            text-align: center;
            margin-bottom: 20px;
            color: #333;
        }

        .msg {
            color: green;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }

        .error {
            color: red;
            text-align: center;
            font-weight: bold;
            margin-bottom: 10px;
        }

        label {
            display: block;
            margin-top: 12px;
            font-weight: bold;
        }

        input {
            width: 100%;
            padding: 10px;
            margin-top: 6px;
            border: 1px solid #ccc;
            border-radius: 6px;
            box-sizing: border-box;
        }

        button, .btn-link {
            width: 100%;
            margin-top: 20px;
            padding: 12px;
            color: white;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            cursor: pointer;
            display: block;
            text-align: center;
            text-decoration: none;
            box-sizing: border-box;
        }

        .update-btn {
            background-color: #007bff;
        }

        .delete-btn {
            background-color: #dc3545;
        }

        .list-btn {
            background-color: #343a40;
        }

        .logout-btn {
            background-color: #6c757d;
        }

        .back-link {
            display: block;
            text-align: center;
            margin-top: 15px;
            text-decoration: none;
            color: #007bff;
        }
    </style>
</head>
<body>
<div class="container">
    <h2>User Profile</h2>
    <p class="welcome">Welcome, <strong><%= loggedUser.getFirstName() %></strong></p>

    <%
        if ("1".equals(request.getParameter("updated"))) {
    %>
    <div class="msg">Profile updated successfully.</div>
    <%
        }

        String error = (String) request.getAttribute("error");
        if (error != null) {
    %>
    <div class="error"><%= error %></div>
    <%
        }
    %>

    <form action="${pageContext.request.contextPath}/user" method="post">
        <input type="hidden" name="action" value="update">
        <input type="hidden" name="id" value="<%= loggedUser.getId() %>">

        <label>User Code</label>
        <input type="text" name="userCode" value="<%= loggedUser.getUserCode() %>" required>

        <label>First Name</label>
        <input type="text" name="firstName" value="<%= loggedUser.getFirstName() %>" required>

        <label>Last Name</label>
        <input type="text" name="lastName" value="<%= loggedUser.getLastName() %>" required>

        <label>Username</label>
        <input type="text" name="username" value="<%= loggedUser.getUsername() %>" required>

        <label>Email</label>
        <input type="email" name="email" value="<%= loggedUser.getEmail() %>" required>

        <label>Phone</label>
        <input type="text" name="phone" value="<%= loggedUser.getPhone() %>" required>

        <label>Password</label>
        <input type="text" name="password" value="<%= loggedUser.getPassword() %>" required>

        <label>Role</label>
        <input type="text" name="role" value="<%= loggedUser.getRole() %>" required>

        <label>Status</label>
        <input type="text" name="status" value="<%= loggedUser.getStatus() %>" readonly>

        <label>Access Type</label>
        <input type="text" value="<%= loggedUser.getAccessType() %>" readonly>

        <button type="submit" class="update-btn">Update Profile</button>
    </form>

    <form action="${pageContext.request.contextPath}/user" method="post">
        <input type="hidden" name="action" value="delete">
        <input type="hidden" name="id" value="<%= loggedUser.getId() %>">
        <button type="submit" class="delete-btn" onclick="return confirm('Are you sure you want to delete this account?');">
            Delete Account
        </button>
    </form>

    <a class="btn-link list-btn" href="${pageContext.request.contextPath}/user?action=list">View All Users</a>
    <a class="btn-link logout-btn" href="${pageContext.request.contextPath}/user?action=logout">Logout</a>
    <a class="back-link" href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
</div>
</body>
</html>