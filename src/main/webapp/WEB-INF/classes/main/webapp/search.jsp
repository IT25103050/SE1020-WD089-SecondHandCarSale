<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Cars - WD089</title>
    <style>
        body { font-family: sans-serif; background: #f4f6f9; padding: 30px; }
        .search-box { background: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        input { padding: 8px; margin-right: 10px; border: 1px solid #ccc; }
        button { background: #2563eb; color: white; border: none; padding: 8px 15px; border-radius: 4px; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm mb-4">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="SearchServlet?brand=">
            🚗 AutoFleet <span class="text-white">Manager</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav">
            <span class="navbar-toggler-icon"></span>
        </button>
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav ms-auto">
                <li class="nav-item">
                    <a class="nav-link" href="SearchServlet?brand=">Inventory</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link" href="add-car.jsp">Add New Car</a>
                </li>
            </ul>
        </div>
    </div>
</nav>

<div class="main-content-wrapper">
</div>
<h2>Search for Second-Hand Cars</h2>
<div class="search-box">
    <form action="SearchServlet" method="get">
        <input type="text" name="brand" placeholder="Brand (e.g. Toyota)">
        <input type="number" name="max_price" placeholder="Max Price (LKR)">
        <button type="submit">Search Now</button>
    </form>
</div>
</body>
</html>