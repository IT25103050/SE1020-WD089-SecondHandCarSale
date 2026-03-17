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
    <title>Profile Dashboard - AutoVault</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }

        body {
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            color: #e5e7eb;
            padding: 30px 15px;
        }

        .wrapper {
            max-width: 1100px;
            margin: auto;
        }

        .card {
            background: #ffffff;
            color: #1f2937;
            border-radius: 24px;
            box-shadow: 0 20px 45px rgba(0, 0, 0, 0.25);
            overflow: hidden;
        }

        .banner {
            height: 120px;
            background: linear-gradient(90deg, #3b82f6, #8b5cf6);
        }

        .content {
            padding: 0 30px 30px;
        }

        .top-section {
            display: flex;
            justify-content: space-between;
            align-items: flex-end;
            gap: 20px;
            margin-top: -55px;
            flex-wrap: wrap;
        }

        .profile-info {
            display: flex;
            align-items: center;
            gap: 18px;
            flex-wrap: wrap;
        }

        .avatar {
            width: 110px;
            height: 110px;
            border-radius: 50%;
            background: linear-gradient(135deg, #60a5fa, #8b5cf6);
            border: 4px solid #fff;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 34px;
            font-weight: bold;
            color: white;
            box-shadow: 0 8px 18px rgba(0,0,0,0.18);
        }

        .profile-text h1 {
            font-size: 30px;
            margin-bottom: 6px;
            color: #111827;
        }

        .profile-text p {
            color: #6b7280;
            font-size: 15px;
        }

        .btn {
            border: none;
            border-radius: 12px;
            padding: 12px 18px;
            font-size: 15px;
            font-weight: 600;
            cursor: pointer;
            transition: 0.25s ease;
            text-decoration: none;
            display: inline-block;
            text-align: center;
        }

        .btn-primary { background: #3b82f6; color: #fff; }
        .btn-primary:hover { background: #2563eb; }

        .btn-secondary { background: #6b7280; color: #fff; }
        .btn-secondary:hover { background: #4b5563; }

        .btn-dark { background: #1f2937; color: #fff; }
        .btn-dark:hover { background: #111827; }

        .btn-danger { background: #ef4444; color: #fff; }
        .btn-danger:hover { background: #dc2626; }

        .alert {
            margin-top: 20px;
            padding: 14px 16px;
            border-radius: 12px;
            font-weight: 600;
        }

        .alert-success {
            background: #dcfce7;
            color: #166534;
            border: 1px solid #86efac;
        }

        .alert-error {
            background: #fee2e2;
            color: #991b1b;
            border: 1px solid #fca5a5;
        }

        .stats {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 18px;
            margin: 28px 0;
        }

        .stat-box {
            padding: 18px;
            border-radius: 18px;
            border: 1px solid #dbeafe;
        }

        .stat-blue {
            background: linear-gradient(135deg, #eff6ff, #dbeafe);
            border-color: #bfdbfe;
        }

        .stat-green {
            background: linear-gradient(135deg, #ecfdf5, #d1fae5);
            border-color: #a7f3d0;
        }

        .stat-purple {
            background: linear-gradient(135deg, #f5f3ff, #ede9fe);
            border-color: #ddd6fe;
        }

        .stat-label {
            font-size: 13px;
            color: #4b5563;
            margin-bottom: 8px;
            font-weight: 600;
        }

        .stat-value {
            font-size: 20px;
            font-weight: 700;
            color: #111827;
        }

        .badge {
            display: inline-block;
            padding: 5px 12px;
            border-radius: 999px;
            font-size: 13px;
            font-weight: 700;
            background: #bbf7d0;
            color: #166534;
        }

        form {
            margin-top: 10px;
        }

        .grid {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 20px;
        }

        .field {
            display: flex;
            flex-direction: column;
        }

        .field label {
            margin-bottom: 8px;
            font-size: 14px;
            font-weight: 600;
            color: #374151;
        }

        .field input {
            padding: 12px 14px;
            border: 1px solid #d1d5db;
            border-radius: 12px;
            font-size: 15px;
            transition: 0.2s ease;
        }

        .field input:focus {
            border-color: #3b82f6;
            outline: none;
            box-shadow: 0 0 0 3px rgba(59,130,246,0.15);
        }

        .field input[readonly],
        .field input:disabled {
            background: #f3f4f6;
            color: #6b7280;
        }

        .actions {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 14px;
            margin-top: 25px;
        }

        .save-row {
            margin-top: 24px;
        }

        .hidden {
            display: none;
        }

        .modal-overlay {
            position: fixed;
            inset: 0;
            background: rgba(0,0,0,0.55);
            display: none;
            align-items: center;
            justify-content: center;
            padding: 15px;
        }

        .modal {
            background: #fff;
            color: #111827;
            width: 100%;
            max-width: 430px;
            border-radius: 18px;
            padding: 28px;
            box-shadow: 0 20px 40px rgba(0,0,0,0.25);
            text-align: center;
        }

        .modal h3 {
            margin-bottom: 12px;
            font-size: 24px;
        }

        .modal p {
            color: #6b7280;
            margin-bottom: 22px;
            line-height: 1.5;
        }

        .modal-buttons {
            display: flex;
            gap: 12px;
        }

        .modal-buttons .btn {
            flex: 1;
        }

        @media (max-width: 900px) {
            .stats,
            .grid,
            .actions {
                grid-template-columns: 1fr;
            }

            .top-section {
                align-items: center;
            }

            .profile-text h1 {
                font-size: 24px;
            }
        }
    </style>
</head>
<body>
<div class="wrapper">
    <div class="card">
        <div class="banner"></div>

        <div class="content">
            <div class="top-section">
                <div class="profile-info">
                    <div class="avatar">
                        <%= (loggedUser.getFirstName().substring(0,1) + loggedUser.getLastName().substring(0,1)).toUpperCase() %>
                    </div>
                    <div class="profile-text">
                        <h1><%= loggedUser.getFirstName() %> <%= loggedUser.getLastName() %></h1>
                        <p>@<%= loggedUser.getUsername() %></p>
                    </div>
                </div>

                <button type="button" id="editBtn" class="btn btn-primary">Edit Profile</button>
            </div>

            <% if ("1".equals(updated)) { %>
            <div class="alert alert-success">Profile updated successfully.</div>
            <% } %>

            <% if (error != null) { %>
            <div class="alert alert-error"><%= error %></div>
            <% } %>

            <div class="stats">
                <div class="stat-box stat-blue">
                    <div class="stat-label">Role</div>
                    <div class="stat-value"><%= loggedUser.getRole() %></div>
                </div>

                <div class="stat-box stat-green">
                    <div class="stat-label">Status</div>
                    <div class="badge"><%= loggedUser.getStatus() %></div>
                </div>

                <div class="stat-box stat-purple">
                    <div class="stat-label">Access Type</div>
                    <div class="stat-value"><%= loggedUser.getAccessType() %></div>
                </div>
            </div>

            <form action="${pageContext.request.contextPath}/user" method="post" id="profileForm">
                <input type="hidden" name="action" value="update">
                <input type="hidden" name="id" value="<%= loggedUser.getId() %>">

                <div class="grid">
                    <div class="field">
                        <label>User Code</label>
                        <input type="text" name="userCode" value="<%= loggedUser.getUserCode() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Username</label>
                        <input type="text" name="username" value="<%= loggedUser.getUsername() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>First Name</label>
                        <input type="text" name="firstName" value="<%= loggedUser.getFirstName() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Last Name</label>
                        <input type="text" name="lastName" value="<%= loggedUser.getLastName() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Email</label>
                        <input type="email" name="email" value="<%= loggedUser.getEmail() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Phone</label>
                        <input type="text" name="phone" value="<%= loggedUser.getPhone() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Password</label>
                        <input type="text" name="password" value="<%= loggedUser.getPassword() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Role</label>
                        <input type="text" name="role" value="<%= loggedUser.getRole() %>" readonly class="editable">
                    </div>

                    <div class="field">
                        <label>Status</label>
                        <input type="text" name="status" value="<%= loggedUser.getStatus() %>" readonly>
                    </div>

                    <div class="field">
                        <label>Access Type</label>
                        <input type="text" value="<%= loggedUser.getAccessType() %>" readonly>
                    </div>
                </div>

                <div class="save-row hidden" id="saveRow">
                    <button type="submit" class="btn btn-primary" style="width:100%;">Save Changes</button>
                </div>
            </form>

            <div class="actions">
                <a href="${pageContext.request.contextPath}/user?action=list" class="btn btn-dark">View All Users</a>
                <a href="${pageContext.request.contextPath}/user?action=logout" class="btn btn-secondary">Logout</a>
                <button type="button" class="btn btn-danger" id="deleteBtn">Delete Account</button>
            </div>
        </div>
    </div>
</div>

<div class="modal-overlay" id="deleteModal">
    <div class="modal">
        <h3>Delete Account</h3>
        <p>Are you sure you want to delete your account? This action cannot be undone.</p>

        <div class="modal-buttons">
            <button type="button" class="btn btn-secondary" id="cancelDelete">Cancel</button>

            <form action="${pageContext.request.contextPath}/user" method="post" style="flex:1;">
                <input type="hidden" name="action" value="delete">
                <input type="hidden" name="id" value="<%= loggedUser.getId() %>">
                <button type="submit" class="btn btn-danger" style="width:100%;">Delete</button>
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

        saveRow.classList.toggle("hidden", !editing);
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