<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>AutoMart - Sell Your Car</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css" rel="stylesheet">
    <style>
        body { background-color: #f4f6f9; font-family: 'Segoe UI', system-ui, sans-serif; }
        .navbar { background-color: #1e293b !important; }
        .form-card { border: none; border-radius: 16px; box-shadow: 0 4px 24px rgba(0,0,0,0.06); }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark shadow-sm py-3">
    <div class="container">
        <a class="navbar-brand fw-bold fs-4" href="SearchServlet"><i class="fa-solid fa-car-side text-primary me-2"></i>AutoMart</a>
        <div class="navbar-nav ms-auto"><a class="nav-link active" href="SearchServlet">Back to Fleet</a></div>
    </div>
</nav>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8 col-lg-6">
            <div class="card p-5 form-card bg-white">
                <h3 class="fw-bold mb-4 text-center">Submit Vehicle Details</h3>

                <form action="AddCarServlet" method="POST" enctype="multipart/form-data">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">BRAND</label>
                            <input type="text" name="brand" class="form-control bg-light" placeholder="e.g. Toyota" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">MODEL</label>
                            <input type="text" name="model" class="form-control bg-light" placeholder="e.g. Corolla" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">YEAR</label>
                            <input type="number" name="year" class="form-control bg-light" placeholder="2019" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">MILEAGE (KM)</label>
                            <input type="number" name="mileage" class="form-control bg-light" placeholder="30000" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">FUEL TYPE</label>
                            <select name="fuel_type" class="form-select bg-light">
                                <option value="Petrol">Petrol</option>
                                <option value="Diesel">Diesel</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-muted">PRICE (LKR)</label>
                            <input type="number" name="price" class="form-control bg-light" placeholder="9500000" required>
                        </div>

                        <div class="col-12">
                            <label class="form-label small fw-bold text-muted">UPLOAD IMAGE FROM THIS DEVICE</label>
                            <input type="file" name="car_image" class="form-control bg-light" accept="image/*" required>
                        </div>
                    </div>
                    <button type="submit" class="btn btn-primary w-100 mt-4 py-2 fw-bold">Publish Listing</button>
                </form>
            </div>
        </div>
    </div>
</div>
</body>
</html>