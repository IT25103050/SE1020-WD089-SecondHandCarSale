<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Cars</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin-dashboard">AutoMart Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="manage-cars">Manage Cars</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin-dashboard">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2>Manage Cars</h2>
        <div class="table-responsive bg-white p-3 shadow-sm rounded">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Car ID</th>
                        <th>Seller ID</th>
                        <th>Brand/Model</th>
                        <th>Year</th>
                        <th>Price</th>
                        <th>Car Status</th>
                        <th>Approval Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="car" items="${cars}">
                        <tr>
                            <td>${car.carId}</td>
                            <td>${car.sellerId}</td>
                            <td>${car.brand} ${car.model}</td>
                            <td>${car.year}</td>
                            <td>Rs. ${car.price}</td>
                            <td>
                                <span class="badge ${car.carStatus == 'Available' ? 'bg-success' : 'bg-secondary'}">${car.carStatus}</span>
                            </td>
                            <td>
                                <span class="badge ${car.approvalStatus == 'Approved' ? 'bg-success' : (car.approvalStatus == 'Pending' ? 'bg-warning' : 'bg-danger')}">${car.approvalStatus}</span>
                            </td>
                            <td>
                                <form action="manage-cars" method="post" class="d-inline">
                                    <input type="hidden" name="carId" value="${car.carId}">
                                    <c:if test="${car.approvalStatus == 'Pending'}">
                                        <button type="submit" name="action" value="approve" class="btn btn-sm btn-success">Approve</button>
                                        <button type="submit" name="action" value="reject" class="btn btn-sm btn-danger">Reject</button>
                                    </c:if>
                                    <c:if test="${car.carStatus == 'Available'}">
                                        <button type="submit" name="action" value="markSold" class="btn btn-sm btn-secondary">Mark Sold</button>
                                    </c:if>
                                    <button type="submit" name="action" value="delete" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this car?');">Delete</button>
                                </form>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </div>
</body>
</html>
