<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="sidebar-glass h-100 rounded-start">
    <div class="px-3 mb-4">
        <span class="text-uppercase fw-bold text-danger fs-6 tracking-wide">Navigation Menu</span>
    </div>
    <nav class="nav flex-column">
        <a class="nav-link d-flex align-items-center gap-2 ${currentUri == '/dashboard' ? 'active' : ''}" href="${pageContext.request.contextPath}/dashboard">
            <i class="bi bi-grid-1x2-fill"></i> Overview Dashboard
        </a>

        <c:if test="${sessionScope.role == 'Admin'}">
            <div class="px-3 mt-4 mb-2">
                <span class="text-uppercase fw-bold text-secondary fs-7">Administration</span>
            </div>
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/manage-users">
                <i class="bi bi-people-fill"></i> Manage Users
            </a>
            <a class="nav-link d-flex align-items-center gap-2 justify-content-between" href="${pageContext.request.contextPath}/pending-dealers">
                <span><i class="bi bi-person-lines-fill"></i> Pending Dealers</span>
                <span class="badge bg-warning text-dark rounded-pill">Verify</span>
            </a>
        </c:if>

        <div class="px-3 mt-4 mb-2">
            <span class="text-uppercase fw-bold text-secondary fs-7">Account Settings</span>
        </div>
        <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/logout">
            <i class="bi bi-box-arrow-right"></i> Sign Out
        </a>
    </nav>
</div>
