<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoMart - Second-Hand Car Platform</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link rel="stylesheet" href="css/style.css">
</head>
<body>
    <!-- Navbar -->
    <nav class="navbar navbar-expand-lg navbar-dark bg-navy sticky-top">
        <div class="container">
            <a class="navbar-brand fw-bold" href="index.jsp">AutoMart</a>
            <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
                <span class="navbar-toggler-icon"></span>
            </button>
            <div class="collapse navbar-collapse" id="navbarNav">
                <ul class="navbar-nav me-auto">
                    <li class="nav-item">
                        <a class="nav-link active" href="index.jsp">Home</a>
                    </li>
                </ul>
                <ul class="navbar-nav">
                    <% if(session.getAttribute("userId") == null) { %>
                        <li class="nav-item">
                            <a class="nav-link" href="login.jsp">Login</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-primary ms-2" href="register.jsp">Sign Up</a>
                        </li>
                    <% } else { %>
                        <li class="nav-item">
                            <a class="nav-link" href="dashboard">Dashboard (<%= session.getAttribute("role") %>)</a>
                        </li>
                        <li class="nav-item">
                            <a class="btn btn-outline-light ms-2" href="logout">Logout</a>
                        </li>
                    <% } %>
                </ul>
            </div>
        </div>
    </nav>

    <!-- Hero Section -->
    <section class="hero-section text-center d-flex align-items-center" style="min-height: 80vh;">
        <div class="container">
            <h1 class="display-4 fw-bold text-white mb-4">Welcome to AutoMart</h1>
            <p class="lead text-white mb-5">User Account Management Portal</p>
            
            <div class="mt-4">
                <% if(session.getAttribute("userId") == null) { %>
                    <a href="login.jsp" class="btn btn-primary btn-lg me-3 px-5 py-3 fw-bold shadow-sm">Login</a>
                    <a href="register.jsp" class="btn btn-outline-light btn-lg px-5 py-3 fw-bold shadow-sm">Sign Up</a>
                <% } else { %>
                    <a href="dashboard" class="btn btn-primary btn-lg px-5 py-3 fw-bold shadow-sm">Go to Dashboard</a>
                <% } %>
            </div>
        </div>
    </section>

    <!-- Footer -->
    <footer class="bg-navy text-white py-4 mt-auto">
        <div class="container text-center">
            <p class="mb-0">&copy; 2026 AutoMart - Second-Hand Car Sales and Purchase Platform. SE1020 OOP Project.</p>
        </div>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="js/script.js"></script>
</body>
</html>
