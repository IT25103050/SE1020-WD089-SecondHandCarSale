<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Seller Dashboard - AutoMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body class="bg-light">
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-navy sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">AutoMart</a>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item"><a class="nav-link active" href="dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">My Listings</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Add Car</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Requests</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><span class="nav-link text-white">Hello, <%= session.getAttribute("fullName") %></span></li>
                    <li class="nav-item"><a class="btn btn-outline-light ms-2 p-1 px-3" href="logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h2 class="fw-bold mb-0">Seller Dashboard</h2>
            <a href="#" class="btn btn-primary"><i class="bi bi-plus-lg"></i> Add New Car</a>
        </div>

        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="card bg-primary text-white border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title mb-1 opacity-75">My Cars</h6>
                                <h4 class="mb-0">Listings</h4>
                            </div>
                            <div class="fs-1 opacity-50"><i class="bi bi-car-front"></i></div>
                        </div>
                        <a href="#" class="text-white text-decoration-none stretched-link mt-3 d-block small">Manage inventory <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-warning text-dark border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title mb-1 opacity-75">Interactions</h6>
                                <h4 class="mb-0">Requests</h4>
                            </div>
                            <div class="fs-1 opacity-50"><i class="bi bi-envelope"></i></div>
                        </div>
                        <a href="#" class="text-dark text-decoration-none stretched-link mt-3 d-block small">View buy requests <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
