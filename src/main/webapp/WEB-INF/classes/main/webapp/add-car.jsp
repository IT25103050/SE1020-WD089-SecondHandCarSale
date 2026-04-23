<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>WD089 - Add Car Listing</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            background: #f0f2f5;
            margin: 0;
            display: flex;
            flex-direction: column;
            min-height: 100vh;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        /* This wrapper ensures the card stays centered below the navbar */
        .main-content-wrapper {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            padding: 40px 20px;
        }

        .container-card {
            width: 100%;
            max-width: 550px;
            background: white;
            padding: 35px;
            border-radius: 12px;
            box-shadow: 0 8px 24px rgba(0,0,0,0.08);
        }

        h2 { color: #1e293b; font-weight: 700; margin-bottom: 25px; text-align: center; }
        .btn-post { background: #1d4ed8; color: white; border: none; padding: 12px; font-weight: bold; }
        .btn-post:hover { background: #1e40af; color: white; }
        input, select { margin-bottom: 10px !important; }
    </style>
</head>
<body>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="SearchServlet?brand=">
            🚗 AutoFleet <span class="text-white">Manager</span>
        </a>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="SearchServlet?brand=">Inventory</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link active" href="add-car.jsp">Add New Car</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content-wrapper">
    <div class="container-card">
        <h2>Add New Car Advertisement</h2>

        <form action="AddCarServlet" method="post" enctype="multipart/form-data">

            <div class="mb-3">
                <label class="form-label fw-bold small text-muted">CAR IMAGE</label>
                <input type="file" name="car_image" class="form-control" accept="image/*" required>
            </div>

            <div class="row g-2">
                <div class="col-md-6">
                    <input type="text" name="brand" class="form-control" placeholder="Brand" required>
                </div>
                <div class="col-md-6">
                    <input type="text" name="model" class="form-control" placeholder="Model" required>
                </div>
            </div>

            <input type="number" name="year" class="form-control" placeholder="Manufacture Year" required>
            <input type="number" name="price" class="form-control" placeholder="Price (LKR)" required>
            <input type="number" name="mileage" class="form-control" placeholder="Mileage (km)" required>

            <select name="fuel_type" class="form-select">
                <option value="Petrol">Petrol</option>
                <option value="Diesel">Diesel</option>
                <option value="Hybrid">Hybrid</option>
                <option value="Electric">Electric</option>
            </select>

            <button type="submit" class="btn btn-post w-100 rounded-3 mt-3">Post Listing</button>

            <div class="text-center mt-3">
                <a href="SearchServlet?brand=" class="text-decoration-none text-muted small">← Back to Search</a>
            </div>
        </form>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>