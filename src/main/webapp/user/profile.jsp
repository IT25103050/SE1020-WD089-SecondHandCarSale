<%@ page import="com.wd089.model.User" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    User loggedUser = (User) session.getAttribute("loggedUser");
    if (loggedUser == null) {
        response.sendRedirect(request.getContextPath() + "/user/login.jsp");
        return;
    }

    String error = (String) request.getAttribute("error");
    String updated = request.getParameter("updated");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoVault - Profile</title>
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
            max-width: 1200px;
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
        }

        .cover {
            height: 120px;
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.45), rgba(118, 75, 162, 0.45));
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
        }

        .card-body-custom {
            padding: 0 30px 30px;
        }

        .profile-top {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 20px;
            flex-wrap: wrap;
            margin-top: -55px;
        }

        .profile-main {
            display: flex;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
        }

        .avatar {
            width: 110px;
            height: 110px;
            border-radius: 50%;
            border: 4px solid #ffffff;
            background: linear-gradient(135deg, #667eea, #764ba2);
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 34px;
            font-weight: 800;
            box-shadow: 0 12px 24px rgba(0,0,0,0.25);
        }

        .profile-text h1 {
            color: #ffffff;
            font-size: 30px;
            margin-bottom: 6px;
        }

        .profile-text p {
            color: #cbd5e1;
            font-size: 15px;
        }

        .top-actions {
            display: flex;
            gap: 12px;
            flex-wrap: wrap;
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

        .btn-secondary {
            background: rgba(255,255,255,0.08);
            color: white;
            border: 1px solid rgba(255,255,255,0.12);
        }

        .btn-secondary:hover {
            background: rgba(255,255,255,0.14);
        }

        .btn-dark {
            background: #1f2937;
            color: white;
        }

        .btn-dark:hover {
            background: #111827;
        }

        .btn-danger {
            background: linear-gradient(135deg, #ef4444, #dc2626);
            color: white;
        }

        .btn-danger:hover {
            transform: translateY(-2px);
            box-shadow: 0 12px 24px rgba(239, 68, 68, 0.28);
        }

        .alert {
            border-radius: 14px;
            padding: 14px 16px;
            margin-top: 22px;
            font-weight: 600;
        }

        .alert-success {
            background: rgba(34, 197, 94, 0.15);
            border: 1px solid rgba(34, 197, 94, 0.3);
            color: #86efac;
        }

        .alert-error {
            background: rgba(239, 68, 68, 0.15);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #fca5a5;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin: 28px 0;
        }

        .stat-box {
            background: rgba(255,255,255,0.05);
            border: 1px solid rgba(255,255,255,0.08);
            border-radius: 18px;
            padding: 18px;
        }

        .stat-label {
            font-size: 13px;
            color: #cbd5e1;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .stat-value {
            font-size: 21px;
            font-weight: 700;
            color: #ffffff;
        }

        .badge {
            display: inline-block;
            padding: 6px 12px;
            border-radius: 999px;
            font-size: 12px;
            font-weight: 700;
        }

        .badge-role {
            background: rgba(168, 85, 247, 0.18);
            color: #d8b4fe;
        }

        .badge-status-active {
            background: rgba(34, 197, 94, 0.18);
            color: #86efac;
        }

        .badge-status-inactive {
            background: rgba(239, 68, 68, 0.18);
            color: #fca5a5;
        }

        .form-grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .field {
            display: flex;
            flex-direction: column;
        }

        .field label {
            color: #e5e7eb;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .field input {
            width: 100%;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #ffffff;
            border-radius: 14px;
            padding: 13px 15px;
            font-size: 15px;
            transition: all 0.3s ease;
        }

        .field input:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            outline: none;
        }

        .field input[readonly] {
            color: #cbd5e1;
        }

        .save-row {
            margin-top: 24px;
            display: none;
        }

        .bottom-actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 14px;
            margin-top: 25px;
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

        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.6);
            display: none;
            align-items: center;
            justify-content: center;
            padding: 15px;
            z-index: 999;
        }

        .modal-box {
            width: 100%;
            max-width: 430px;
            background: rgba(15, 12, 41, 0.95);
            border: 1px solid rgba(255,255,255,0.1);
            border-radius: 22px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.35);
            padding: 28px;
            text-align: center;
            color: white;
        }

        .modal-box h3 {
            font-size: 24px;
            margin-bottom: 12px;
        }

        .modal-box p {
            color: #cbd5e1;
            line-height: 1.6;
            margin-bottom: 22px;
        }

        .modal-actions {
            display: flex;
            gap: 12px;
        }

        .modal-actions .btn,
        .modal-actions form {
            flex: 1;
        }

        .modal-actions form button {
            width: 100%;
        }

        @media (max-width: 900px) {
            .stats,
            .form-grid,
            .bottom-actions {
                grid-template-columns: 1fr;
            }
        }

        @media (max-width: 768px) {
            body {
                padding: 15px;
            }

            .brand-name {
                font-size: 32px;
            }

            .card-body-custom {
                padding: 0 20px 22px;
            }

            .profile-text h1 {
                font-size: 24px;
            }

            .profile-top {
                align-items: center;
            }

            .top-actions {
                width: 100%;
            }

            .top-actions .btn {
                width: 100%;
                text-align: center;
            }

            .modal-actions {
                flex-direction: column;
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
        <div class="cover"></div>

        <div class="card-body-custom">
            <div class="profile-top">
                <div class="profile-main">
                    <div class="avatar">
                        <%= (loggedUser.getFirstName().substring(0,1) + loggedUser.getLastName().substring(0,1)).toUpperCase() %>
                    </div>

                    <div class="profile-text">
                        <h1><%= loggedUser.getFirstName() %> <%= loggedUser.getLastName() %></h1>
                        <p>@<%= loggedUser.getUsername() %></p>
                    </div>
                </div>

                <div class="top-actions">
                    <button type="button" id="editBtn" class="btn btn-primary">Edit Profile</button>
                </div>
            </div>

            <% if ("1".equals(updated)) { %>
            <div class="alert alert-success">Profile updated successfully.</div>
            <% } %>

            <% if (error != null) { %>
            <div class="alert alert-error"><%= error %></div>
            <% } %>

            <div class="stats">
                <div class="stat-box">
                    <div class="stat-label">Role</div>
                    <div class="stat-value">
                        <span class="badge badge-role"><%= loggedUser.getRole() %></span>
                    </div>
                </div>

                <div class="stat-box">
                    <div class="stat-label">Status</div>
                    <div class="stat-value">
                            <span class="badge <%= "Active".equalsIgnoreCase(loggedUser.getStatus()) ? "badge-status-active" : "badge-status-inactive" %>">
                                <%= loggedUser.getStatus() %>
                            </span>
                    </div>
                </div>

                <div class="stat-box">
                    <div class="stat-label">User Code</div>
                    <div class="stat-value"><%= loggedUser.getUserCode() %></div>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/user" method="post" id="profileForm">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= loggedUser.getId() %>">

                <div class="form-grid">
                    <div class="field">
                        <label>User Code</label>
                        <input type="text" name="userCode" value="<%= loggedUser.getUserCode() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Username</label>
                        <input type="text" name="username" class="editable" value="<%= loggedUser.getUsername() %>" readonly>
                    </div>

                    <div class="field">
                        <label>First Name</label>
                        <input type="text" name="firstName" class="editable" value="<%= loggedUser.getFirstName() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Last Name</label>
                        <input type="text" name="lastName" class="editable" value="<%= loggedUser.getLastName() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Email</label>
                        <input type="email" name="email" class="editable" value="<%= loggedUser.getEmail() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Phone</label>
                        <input type="text" name="phone" class="editable" value="<%= loggedUser.getPhone() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Password</label>
                        <input type="text" name="password" class="editable" value="<%= loggedUser.getPassword() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Role</label>
                        <input type="text" name="role" value="<%= loggedUser.getRole() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Status</label>
                        <input type="text" name="status" value="<%= loggedUser.getStatus() %>" readonly>
                    </div>
                </div>

                <div class="save-row" id="saveRow">
                    <button type="submit" class="btn btn-primary" style="width:100%;">Save Changes</button>
                </div>
            </form>

            <div class="bottom-actions">
                <a href="${pageContext.request.contextPath}/user?action=list" class="btn btn-dark">View All Users</a>
                <a href="${pageContext.request.contextPath}/user?action=logout" class="btn btn-secondary">Logout</a>
                <button type="button" class="btn btn-danger" id="deleteBtn">Delete Account</button>
            </div>
        </div>
    </div>

    <div class="footer-text">
        <p>User Profile • AutoVault • 2026</p>
        <p style="margin-top:8px;">
            <a href="${pageContext.request.contextPath}/index.jsp">Back to Dashboard</a>
        </p>
    </div>
</div>

<div class="modal-overlay" id="deleteModal">
    <div class="modal-box">
        <h3>Delete Account</h3>
        <p>Are you sure you want to delete your account? This action cannot be undone.</p>

        <div class="modal-actions">
            <button type="button" class="btn btn-secondary" id="cancelDelete">Cancel</button>

            <form action="${pageContext.request.contextPath}/user" method="post">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= loggedUser.getId() %>">
                <button type="submit" class="btn btn-danger">Delete</button>
            </form>
        </div>
    </div>
</div>

<script>
    const editBtn = document.getElementById("editBtn");
    const editableFields = document.querySelectorAll(".editable");
    const saveRow = document.getElementById("saveRow");
    const deleteBtn = document.getElementById("deleteBtn");
    const deleteModal = document.getElementById("deleteModal");
    const cancelDelete = document.getElementById("cancelDelete");

    let editing = false;

    editBtn.addEventListener("click", function () {
        editing = !editing;

        editableFields.forEach(field => {
            field.readOnly = !editing;
        });

        saveRow.style.display = editing ? "block" : "none";
        editBtn.textContent = editing ? "Cancel Edit" : "Edit Profile";
        editBtn.className = editing ? "btn btn-secondary" : "btn btn-primary";
    });

    deleteBtn.addEventListener("click", function () {
        deleteModal.style.display = "flex";
    });

    cancelDelete.addEventListener("click", function () {
        deleteModal.style.display = "none";
    });

    deleteModal.addEventListener("click", function (e) {
        if (e.target === deleteModal) {
            deleteModal.style.display = "none";
        }
    });
</script>
</body>
</html>