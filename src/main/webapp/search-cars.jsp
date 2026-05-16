<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.List" %>

<!DOCTYPE html>
<html>
<head>
    <title>AutoMart - Vehicle Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        .filter-sidebar { background-color: #ffffff; border-right: 1px solid #dee2e6; min-height: 100vh; }
        .car-card { transition: transform 0.2s; border: none; box-shadow: 0 4px 6px rgba(0,0,0,0.05); }
        .car-card:hover { transform: translateY(-5px); }
    </style>
</head>
<body class="bg-light">

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="#">🚗 AutoMart Dashboard</a>
        <div class="navbar-nav ms-auto">
            <a class="nav-link active" href="SearchServlet">Browse Inventory</a>
            <a class="nav-link" href="add-car.jsp">Sell a Car</a>
        </div>
    </div>
</nav>

<div class="container-fluid">
    <div class="row">
        <div class="col-md-3 p-4 filter-sidebar">
            <h4 class="mb-4 fw-bold">Filter Listings</h4>
            <form action="SearchServlet" method="GET">
                <div class="mb-3">
                    <label class="form-label fw-bold">Search Brand / Model</label>
                    <input type="text" name="brand" class="form-control" placeholder="e.g., Toyota, Honda">
                </div>

                <div class="mb-3">
                    <label class="form-label fw-bold">Fuel Type</label>
                    <select name="fuel_type" class="form-select">
                        <option value="">All Fuel Types</option>
                        <option value="Petrol">Petrol</option>
                        <option value="Diesel">Diesel</option>
                        <option value="Hybrid">Hybrid</option>
                        <option value="Electric">Electric</option>
                    </select>
                </div>

                <button type="submit" class="btn btn-primary w-100 mt-2">Apply Filters</button>
            </form>
        </div>

        <div class="col-md-9 p-4">
            <div class="d-flex justify-content-between align-items-center mb-4">
                <h2 class="fw-bold">Available Vehicles</h2>
                <span class="badge bg-secondary px-3 py-2">Sri Lanka Market</span>
            </div>

            <div class="row row-cols-1 row-cols-md-3 g-4">
                <%
                    List<String[]> carList = (List<String[]>) request.getAttribute("carList");
                    if (carList != null && !carList.isEmpty()) {
                        for (String[] car : carList) {

                            // Dynamically determine the image source.
                            // If index 10 has data, we use it. Otherwise, use a pristine Unsplash fallback car image.
                            String carImage = "https://images.unsplash.com/photo-1542282088-fe8426682b8f?q=80&w=600&auto=format&fit=crop";
                            if (car.length > 10 && car[10] != null && !car[10].trim().isEmpty()) {
                                carImage = car[10].trim();
                            }
                %>
                <div class="col">
                    <div class="card h-100 car-card">
                        <img src="<%= carImage %>" class="card-img-top" alt="Car Image" style="height: 200px; object-fit: cover;">
                        <div class="card-body">
                            <h5 class="card-title fw-bold"><%= car[2] %> <%= car[3] %></h5>
                            <p class="text-muted mb-1">Year: <%= car[4] %> | <%= car[7] %></p>
                            <p class="text-muted small">Mileage: <%= car[6] %> km</p>
                            <h4 class="text-primary fw-bold">LKR <%= String.format("%,.0f", Double.parseDouble(car[5])) %></h4>
                        </div>
                        <div class="card-footer bg-white d-flex gap-2 border-0 pb-3">
                            <a href="edit-car.jsp?id=<%= car[0] %>" class="btn btn-outline-warning btn-sm flex-grow-1">Edit</a>
                            <a href="DeleteCarServlet?id=<%= car[0] %>" class="btn btn-outline-danger btn-sm flex-grow-1" onclick="return confirm('Are you sure you want to delete this listing?');">Delete</a>
                        </div>
                    </div>
                </div>
                <%
                        }
                    } else {
                %>
                <div class="col-12">
                    <div class="alert alert-info text-center">No vehicles found matching those criteria. Click "Apply Filters" to load all entries.</div>
                </div>
                <%
                    }
                %>
            </div>
        </div>
    </div>
</div>

</body>
</html>