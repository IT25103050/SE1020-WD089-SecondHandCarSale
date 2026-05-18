<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Manage Users | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Manage Users -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Core Audit Hub -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-secondary px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Admin Tools</span>
                                <h3 class="fw-bolder text-secondary mb-0">Manage Users</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    View and manage user accounts across the platform.
                                </p>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Total Users: <strong>${users.size()}</strong>
                            </span>
                        </div>

                        <c:if test="${not empty param.updated}">
                            <div class="alert alert-success alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-check-circle-fill me-2 text-success"></i> Account status updated successfully.
                            </div>
                        </c:if>

                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0 fs-7">
                                <thead class="table-light text-slate-400 fs-8 text-uppercase tracking-wider">
                                    <tr>
                                        <th scope="col">User ID</th>
                                        <th scope="col">User</th>
                                        <th scope="col">Details</th>
                                        <th scope="col">Role</th>
                                        <th scope="col">Account Status</th>
                                        <th scope="col">Approval Status</th>
                                        <th scope="col" class="text-end">Actions</th>
                                    </tr>
                                </thead>
                                <tbody class="text-slate-600">
                                    <c:forEach var="u" items="${users}">
                                        <tr>
                                            <td class="fw-bold text-secondary"><code>${u.userId}</code></td>
                                            <td>
                                                <strong class="text-secondary d-block">${u.fullName}</strong>
                                                <span class="text-slate-400 fs-8 pe-1"><i class="bi bi-envelope me-1"></i>${u.email}</span>
                                            </td>
                                            <td>
                                                <div class="max-w-xs text-truncate fs-8 bg-light p-1 rounded border" title="${u.displayUserInfo()}">
                                                    ${u.displayUserInfo()}
                                                </div>
                                            </td>
                                            <td>
                                                <span class="badge ${u.role == 'Admin' ? 'bg-danger' : (u.role == 'Dealer' ? 'bg-primary' : 'bg-secondary')}">
                                                    ${u.role}
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge ${u.accountStatus == 'ACTIVE' ? 'bg-success' : 'bg-warning text-dark'}">
                                                    ${u.accountStatus}
                                                </span>
                                            </td>
                                            <td>
                                                <span class="badge ${u.approvalStatus == 'APPROVED' ? 'bg-success' : 'bg-secondary'}">
                                                    ${u.approvalStatus}
                                                </span>
                                            </td>
                                            <td class="text-end">
                                                <c:choose>
                                                    <c:when test="${u.userId == sessionScope.userId}">
                                                        <span class="text-slate-400 fs-8 italic">Current User</span>
                                                    </c:when>
                                                    <c:otherwise>
                                                        <form action="${pageContext.request.contextPath}/update-user-status" method="post" class="d-flex gap-1 justify-content-end align-items-center">
                                                            <input type="hidden" name="userId" value="${u.userId}">
                                                            <select class="form-select form-select-sm bg-light fs-8 py-0" name="accountStatus" style="width: auto;">
                                                                <option value="ACTIVE" ${u.accountStatus == 'ACTIVE' ? 'selected' : ''}>ACTIVE</option>
                                                                <option value="SUSPENDED" ${u.accountStatus == 'SUSPENDED' ? 'selected' : ''}>SUSPENDED</option>
                                                            </select>
                                                            <button type="submit" class="btn btn-outline-dark btn-sm py-0 px-2 fs-8 fw-semibold">
                                                                Update
                                                            </button>
                                                        </form>
                                                    </c:otherwise>
                                                </c:choose>
                                            </td>
                                        </tr>
                                    </c:forEach>
                                </tbody>
                            </table>
                        </div>

                    </div>

                </div>

            </div>
        </div>
    </main>

    <!-- Shared Layout Footer -->
    <jsp:include page="fragments/footer.jsp" />

    <!-- Core Script Bundles -->
    <jsp:include page="fragments/layout-scripts.jsp" />

</body>
</html>
