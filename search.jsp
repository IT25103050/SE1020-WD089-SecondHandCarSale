<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Search Cars - WD089</title>
    <style>
        body {
            background: #f0f2f5;
            margin: 0;
            display: flex;
            flex-direction: column; /* Stacks Navbar on top of Content */
            min-height: 100vh;
        }

        .navbar {
            width: 100%; /* Forces the navbar to span the full screen */
        }

        .main-content-wrapper {
            flex-grow: 1;
            display: flex;
            justify-content: center;
            align-items: center; /* Centers your card or search box */
            padding: 20px;
        }
        .search-box { background: white; padding: 20px; border-radius: 8px; margin-bottom: 20px; box-shadow: 0 2px 5px rgba(0,0,0,0.1); }
        input { padding: 8px; margin-right: 10px; border: 1px solid #ccc; }
        button { background: #2563eb; color: white; border: none; padding: 8px 15px; border-radius: 4px; }
    </style>
</head>
<body>
<nav class="navbar navbar-expand-lg navbar-dark bg-dark shadow-sm">
    <div class="container">
        <a class="navbar-brand fw-bold text-primary" href="SearchServlet?brand=">
            🚗 AutoFleet <span class="text-white">Manager</span>
        </a>
    </div>
</nav>

<div class="main-content-wrapper">
    <div class="search-container">

    </div>
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