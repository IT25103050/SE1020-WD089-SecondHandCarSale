<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="com.carplatform.model.Seller" %>
<%@ page import="com.carplatform.model.SellerInventoryItem" %>
<%@ page import="java.util.List" %>
<%
    Seller seller = (Seller) request.getAttribute("seller");
    List<SellerInventoryItem> inventory = (List<SellerInventoryItem>) request.getAttribute("inventory");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Profile - AutoMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body style="background-color: #f8f9fa;">

    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container">
            <a class="navbar-brand" href="#">AutoMart</a>
            <div class="navbar-nav ms-auto">
                <a class="nav-link" href="seller-dashboard">Dashboard</a>
                <a class="nav-link" href="seller-inventory">My Inventory</a>
            </div>
        </div>
    </nav>

    <!-- Main Content -->
    <div class="container mt-4">
        <h2>Seller Profile</h2>

        <% if (seller != null) { %>
            <!-- Profile Summary (Polymorphism demo) -->
            <p class="text-muted"><%= seller.displayProfileSummary() %></p>

            <!-- Seller Details Card -->
            <div class="card mt-3">
                <div class="card-header">
                    <strong><%= seller.getProfileType() %> Details</strong>
                </div>
                <div class="card-body">
                    <table class="table table-bordered">
                        <tr>
                            <th style="width: 200px;">Seller ID</th>
                            <td><%= seller.getSellerId() %></td>
                        </tr>
                        <tr>
                            <th>Full Name</th>
                            <td><%= seller.getFullName() %></td>
                        </tr>
                        <tr>
                            <th>Email</th>
                            <td><%= seller.getEmail() %></td>
                        </tr>
                        <tr>
                            <th>Phone</th>
                            <td><%= seller.getPhone() %></td>
                        </tr>
                        <tr>
                            <th>Address</th>
                            <td><%= seller.getAddress() %></td>
                        </tr>
                        <tr>
                            <th>Role</th>
                            <td><%= seller.getRole() %></td>
                        </tr>
                        <tr>
                            <th>Account Status</th>
                            <td>
                                <% if ("Active".equals(seller.getAccountStatus())) { %>
                                    <span class="badge bg-success">Active</span>
                                <% } else { %>
                                    <span class="badge bg-secondary">Inactive</span>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <th>Approval Status</th>
                            <td>
                                <% if ("Approved".equals(seller.getApprovalStatus())) { %>
                                    <span class="badge bg-success">Approved</span>
                                <% } else if ("Pending".equals(seller.getApprovalStatus())) { %>
                                    <span class="badge bg-warning text-dark">Pending</span>
                                <% } else { %>
                                    <span class="badge bg-danger">Rejected</span>
                                <% } %>
                            </td>
                        </tr>
                        <tr>
                            <th>Member Since</th>
                            <td><%= seller.getCreatedAt() %></td>
                        </tr>
                    </table>
                </div>
            </div>

            <!-- Action Buttons -->
            <div class="mt-3">
                <a href="edit-seller-profile" class="btn btn-primary me-2">Edit Profile</a>
                <a href="seller-inventory" class="btn btn-primary me-2">View Inventory</a>
                <form action="deactivate-seller" method="post" style="display:inline;"
                      onsubmit="return confirm('Are you sure you want to deactivate your account?');">
                    <input type="hidden" name="sellerId" value="<%= seller.getSellerId() %>">
                    <button type="submit" class="btn btn-danger">Deactivate Account</button>
                </form>
            </div>

            <!-- Inventory Table -->
            <h4 class="mt-4">Available Inventory</h4>
            <% if (inventory != null && !inventory.isEmpty()) { %>
                <table class="table table-bordered table-striped mt-2">
                    <thead class="table-dark">
                        <tr>
                            <th>Car ID</th>
                            <th>Brand</th>
                            <th>Model</th>
                            <th>Year</th>
                            <th>Price (LKR)</th>
                            <th>Mileage</th>
                            <th>Status</th>
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
                                <td><span class="badge bg-success">Available</span></td>
                            </tr>
                        <% } %>
                    </tbody>
                </table>
            <% } else { %>
                <p class="text-muted mt-2">No available inventory items.</p>
            <% } %>

        <% } else { %>
            <div class="alert alert-warning mt-3">Seller profile not found.</div>
        <% } %>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
