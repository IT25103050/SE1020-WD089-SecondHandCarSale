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
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/manage-cars">
                <i class="bi bi-car-front-fill"></i> Manage Cars
            </a>
            <a class="nav-link d-flex align-items-center gap-2 justify-content-between" href="${pageContext.request.contextPath}/pending-cars">
                <span><i class="bi bi-hourglass-split"></i> Pending Cars</span>
                <span class="badge bg-warning text-dark rounded-pill">Verify</span>
            </a>
            <a class="nav-link d-flex align-items-center gap-2 justify-content-between" href="${pageContext.request.contextPath}/pending-dealers">
                <span><i class="bi bi-person-lines-fill"></i> Pending Dealers</span>
                <span class="badge bg-warning text-dark rounded-pill">Verify</span>
            </a>
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/manage-transactions">
                <i class="bi bi-cash-stack"></i> Transactions
            </a>
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/manage-reviews">
                <i class="bi bi-star-fill"></i> Reviews Oversight
            </a>
        </c:if>

        <c:if test="${sessionScope.role == 'Seller' || sessionScope.role == 'Dealer'}">
            <div class="px-3 mt-4 mb-2">
                <span class="text-uppercase fw-bold text-secondary fs-7">Inventory</span>
            </div>
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/my-listings">
                <i class="bi bi-collection-fill"></i> My Listings
            </a>
            <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/add-car">
                <i class="bi bi-plus-square-fill"></i> Add New Vehicle
            </a>
        </c:if>

        <div class="px-3 mt-4 mb-2">
            <span class="text-uppercase fw-bold text-secondary fs-7">Records</span>
        </div>
        <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/transactions">
            <i class="bi bi-receipt"></i> My History
        </a>
        <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/reviews">
            <i class="bi bi-star-half"></i> Platform Reviews
        </a>
    </nav>
</div>
