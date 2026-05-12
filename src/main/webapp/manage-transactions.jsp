<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Transactions</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin-dashboard">AutoMart Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="manage-transactions">Transactions</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin-dashboard">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2>Manage Transactions</h2>
        <div class="table-responsive bg-white p-3 shadow-sm rounded">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>Tx ID</th>
                        <th>Buyer ID</th>
                        <th>Car ID</th>
                        <th>Seller ID</th>
                        <th>Request Date</th>
                        <th>Status</th>
                        <th>Payment Method</th>
                        <th>Payment Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="tx" items="${transactions}">
                        <tr>
                            <td>${tx.transactionId}</td>
                            <td>${tx.buyerId}</td>
                            <td>${tx.carId}</td>
                            <td>${tx.sellerId}</td>
                            <td>${tx.requestDate}</td>
                            <td>
                                <span class="badge ${tx.transactionStatus == 'Completed' ? 'bg-success' : (tx.transactionStatus == 'Pending' ? 'bg-warning' : 'bg-secondary')}">${tx.transactionStatus}</span>
                            </td>
                            <td>${tx.paymentMethod}</td>
                            <td>
                                <span class="badge ${tx.paymentStatus == 'Paid' ? 'bg-success' : 'bg-warning'}">${tx.paymentStatus}</span>
                            </td>
                            <td>
                                <form action="manage-transactions" method="post" class="mb-1">
                                    <input type="hidden" name="transactionId" value="${tx.transactionId}">
                                    <input type="hidden" name="action" value="updateStatus">
                                    <div class="input-group input-group-sm">
                                        <select name="transactionStatus" class="form-select form-select-sm">
                                            <option value="Pending" ${tx.transactionStatus == 'Pending' ? 'selected' : ''}>Pending</option>
                                            <option value="Completed" ${tx.transactionStatus == 'Completed' ? 'selected' : ''}>Completed</option>
                                            <option value="Cancelled" ${tx.transactionStatus == 'Cancelled' ? 'selected' : ''}>Cancelled</option>
                                        </select>
                                        <button type="submit" class="btn btn-outline-primary">Update</button>
                                    </div>
                                </form>
                                <form action="manage-transactions" method="post">
                                    <input type="hidden" name="transactionId" value="${tx.transactionId}">
                                    <input type="hidden" name="action" value="updatePayment">
                                    <div class="input-group input-group-sm">
                                        <select name="paymentStatus" class="form-select form-select-sm">
                                            <option value="Unpaid" ${tx.paymentStatus == 'Unpaid' ? 'selected' : ''}>Unpaid</option>
                                            <option value="Paid" ${tx.paymentStatus == 'Paid' ? 'selected' : ''}>Paid</option>
                                            <option value="Refunded" ${tx.paymentStatus == 'Refunded' ? 'selected' : ''}>Refunded</option>
                                        </select>
                                        <button type="submit" class="btn btn-outline-secondary">Update</button>
                                    </div>
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
