<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="main.java.DBConnection" %>

<!DOCTYPE html>
<html>
<head>
    <title>Edit Car Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="SearchServlet?brand=">
            🚗 AutoFleet <span class="text-white">Manager</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="SearchServlet?brand=">Inventory</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-car.jsp">Add New Car</a>
                </li>
            </ul>
        </div>
    </div>
</nav>
<div class="container my-5">
    <div class="card shadow p-4 mx-auto" style="max-width: 600px;">
        <h2 class="mb-4">Update Listing</h2>

        <%
            String id = request.getParameter("id");
            try (Connection conn = DBConnection.getConnection()) {
                String sql = "SELECT * FROM cars WHERE car_id = ?";
                PreparedStatement ps = conn.prepareStatement(sql);
                ps.setInt(1, Integer.parseInt(id));
                ResultSet rs = ps.executeQuery();
                if (rs.next()) {
        %>

        <form action="UpdateCarServlet" method="POST" enctype="multipart/form-data">
            <input type="hidden" name="car_id" value="<%= rs.getInt("car_id") %>">

            <div class="mb-3">
                <label class="form-label">Brand & Model</label>
                <div class="input-group">
                    <input type="text" name="brand" class="form-control" value="<%= rs.getString("brand") %>">
                    <input type="text" name="model" class="form-control" value="<%= rs.getString("model") %>">
                </div>
            </div>

            <div class="mb-3">
                <label class="form-label fw-bold">Update Car Photo (Leave blank to keep current)</label>
                <input type="file" name="car_image" class="form-control" accept="image/*">
                <div class="form-text">Current photo: <%= rs.getString("image_url") %></div>
            </div>

            <div class="mb-3">
                <label class="form-label">Price (LKR)</label>
                <input type="number" name="price" class="form-control" value="<%= rs.getDouble("price") %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Mileage (km)</label>
                <input type="number" name="mileage" class="form-control" value="<%= rs.getInt("mileage") %>">
            </div>

            <div class="mb-3">
                <label class="form-label">Status</label>
                <select name="status" class="form-select">
                    <option value="Available" <%= rs.getString("listing_status").equals("Available") ? "selected" : "" %>>Available</option>
                    <option value="Sold" <%= rs.getString("listing_status").equals("Sold") ? "selected" : "" %>>Sold</option>
                </select>
            </div>

            <button type="submit" class="btn btn-success w-100">Save Changes</button>
            <a href="SearchServlet?brand=" class="btn btn-link w-100 mt-2">Cancel</a>
        </form>

        <%
                }
            } catch (Exception e) { e.printStackTrace(); }
        %>
    </div>
</div>
</body>
</html>