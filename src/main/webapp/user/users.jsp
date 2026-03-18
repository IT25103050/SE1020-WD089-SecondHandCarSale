<%@ page import="java.util.List" %>
<%@ page import="com.wd089.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    List<User> users = (List<User>) request.getAttribute("users");
    if (users == null) {
        users = new java.util.ArrayList<>();
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoVault - User Management</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            color: #e5e7eb;
            overflow-x: hidden;
            position: relative;
            padding: 25px;
        }

        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
            z-index: 0;
        }

        .bg-animation span {
            position: absolute;
            display: block;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.05);
            animation: float 25s linear infinite;
            bottom: -150px;
            border-radius: 50%;
        }

        .bg-animation span:nth-child(1) { left: 25%; width: 80px; height: 80px; animation-delay: 0s; }
        .bg-animation span:nth-child(2) { left: 10%; width: 20px; height: 20px; animation-delay: 2s; animation-duration: 12s; }
        .bg-animation span:nth-child(3) { left: 70%; width: 20px; height: 20px; animation-delay: 4s; }
        .bg-animation span:nth-child(4) { left: 40%; width: 60px; height: 60px; animation-delay: 0s; animation-duration: 18s; }
        .bg-animation span:nth-child(5) { left: 65%; width: 20px; height: 20px; animation-delay: 0s; }
        .bg-animation span:nth-child(6) { left: 75%; width: 110px; height: 110px; animation-delay: 3s; }
        .bg-animation span:nth-child(7) { left: 35%; width: 150px; height: 150px; animation-delay: 7s; }
        .bg-animation span:nth-child(8) { left: 50%; width: 25px; height: 25px; animation-delay: 15s; animation-duration: 45s; }
        .bg-animation span:nth-child(9) { left: 20%; width: 15px; height: 15px; animation-delay: 2s; animation-duration: 35s; }
        .bg-animation span:nth-child(10) { left: 85%; width: 150px; height: 150px; animation-delay: 0s; animation-duration: 11s; }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; border-radius: 50%; }
            100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; border-radius: 50%; }
        }

        @keyframes logoBounce {
            0%, 100% { transform: scale(1) rotate(0deg); }
            25% { transform: scale(1.1) rotate(5deg); }
            75% { transform: scale(1.1) rotate(-5deg); }
        }

        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            max-width: 1400px;
            margin: 0 auto;
            position: relative;
            z-index: 10;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 25px;
        }

        .logo {
            font-size: 58px;
            margin-bottom: 8px;
            animation: logoBounce 2s ease-in-out infinite;
        }

        .brand-name {
            font-size: 40px;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2, #f093fb);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            letter-spacing: -1px;
            animation: gradientFlow 3s ease infinite;
        }

        .tagline {
            font-size: 14px;
            color: #9ca3af;
            font-weight: 300;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4), inset 0 0 80px rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(20px);
            overflow: hidden;
            margin-bottom: 25px;
        }

        .card-header-custom {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.3), rgba(118, 75, 162, 0.3));
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 30px 25px;
            display: flex;
            justify-content: space-between;
            align-items: center;
            gap: 20px;
            flex-wrap: wrap;
        }

        .card-header-custom h2 {
            font-size: 30px;
            font-weight: 700;
            color: #ffffff;
            margin-bottom: 6px;
        }

        .card-header-custom p {
            color: #cbd5e1;
            font-size: 14px;
        }

        .top-right {
            text-align: right;
        }

        .top-right .count {
            font-size: 30px;
            font-weight: 800;
            color: #ffffff;
        }

        .top-right .sub {
            color: #cbd5e1;
            font-size: 14px;
            margin-bottom: 10px;
        }

        .btn {
            display: inline-block;
            padding: 12px 18px;
            border-radius: 14px;
            text-decoration: none;
            font-weight: 600;
            border: none;
            cursor: pointer;
            transition: 0.3s ease;
        }

        .btn-primary {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
        }

        .btn-primary:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px rgba(102, 126, 234, 0.35);
        }

        .card-body-custom {
            padding: 30px 25px;
        }

        .filter-grid {
            display: grid;
            grid-template-columns: 2fr 1fr 1fr 1fr;
            gap: 16px;
            margin-bottom: 20px;
        }

        .field label {
            display: block;
            color: #e5e7eb;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-control, .form-select {
            width: 100%;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #ffffff;
            border-radius: 14px;
            padding: 13px 15px;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .form-control:focus, .form-select:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            outline: none;
        }

        .form-select option {
            color: #000;
        }

        .btn-reset {
            width: 100%;
            padding: 13px 15px;
            border-radius: 14px;
            background: rgba(255,255,255,0.06);
            border: 1px solid rgba(255,255,255,0.12);
            color: #fff;
            font-weight: 600;
            cursor: pointer;
            margin-top: 28px;
            transition: 0.3s ease;
        }

        .btn-reset:hover {
            background: rgba(255,255,255,0.12);
        }

        .summary-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 18px 0 14px;
            color: #cbd5e1;
            font-size: 15px;
            gap: 15px;
            flex-wrap: wrap;
        }

        .summary-bar strong {
            color: #ffffff;
        }

        .table-wrap {
            overflow-x: auto;
            border-radius: 18px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            min-width: 1050px;
            overflow: hidden;
        }

        thead {
            background: rgba(255,255,255,0.08);
        }

        th, td {
            padding: 16px 14px;
            text-align: left;
            border-bottom: 1px solid rgba(255,255,255,0.08);
        }

        th {
            color: #ffffff;
            font-size: 14px;
            font-weight: 700;
        }

        td {
            color: #e5e7eb;
            font-size: 14px;
        }

        tbody tr:hover {
            background: rgba(255,255,255,0.04);
        }

        .user-code {
            font-weight: 700;
            color: #a5b4fc;
        }

        .sub-text {
            font-size: 12px;
            color: #9ca3af;
            margin-top: 4px;
        }

        .email-link {
            color: #93c5fd;
            text-decoration: none;
        }

        .email-link:hover {
            text-decoration: underline;
        }

        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
        }

        .role-admin {
            background: rgba(168, 85, 247, 0.18);
            color: #d8b4fe;
        }

        .role-seller {
            background: rgba(59, 130, 246, 0.18);
            color: #93c5fd;
        }

        .role-dealer {
            background: rgba(251, 146, 60, 0.18);
            color: #fdba74;
        }

        .role-buyer {
            background: rgba(34, 197, 94, 0.18);
            color: #86efac;
        }

        .status-active {
            background: rgba(34, 197, 94, 0.18);
            color: #86efac;
        }

        .status-inactive {
            background: rgba(239, 68, 68, 0.18);
            color: #fca5a5;
        }

        .empty-state {
            text-align: center;
            padding: 45px 20px;
            color: #cbd5e1;
        }

        .footer-text {
            text-align: center;
            margin-top: 26px;
            color: #94a3b8;
            font-size: 14px;
        }

        .footer-text a {
            color: #93c5fd;
            text-decoration: none;
            font-weight: 600;
        }

        .footer-text a:hover {
            text-decoration: underline;
        }

        @media (max-width: 1100px) {
            .filter-grid {
                grid-template-columns: 1fr 1fr;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 15px;
            }

            .brand-name {
                font-size: 32px;
            }

            .card-header-custom {
                flex-direction: column;
                align-items: flex-start;
            }

            .top-right {
                text-align: left;
            }

            .filter-grid {
                grid-template-columns: 1fr;
            }

            .btn-reset {
                margin-top: 0;
            }
        }
    </style>
</head>
<body>
<div class="bg-animation">
    <span></span><span></span><span></span><span></span><span></span>
    <span></span><span></span><span></span><span></span><span></span>
</div>

<div class="container">
    <div class="logo-container">
        <div class="logo">🚘</div>
        <div class="brand-name">AutoVault</div>
        <div class="tagline">Premium Second Hand Car Marketplace</div>
    </div>

    <div class="glass-card">
        <div class="card-header-custom">
            <div>
                <h2>User Management</h2>
                <p>View and manage all registered users in the system</p>
            </div>

            <div class="top-right">
                <div class="count" id="totalUsers"><%= users.size() %></div>
                <div class="sub">Total registered</div>
                <a href="${pageContext.request.contextPath}/user/register.jsp" class="btn btn-primary">Add New User</a>
            </div>
        </div>

        <div class="card-body-custom">
            <div class="filter-grid">
                <div class="field">
                    <label>Search Users</label>
                    <input type="text" id="searchInput" class="form-control"
                           placeholder="Search by code, name, username, email or role..." oninput="filterUsers()">
                </div>

                <div class="field">
                    <label>Filter by Role</label>
                    <select id="roleFilter" class="form-select" onchange="filterUsers()">
                        <option value="all">All Roles</option>
                        <option value="Admin">Admin</option>
                        <option value="Buyer">Buyer</option>
                        <option value="Seller">Seller</option>
                        <option value="Dealer">Dealer</option>
                    </select>
                </div>

                <div class="field">
                    <label>Filter by Status</label>
                    <select id="statusFilter" class="form-select" onchange="filterUsers()">
                        <option value="all">All Status</option>
                        <option value="Active">Active</option>
                        <option value="Inactive">Inactive</option>
                    </select>
                </div>

                <div class="field">
                    <button type="button" class="btn-reset" onclick="resetFilters()">Reset Filters</button>
                </div>
            </div>

            <div class="summary-bar">
                <div>Showing <strong id="showingCount"><%= users.size() %></strong> of <strong id="totalCount"><%= users.size() %></strong> users</div>
                <div>Filtered results</div>
            </div>

            <div class="table-wrap">
                <table>
                    <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Code</th>
                        <th>Full Name</th>
                        <th>Username</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Status</th>
                    </tr>
                    </thead>
                    <tbody id="usersTableBody">
                    <% if (users.isEmpty()) { %>
                    <tr>
                        <td colspan="8">
                            <div class="empty-state">
                                <h3>No users found</h3>
                                <div class="sub-text">No registered users are available in the system.</div>
                            </div>
                        </td>
                    </tr>
                    <% } else { %>
                    <% for (User u : users) {
                        String fullName = u.getFirstName() + " " + u.getLastName();
                        String searchData = (u.getUserCode() + " " + fullName + " " + u.getUsername() + " " + u.getEmail() + " " + u.getRole()).toLowerCase();

                        String roleClass = "role-buyer";
                        if ("Admin".equalsIgnoreCase(u.getRole())) roleClass = "role-admin";
                        else if ("Seller".equalsIgnoreCase(u.getRole())) roleClass = "role-seller";
                        else if ("Dealer".equalsIgnoreCase(u.getRole())) roleClass = "role-dealer";

                        String statusClass = "status-active";
                        if ("Inactive".equalsIgnoreCase(u.getStatus())) statusClass = "status-inactive";
                    %>
                    <tr class="user-row"
                        data-search="<%= searchData %>"
                        data-role="<%= u.getRole() %>"
                        data-status="<%= u.getStatus() %>">
                        <td>#<%= u.getId() %></td>
                        <td><span class="user-code"><%= u.getUserCode() %></span></td>
                        <td>
                            <div><%= fullName %></div>
                            <div class="sub-text">Registered user</div>
                        </td>
                        <td>@<%= u.getUsername() %></td>
                        <td><a class="email-link" href="mailto:<%= u.getEmail() %>"><%= u.getEmail() %></a></td>
                        <td><%= u.getPhone() %></td>
                        <td><span class="badge <%= roleClass %>"><%= u.getRole() %></span></td>
                        <td><span class="badge <%= statusClass %>"><%= u.getStatus() %></span></td>
                    </tr>
                    <% } %>
                    <% } %>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <div class="footer-text">
        <p>User Management System • 2026 • All rights reserved</p>
        <p style="margin-top:8px;">
            <a href="${pageContext.request.contextPath}/index.jsp">Back to Dashboard</a>
        </p>
    </div>
</div>

<script>
    function filterUsers() {
        const searchTerm = document.getElementById('searchInput').value.toLowerCase().trim();
        const roleFilter = document.getElementById('roleFilter').value;
        const statusFilter = document.getElementById('statusFilter').value;

        const rows = document.querySelectorAll('.user-row');
        let visibleCount = 0;

        rows.forEach(row => {
            const searchData = row.getAttribute('data-search').toLowerCase();
            const role = row.getAttribute('data-role');
            const status = row.getAttribute('data-status');

            const matchesSearch = searchData.includes(searchTerm);
            const matchesRole = roleFilter === 'all' || role === roleFilter;
            const matchesStatus = statusFilter === 'all' || status === statusFilter;

            if (matchesSearch && matchesRole && matchesStatus) {
                row.style.display = '';
                visibleCount++;
            } else {
                row.style.display = 'none';
            }
        });

        document.getElementById('showingCount').textContent = visibleCount;
    }

    function resetFilters() {
        document.getElementById('searchInput').value = '';
        document.getElementById('roleFilter').value = 'all';
        document.getElementById('statusFilter').value = 'all';
        filterUsers();
    }
</script>
</body>
</html>