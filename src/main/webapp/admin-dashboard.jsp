<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html>
<head>
    <title>Admin Dashboard</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin-dashboard">AutoMart Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link" href="manage-users">Manage Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="manage-cars">Manage Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="pending-cars">Pending Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="pending-dealers">Pending Dealers</a></li>
                    <li class="nav-item"><a class="nav-link" href="manage-transactions">Transactions</a></li>
                    <li class="nav-item"><a class="nav-link" href="manage-reviews">Reviews</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container mt-4">
        <h2>Admin Dashboard</h2>
        <div class="row mt-4">
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Users</h5>
                        <p class="card-text fs-4">${stats.totalUsers}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Buyers</h5>
                        <p class="card-text fs-4">${stats.totalBuyers}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Sellers</h5>
                        <p class="card-text fs-4">${stats.totalSellers}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Dealers</h5>
                        <p class="card-text fs-4">${stats.totalDealers}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm border-primary">
                    <div class="card-body">
                        <h5 class="card-title">Total Cars</h5>
                        <p class="card-text fs-4">${stats.totalCars}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm border-warning">
                    <div class="card-body">
                        <h5 class="card-title">Pending Cars</h5>
                        <p class="card-text fs-4">${stats.pendingCars}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm border-success">
                    <div class="card-body">
                        <h5 class="card-title">Approved Cars</h5>
                        <p class="card-text fs-4">${stats.approvedCars}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm border-secondary">
                    <div class="card-body">
                        <h5 class="card-title">Sold Cars</h5>
                        <p class="card-text fs-4">${stats.soldCars}</p>
                    </div>
                </div>
            </div>
        </div>

        <div class="row">
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Available Cars</h5>
                        <p class="card-text fs-4">${stats.availableCars}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm border-warning">
                    <div class="card-body">
                        <h5 class="card-title">Pending Transactions</h5>
                        <p class="card-text fs-4">${stats.pendingTransactions}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm border-success">
                    <div class="card-body">
                        <h5 class="card-title">Completed Transactions</h5>
                        <p class="card-text fs-4">${stats.completedTransactions}</p>
                    </div>
                </div>
            </div>
            <div class="col-md-3 mb-3">
                <div class="card text-center shadow-sm">
                    <div class="card-body">
                        <h5 class="card-title">Total Reviews</h5>
                        <p class="card-text fs-4">${stats.totalReviews}</p>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
