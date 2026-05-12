<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Pending Car Approvals</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin-dashboard">AutoMart Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="pending-cars">Pending Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin-dashboard">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2>Pending Car Approvals</h2>
        <div class="table-responsive bg-white p-3 shadow-sm rounded">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Car ID</th>
                        <th>Seller ID</th>
                        <th>Brand/Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Location</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${pendingCars}">
                        <tr>
                            <td>${car.carId}</td>
                            <td>${car.sellerId}</td>
                            <td>${car.brand} ${car.model}</td>
                            <td>${car.year}</td>
                            <td>Rs. ${car.price}</td>
                            <td>${car.location}</td>
                            <td>
                                <form action="pending-cars" method="post" class="d-inline">
                                    <input type="hidden" name="carId" value="${car.carId}">
                                    <button type="submit" name="action" value="approve" class="btn btn-sm btn-success">Approve</button>
                                    <button type="submit" name="action" value="reject" class="btn btn-sm btn-danger">Reject</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                    <c:if test="${empty pendingCars}">
                        <tr><td colspan="7" class="text-center">No pending cars for approval.</td></tr>
                    </c:if>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
