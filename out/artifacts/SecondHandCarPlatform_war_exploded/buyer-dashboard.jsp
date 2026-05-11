<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buyer Dashboard - AutoMart</title>
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
                    <li class="nav-item"><a class="nav-link" href="index.jsp">Home</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">Find Cars</a></li>
                    <li class="nav-item"><a class="nav-link active" href="dashboard">Dashboard</a></li>
                    <li class="nav-item"><a class="nav-link" href="#">My Purchases</a></li>
                </ul>
                <ul class="navbar-nav">
                    <li class="nav-item"><span class="nav-link text-white">Hello, <%= session.getAttribute("fullName") %></span></li>
                    <li class="nav-item"><a class="btn btn-outline-light ms-2 p-1 px-3" href="logout">Logout</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container my-5">
        <h2 class="fw-bold mb-4">Buyer Dashboard</h2>

        <div class="row g-4 mb-4">
            <div class="col-md-3">
                <div class="card bg-primary text-white border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title mb-1 opacity-75">Quick Action</h6>
                                <h4 class="mb-0">Find Cars</h4>
                            </div>
                            <div class="fs-1 opacity-50"><i class="bi bi-search"></i></div>
                        </div>
                        <a href="#" class="text-white text-decoration-none stretched-link mt-3 d-block small">Browse latest arrivals <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-success text-white border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title mb-1 opacity-75">Purchases</h6>
                                <h4 class="mb-0">My Requests</h4>
                            </div>
                            <div class="fs-1 opacity-50"><i class="bi bi-bag-check"></i></div>
                        </div>
                        <a href="#" class="text-white text-decoration-none stretched-link mt-3 d-block small">View history <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
            <div class="col-md-3">
                <div class="card bg-info text-white border-0 shadow-sm h-100">
                    <div class="card-body">
                        <div class="d-flex justify-content-between align-items-center">
                            <div>
                                <h6 class="card-title mb-1 opacity-75">Payments</h6>
                                <h4 class="mb-0">Pending</h4>
                            </div>
                            <div class="fs-1 opacity-50"><i class="bi bi-credit-card"></i></div>
                        </div>
                        <a href="#" class="text-white text-decoration-none stretched-link mt-3 d-block small">Complete payments <i class="bi bi-arrow-right"></i></a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card border-0 shadow-sm">
            <div class="card-body p-4 text-center py-5">
                <i class="bi bi-car-front fs-1 text-muted mb-3 d-block"></i>
                <h5>Ready to find your next car?</h5>
                <p class="text-muted">Browse our vast collection of verified second-hand cars.</p>
                <a href="#" class="btn btn-primary">Start Browsing</a>
            </div>
        </div>
    </div>
</body>
</html>
