<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Manage Users</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-4">
        <div class="container-fluid">
            <a class="navbar-brand" href="admin-dashboard">AutoMart Admin</a>
            <div class="collapse navbar-collapse">
                <ul class="navbar-nav ms-auto">
                    <li class="nav-item"><a class="nav-link active" href="manage-users">Manage Users</a></li>
                    <li class="nav-item"><a class="nav-link" href="admin-dashboard">Dashboard</a></li>
                </ul>
            </div>
        </div>
    </nav>

    <div class="container">
        <h2>Manage Users</h2>
        <div class="table-responsive bg-white p-3 shadow-sm rounded">
            <table class="table table-bordered table-hover align-middle">
                <thead class="table-light">
                    <tr>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Email</th>
                        <th>Phone</th>
                        <th>Role</th>
                        <th>Account Status</th>
                        <th>Approval Status</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${users}">
                        <tr>
                            <td>${user.userId}</td>
                            <td>${user.fullName}</td>
                            <td>${user.email}</td>
                            <td>${user.phone}</td>
                            <td>${user.role}</td>
                            <td>
                                <span class="badge ${user.accountStatus == 'Active' ? 'bg-success' : 'bg-secondary'}">${user.accountStatus}</span>
                            </td>
                            <td>
                                <span class="badge ${user.approvalStatus == 'Approved' ? 'bg-success' : (user.approvalStatus == 'Pending' ? 'bg-warning' : 'bg-danger')}">${user.approvalStatus}</span>
                            </td>
                            <td>
                                <form action="manage-users" method="post" class="d-inline">
                                    <input type="hidden" name="userId" value="${user.userId}">
                                    <c:if test="${user.accountStatus != 'Active'}">
                                        <button type="submit" name="action" value="activate" class="btn btn-sm btn-success">Activate</button>
                                    </c:if>
                                    <c:if test="${user.accountStatus == 'Active'}">
                                        <button type="submit" name="action" value="deactivate" class="btn btn-sm btn-secondary">Deactivate</button>
                                    </c:if>
                                    <button type="submit" name="action" value="delete" class="btn btn-sm btn-danger" onclick="return confirm('Are you sure you want to delete this user?');">Delete</button>
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
