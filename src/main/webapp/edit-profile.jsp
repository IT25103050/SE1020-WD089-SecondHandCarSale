<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carplatform.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Profile - AutoMart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">AutoMart</a>
        <div class="ms-auto">
            <a class="nav-link text-white d-inline me-3" href="<%= request.getContextPath() %>/dashboard">Dashboard</a>
            <form action="<%= request.getContextPath() %>/logout" method="post" class="d-inline">
                <button type="submit" class="btn btn-outline-light btn-sm">Logout</button>
            </form>
        </div>
    </div>
</nav>

<!-- Edit Profile Form -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-6">
            <div class="card shadow-sm">
                <div class="card-body p-4">
                    <h4 class="card-title mb-4">Edit Profile</h4>

                    <!-- Error Message -->
                    <% if (request.getAttribute("error") != null) { %>
                        <div class="alert alert-danger">
                            <%= request.getAttribute("error") %>
                        </div>
                    <% } %>

                    <%
                        User user = (User) request.getAttribute("user");
                        if (user != null) {
                    %>

                    <form action="<%= request.getContextPath() %>/edit-profile" method="post">

                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" name="fullName"
                                   value="<%= user.getFullName() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="email" class="form-label">Email Address</label>
                            <input type="email" class="form-control" id="email" name="email"
                                   value="<%= user.getEmail() %>" readonly>
                            <div class="form-text text-muted">Email cannot be changed.</div>
                        </div>

                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone Number</label>
                            <input type="text" class="form-control" id="phone" name="phone"
                                   value="<%= user.getPhone() %>" required>
                        </div>

                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address"
                                   value="<%= user.getAddress() %>" required>
                        </div>

                        <div class="d-flex gap-2">
                            <button type="submit" class="btn btn-primary" id="saveProfileBtn">Save Changes</button>
                            <a href="<%= request.getContextPath() %>/user-profile" class="btn btn-secondary" id="cancelEditBtn">Cancel</a>
                        </div>

                    </form>

                    <% } else { %>
                        <div class="alert alert-warning">User not found.</div>
                        <a href="<%= request.getContextPath() %>/user-profile" class="btn btn-secondary">Back to Profile</a>
                    <% } %>

                </div>
            </div>
        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
