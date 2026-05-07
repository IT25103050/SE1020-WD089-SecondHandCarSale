<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carplatform.model.SellerInventoryItem" %>
<%@ page import="java.util.List" %>
<%
    List<SellerInventoryItem> inventory = (List<SellerInventoryItem>) request.getAttribute("inventory");
    String sellerId = (String) request.getAttribute("sellerId");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller / Dealer Inventory - AutoMart</title>
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
        <h2>Seller / Dealer Inventory</h2>
        <p class="text-muted">Showing inventory for: <strong><%= sellerId %></strong></p>

        <% if (inventory != null && !inventory.isEmpty()) { %>
            <div class="table-responsive">
                <table class="table table-bordered table-striped mt-3">
                    <thead class="table-dark">
                        <tr>
                            <th>Car ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Year</th>
                            <th>Price (LKR)</th>
                            <th>Mileage</th>
                            <th>Fuel Type</th>
                            <th>Transmission</th>
                            <th>Location</th>
                            <th>Car Status</th>
                            <th>Approval Status</th>
                        </tr>
                    </thead>
                    <tbody>
                        <% for (SellerInventoryItem item : inventory) { %>
                            <tr>
                                <td><%= item.getCarId() %></td>
                                <td><%= item.getBrand() %></td>
                                <td><%= item.getModel() %></td>
                                <td><%= item.getYear() %></td>
                                <td><%= String.format("%,.0f", item.getPrice()) %></td>
                                <td><%= String.format("%,d", item.getMileage()) %> km</td>
                                <td><%= item.getFuelType() %></td>
                                <td><%= item.getTransmission() %></td>
                                <td><%= item.getLocation() %></td>
                                <td>
                                    <% if ("Available".equals(item.getCarStatus())) { %>
                                        <span class="badge bg-success">Available</span>
                                    <% } else if ("Sold".equals(item.getCarStatus())) { %>
                                        <span class="badge bg-secondary">Sold</span>
                                    <% } else { %>
                                        <span class="badge bg-warning text-dark">Pending</span>
                                    <% } %>
                                </td>
                                <td>
                                    <% if ("Approved".equals(item.getApprovalStatus())) { %>
                                        <span class="badge bg-success">Approved</span>
                                    <% } else if ("Pending".equals(item.getApprovalStatus())) { %>
                                        <span class="badge bg-warning text-dark">Pending</span>
                                    <% } else { %>
                                        <span class="badge bg-danger">Rejected</span>
                                    <% } %>
                                </td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            </div>
        <% } else { %>
            <div class="alert alert-info mt-3">No inventory items found.</div>
        <% } %>

        <div class="mt-3">
            <a href="seller-dashboard" class="btn btn-primary">Back to Dashboard</a>
        </div>
    </div>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
