<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - AutoMart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">AutoMart</a>
        <div class="ms-auto">
            <a class="nav-link text-white d-inline" href="<%= request.getContextPath() %>/register">Register</a>
        </div>
    </div>
</nav>

<!-- Login Form -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-5">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h4 class="card-title mb-4">Login</h4>

                    <!-- Error Message -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <!-- Success Message (from registration redirect) -->
                    <% if (request.getParameter("success") != null) { %>
                        <div class="alert alert-success">
                            <%= request.getParameter("success") %>
                        </div>
                    <% } %>

                    <!-- Info Message (from deactivation redirect) -->
                    <% if (request.getParameter("info") != null) { %>
                        <div class="alert alert-warning">
                            <%= request.getParameter("info") %>
                        </div>
                    <% } %>

                    <form action="<%= request.getContextPath() %>/login" method="post">

                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email"
                                   placeholder="Enter your email" required>
                        </div>

                        <div class="mb-3">
                            <label for="password" class="form-label">Password</label>
                            <input type="password" class="form-control" id="password" name="password"
                                   placeholder="Enter your password" required>
                        </div>

                        <div class="d-grid">
                            <button type="submit" class="btn btn-primary" id="loginBtn">Login</button>
                        </div>

                    </form>

                    <hr>
                    <p class="text-center mb-0">
                        Don't have an account?
                        <a href="<%= request.getContextPath() %>/register">Register here</a>
                    </p>
                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
