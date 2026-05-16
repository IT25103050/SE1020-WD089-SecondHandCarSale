<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dealer Dashboard - AutoMart</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css">
</head>
<body class="bg-light">

<!-- Navbar -->
<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
    <div class="container">
        <a class="navbar-brand fw-bold" href="#">AutoMart</a>
        <div class="ms-auto">
            <a class="nav-link text-white d-inline me-3" href="<%= request.getContextPath() %>/user-profile">My Profile</a>
            <form action="<%= request.getContextPath() %>/logout" method="post" class="d-inline">
                <button type="submit" class="btn btn-outline-light btn-sm">Logout</button>
            </form>
        </div>
    </div>
</nav>

<!-- Dashboard Content -->
<div class="container mt-5">
    <div class="row justify-content-center">
        <div class="col-md-7">

            <h4 class="mb-2">Dealer Dashboard</h4>
            <p class="text-muted mb-4">
                Welcome, <strong><%= session.getAttribute("fullName") != null ? session.getAttribute("fullName") : "Dealer" %></strong>!
            </p>

            <%-- Show approval status notice if available --%>
            <%
                com.carplatform.dao.UserDAO daoCheck = new com.carplatform.dao.UserDAO(
                    application.getRealPath("/WEB-INF/data/users.txt")
                );
                String dealerUserId = (String) session.getAttribute("userId");
                com.carplatform.model.User dealerUser = (dealerUserId != null) ? daoCheck.getUserById(dealerUserId) : null;
                if (dealerUser != null && "Pending".equalsIgnoreCase(dealerUser.getApprovalStatus())) {
            %>
                <div class="alert alert-warning" id="pendingApprovalNotice">
                    Your dealer account is <strong>pending admin approval</strong>. Some features may be restricted.
                </div>
            <% } else if (dealerUser != null && "Approved".equalsIgnoreCase(dealerUser.getApprovalStatus())) { %>
                <div class="alert alert-success" id="approvedNotice">
                    Your dealer account is <strong>approved</strong>.
                </div>
            <% } %>

            <div class="card shadow-sm">
                <div class="card-body">
                    <h5 class="card-title mb-3">Quick Links</h5>
                    <ul class="list-group list-group-flush">
                        <li class="list-group-item">
                            <a href="<%= request.getContextPath() %>/user-profile" class="text-decoration-none" id="viewProfileLinkDealer">
                                View Profile
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="text-decoration-none" id="addCarLinkDealer">
                                Add Car
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="text-decoration-none" id="myInventoryLink">
                                My Inventory
                            </a>
                        </li>
                        <li class="list-group-item">
                            <a href="#" class="text-decoration-none" id="dealerTransactionsLink">
                                Transactions
                            </a>
                        </li>
                        <li class="list-group-item">
                            <form action="<%= request.getContextPath() %>/logout" method="post" class="d-inline">
                                <button type="submit" class="btn btn-link p-0 text-danger text-decoration-none" id="logoutLinkDealer">
                                    Logout
                                </button>
                            </form>
                        </li>
                    </ul>
                </div>
            </div>

        </div>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
