<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Cars - WD089</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <style>
        /* This wrapper handles the vertical and horizontal centering */
        .main-wrapper {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 80vh; /* This gives it enough height to feel centered */
            padding: 20px;
        }

        .search-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            width: 100%; /* Ensure it uses the max-width properly */
            max-width: 900px;
            margin: 0; /* Remove the auto margin since the wrapper handles it */
        }
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f0f2f5;
            margin: 0;
        }
        .search-container {
            background: white;
            padding: 30px;
            border-radius: 12px;
            box-shadow: 0 4px 12px rgba(0,0,0,0.1);
            max-width: 900px;
            /* This centers the box AND adds space at the top */
            margin: 40px auto;
        }
        .row {
            margin-top: 30px; /* Gives the car cards breathing room below the search bar */
        }
        .form-label { font-weight: bold; color: #374151; }
        .btn-search { background-color: #1d4ed8; color: white; font-weight: bold; }
        .btn-search:hover { background-color: #1e40af; color: white; }
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
<%
    String msg = request.getParameter("msg");
    if (msg != null) {
        String alertClass = "alert-success";
        String alertText = "";
        if (msg.equals("added")) alertText = "Success! New car has been listed.";
        if (msg.equals("updated")) alertText = "Listing updated successfully!";
        if (msg.equals("deleted")) alertText = "Listing removed.";
%>
<div class="container mt-3">
    <div class="alert <%= alertClass %> alert-dismissible fade show" role="alert">
        <%= alertText %>
        <button type="button" class="btn-close" data-bs-dismiss="alert" aria-label="Close"></button>
    </div>
</div>
<% } %>
<div class="search-container">
    <div class="d-flex justify-content-between align-items-center mb-4">
        <h2 class="fw-bold m-0">Find Your Next Car</h2>
        <a href="add-car.jsp" class="btn btn-outline-primary btn-sm">+ List a Car</a>
    </div>

    <form action="SearchServlet" method="GET" class="row g-3">
        <div class="col-md-4">
            <label class="form-label">Brand</label>
            <input type="text" name="brand" class="form-control" placeholder="e.g. Toyota">
        </div>

        <div class="col-md-4">
            <label class="form-label">Min Year</label>
            <input type="number" name="min_year" class="form-control" placeholder="e.g. 2018">
        </div>

        <div class="col-md-4">
            <label class="form-label">Max Price (LKR)</label>
            <input type="number" name="max_price" class="form-control" placeholder="10000000">
        </div>

        <div class="col-12 mt-4">
            <button type="submit" class="btn btn-search w-100 py-2">Search Vehicles</button>
        </div>
    </form>
</div>

</body>
</html>