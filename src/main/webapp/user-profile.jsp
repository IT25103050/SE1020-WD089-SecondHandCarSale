<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carplatform.model.User" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Profile - AutoMart</title>
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

<!-- Profile Content -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-8">

            <h4 class="mb-4">My Profile</h4>

            <!-- Error Message -->
            <% if (request.getAttribute("error") != null) { %>
                <div class="alert alert-danger">
                    <%= request.getAttribute("error") %>
                </div>
            <% } %>

            <!-- Success Message -->
            <% if (request.getParameter("success") != null) { %>
                <div class="alert alert-success">
                    <%= request.getParameter("success") %>
                </div>
            <% } %>

            <%
                User user = (User) request.getAttribute("user");
                if (user != null) {
            %>

            <div class="card shadow-sm">
                <div class="card-body">
                    <table class="table table-bordered table-striped mb-4">
                        <tbody>
                            <tr>
                                <th style="width: 35%">User ID</th>
                                <td><%= user.getUserId() %></td>
                            </tr>
                            <tr>
                                <th>Full Name</th>
                                <td><%= user.getFullName() %></td>
                            </tr>
                            <tr>
                                <th>Email</th>
                                <td><%= user.getEmail() %></td>
                            </tr>
                            <tr>
                                <th>Phone</th>
                                <td><%= user.getPhone() %></td>
                            </tr>
                            <tr>
                                <th>Address</th>
                                <td><%= user.getAddress() %></td>
                            </tr>
                            <tr>
                                <th>Role</th>
                                <td><%= user.getRole() %></td>
                            </tr>
                            <tr>
                                <th>Account Status</th>
                                <td>
                                    <% if ("Active".equalsIgnoreCase(user.getAccountStatus())) { %>
                                        <span class="badge bg-success">Active</span>
                                    <% } else { %>
                                        <span class="badge bg-danger">Inactive</span>
                                    <% } %>
                                </td>
                            </tr>
                            <tr>
                                <th>Approval Status</th>
                                <td>
                                    <% if ("Approved".equalsIgnoreCase(user.getApprovalStatus())) { %>
                                        <span class="badge bg-success">Approved</span>
                                    <% } else if ("Pending".equalsIgnoreCase(user.getApprovalStatus())) { %>
                                        <span class="badge bg-warning text-dark">Pending</span>
                                    <% } else { %>
                                        <span class="badge bg-danger"><%= user.getApprovalStatus() %></span>
                                    <% } %>
                                </td>
                            </tr>
                            <tr>
                                <th>Member Since</th>
                                <td><%= user.getCreatedAt() %></td>
                            </tr>
                        </tbody>
                    </table>

                    <!-- Action Buttons -->
                    <a href="<%= request.getContextPath() %>/edit-profile" class="btn btn-primary me-2" id="editProfileBtn">Edit Profile</a>
                    <a href="<%= request.getContextPath() %>/dashboard" class="btn btn-secondary me-2" id="dashboardBtn">Dashboard</a>

                    <!-- Deactivate Account Button -->
                    <form action="<%= request.getContextPath() %>/deactivate-account" method="post" class="d-inline"
                          onsubmit="return confirm('Are you sure you want to deactivate your account? You will be logged out.');">
                        <button type="submit" class="btn btn-danger" id="deactivateBtn">Deactivate Account</button>
                    </form>
                </div>
            </div>

            <% } else { %>
                <div class="alert alert-warning">No user profile found.</div>
            <% } %>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
