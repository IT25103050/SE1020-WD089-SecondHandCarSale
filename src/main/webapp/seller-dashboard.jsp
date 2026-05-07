<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carplatform.model.Seller" %>
<%
    Seller seller = (Seller) request.getAttribute("seller");
    Integer totalListings = (Integer) request.getAttribute("totalListings");
    Integer availableListings = (Integer) request.getAttribute("availableListings");
    Integer soldListings = (Integer) request.getAttribute("soldListings");
    Integer pendingListings = (Integer) request.getAttribute("pendingListings");

    String sellerName = (seller != null) ? seller.getFullName() : "Unknown Seller";
    String dashboardTitle = (seller != null) ? seller.getDashboardTitle() : "Seller Dashboard";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard - AutoMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa;">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">AutoMart</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="seller-profile">My Profile</a>
                <a class="nav-link" href="seller-inventory">My Inventory</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <h2><%= dashboardTitle %></h2>
        <p class="text-muted">Welcome, <strong><%= sellerName %></strong></p>

        <!-- Inventory Count Cards -->
        <div class="row mt-4">
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Total Listings</h5>
                        <h2 class="text-primary"><%= (totalListings != null) ? totalListings : 0 %></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Available</h5>
                        <h2 class="text-success"><%= (availableListings != null) ? availableListings : 0 %></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Sold</h5>
                        <h2 class="text-secondary"><%= (soldListings != null) ? soldListings : 0 %></h2>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card">
                    <div class="card-body text-center">
                        <h5 class="card-title">Pending</h5>
                        <h2 class="text-warning"><%= (pendingListings != null) ? pendingListings : 0 %></h2>
                    </div>
                </div>
            </div>
        </div>

        <!-- Action Buttons -->
        <div class="mt-3">
            <a href="seller-profile" class="btn btn-primary me-2">View Profile</a>
            <a href="edit-seller-profile" class="btn btn-primary me-2">Edit Profile</a>
            <a href="seller-inventory" class="btn btn-primary">View Inventory</a>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
