<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carplatform.model.Seller" %>
<%
    Seller seller = (Seller) request.getAttribute("seller");
    String error = (String) request.getAttribute("error");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Seller Profile - AutoMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa;">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">AutoMart</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="seller-dashboard">Dashboard</a>
                <a class="nav-link" href="seller-profile">My Profile</a>
            </div>
        </div>
    </nav>
    <div class="container mt-4">
        <h2>Edit Seller Profile</h2>
        <% if (error != null) { %>
            <div class="alert alert-danger mt-3"><%= error %></div>
        <% } %>
        <% if (seller != null) { %>
            <div class="card mt-3">
                <div class="card-body">
                    <form action="edit-seller-profile" method="post">
                        <div class="mb-3">
                            <label for="fullName" class="form-label">Full Name</label>
                            <input type="text" class="form-control" id="fullName" value="<%= seller.getFullName() %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="email" class="form-label">Email</label>
                            <input type="email" class="form-control" id="email" value="<%= seller.getEmail() %>" readonly>
                        </div>
                        <div class="mb-3">
                            <label for="phone" class="form-label">Phone</label>
                            <input type="text" class="form-control" id="phone" name="phone" value="<%= seller.getPhone() %>" required>
                            <div class="form-text">Must start with 0 and be 10 digits (e.g., 0771234567)</div>
                        </div>
                        <div class="mb-3">
                            <label for="address" class="form-label">Address</label>
                            <input type="text" class="form-control" id="address" name="address" value="<%= seller.getAddress() %>" required>
                        </div>
                        <button type="submit" class="btn btn-primary">Save Changes</button>
                        <a href="seller-profile" class="btn btn-secondary ms-2">Cancel</a>
                    </form>
                </div>
            </div>
        <% } else { %>
            <div class="alert alert-warning mt-3">Seller profile not found.</div>
        <% } %>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
