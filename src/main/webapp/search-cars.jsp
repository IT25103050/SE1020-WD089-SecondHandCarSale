<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ page import="java.util.List" %>
<!DOCTYPE html>
<html>
<head>
    <title>AutoMart - Vehicle Inventory</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', system-ui, sans-serif; }
        .navbar { background-color: #1e293b !important; }
        .sidebar-card { border: none; border-radius: 12px; box-shadow: 0 4px 12px rgba(0,0,0,0.05); }
        .car-card { border: none; border-radius: 12px; overflow: hidden; transition: all 0.3s ease; box-shadow: 0 4px 12px rgba(0,0,0,0.05); background: #ffffff; }
        .car-card:hover { transform: translateY(-5px); box-shadow: 0 8px 24px rgba(0,0,0,0.12); }
        .car-img { height: 210px; object-fit: cover; background-color: #e2e8f0; }
        .price-tag { color: #2563eb; font-weight: 700; font-size: 1.4rem; }
        .sell-btn-fixed { background-color: #2563eb !important; color: #ffffff !important; font-weight: 600 !important; padding: 10px 24px !important; border-radius: 50px !important; border: none !important; display: inline-block !important; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow-sm py-3">
    <div class="container">
        <a class="navbar-brand fw-bold fs-4" href="SearchServlet">
            <i class="fa-solid fa-car-side text-primary me-2"></i>AutoMart
        </a>
        <div class="navbar-nav ms-auto d-flex align-items-center">
            <a class="nav-link active me-3" href="SearchServlet"><i class="fa-solid fa-house me-1"></i> Browse Fleet</a>
            <a class="btn sell-btn-fixed" href="add-car.jsp">
                <i class="fa-solid fa-circle-plus me-1"></i> Sell a Car
            </a>
        </div>
    </div>
</nav>

<div class="container my-5">
    <div class="row g-4">

        <div class="col-lg-3">
            <div class="card p-4 sidebar-card bg-white">
                <h5 class="fw-bold text-dark mb-4"><i class="fa-solid fa-sliders me-2 text-primary"></i>Filter Options</h5>
                <form action="SearchServlet" method="GET">
                    <div class="mb-3">
                        <label class="form-label small text-muted fw-bold text-uppercase">Keywords</label>
                        <input type="text" name="brand" class="form-control bg-light" placeholder="e.g. Toyota..." value="${param.brand}">
                    </div>
                    <div class="mb-3">
                        <label class="form-label small text-muted fw-bold text-uppercase">Fuel Type</label>
                        <select name="fuel_type" class="form-select bg-light">
                            <option value="">All Fuel Types</option>
                            <option value="Petrol" ${param.fuel_type == 'Petrol' ? 'selected' : ''}>Petrol</option>
                            <option value="Diesel" ${param.fuel_type == 'Diesel' ? 'selected' : ''}>Diesel</option>
                        </select>
                    </div>
                    <div class="mb-4">
                        <label class="form-label small text-muted fw-bold text-uppercase">Price Range (LKR)</label>
                        <div class="row g-2">
                            <div class="col-6">
                                <input type="number" name="min_price" class="form-control bg-light" placeholder="Min" value="${param.min_price}">
                            </div>
                            <div class="col-6">
                                <input type="number" name="max_price" class="form-control bg-light" placeholder="Max" value="${param.max_price}">
                            </div>
                        </div>
                    </div>
                    <div class="d-grid gap-2">
                        <button type="submit" class="btn btn-primary rounded-3"><i class="fa-solid fa-filter me-2"></i>Apply Search</button>
                        <a href="SearchServlet" class="btn btn-outline-secondary rounded-3 text-center btn-sm">Clear Filters</a>
                    </div>
                </form>
            </div>
        </div>

        <div class="col-lg-9">
            <div class="mb-4">
                <h3 class="fw-bold text-dark m-0">Available Vehicles</h3>
                <p class="text-muted small m-0">Live text file directory status tree listings</p>
            </div>

            <div class="row g-4">
                <%
                    List<String[]> cars = (List<String[]>) request.getAttribute("carList");
                    if (cars != null && !cars.isEmpty()) {
                        for (String[] car : cars) {
                            if (car.length >= 6) {
                                String id = car[0];
                                String brand = car[2];
                                String model = car[3];
                                String year = car[4];
                                String price = String.format("%,d", Long.parseLong(car[5]));
                                String mileage = (car.length > 6) ? car[6] : "N/A";
                                String img = (car.length > 12) ? car[12] : "https://images.unsplash.com/photo-1503376780353-7e6692767b70?auto=format&fit=crop&w=600&q=80";
                %>
                <div class="col-md-6 col-xl-4">
                    <div class="card h-100 car-card">
                        <img src="<%= img %>" class="card-img-top car-img" alt="Vehicle Overview">
                        <div class="card-body d-flex flex-column p-4">
                            <span class="badge bg-light text-primary border border-primary-subtle mb-2 align-self-start font-monospace"><%= id %></span>
                            <h4 class="card-title fw-bold text-dark mb-1"><%= brand %> <%= model %></h4>
                            <p class="text-muted small mb-3"><i class="fa-solid fa-calendar me-1"></i><%= year %> &nbsp;|&nbsp; <i class="fa-solid fa-gauge me-1"></i><%= mileage %> km</p>

                            <div class="mt-auto">
                                <div class="price-tag mb-3">LKR <%= price %></div>
                                <div class="d-flex gap-2">
                                    <a href="edit-car.jsp?id=<%= id %>" class="btn btn-warning btn-sm w-100 rounded-3 text-dark fw-bold"><i class="fa-solid fa-pen-to-square me-1"></i>Edit</a>
                                    <a href="DeleteCarServlet?id=<%= id %>" onclick="return confirm('Are you sure you want to delete this vehicle listing? This action cannot be undone.');" class="btn btn-outline-danger btn-sm w-100 rounded-3"><i class="fa-solid fa-trash me-1"></i>Delete</a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                <%
                            }
                        }
                    } else {
                %>
                <div class="col-12 text-center py-5">
                    <div class="card p-5 border-0 shadow-sm rounded-3 bg-white">
                        <i class="fa-solid fa-car-on text-muted fa-3x mb-3"></i>
                        <h4 class="text-muted fw-bold">No Vehicles Found</h4>
                    </div>
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