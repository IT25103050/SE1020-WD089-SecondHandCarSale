<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="Admin Dashboard | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Admin Dashboard -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Menu Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Administration Oversight Base -->
                <div class="col-lg-10 col-md-9">
                    
                    <!-- Top System Status Banner -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4 border-start border-secondary border-5">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                            <div>
                                <span class="badge bg-secondary px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-2">
                                    Admin Dashboard
                                </span>
                                <h2 class="fw-bolder text-secondary mb-1">Welcome back, ${sessionScope.user.fullName}</h2>
                                <p class="text-slate-500 fs-7 mb-0">
                                    Role: <strong class="text-danger">${sessionScope.user.role}</strong>
                                </p>
                            </div>
                            <div class="d-flex gap-2">
                                <a href="${pageContext.request.contextPath}/manage-users" class="btn btn-outline-secondary fw-semibold rounded-3 fs-7">
                                    <i class="bi bi-people me-1"></i> Users
                                </a>
                            </div>
                        </div>
                    </div>

                    <!-- Statistics Overview -->
                    <div class="row g-3 mb-4">
                        <div class="col-sm-6 col-lg-6">
                            <div class="p-3 bg-white rounded-4 border shadow-sm d-flex align-items-center gap-3">
                                <div class="bg-primary bg-opacity-10 text-primary rounded-circle p-3 d-flex align-items-center justify-content-center" style="width: 55px; height: 55px;">
                                    <i class="bi bi-people-fill fs-4"></i>
                                </div>
                                <div>
                                    <span class="text-slate-400 fs-8 text-uppercase tracking-wider d-block fw-bold">Total Users</span>
                                    <h3 class="fw-bolder text-secondary mb-0">${stats.totalUsers}</h3>
                                </div>
                            </div>
                        </div>

                        <div class="col-sm-6 col-lg-6">
                            <div class="p-3 bg-white rounded-4 border shadow-sm d-flex align-items-center gap-3">
                                <div class="bg-danger bg-opacity-10 text-danger rounded-circle p-3 d-flex align-items-center justify-content-center" style="width: 55px; height: 55px;">
                                    <i class="bi bi-person-lines-fill fs-4"></i>
                                </div>
                                <div>
                                    <span class="text-slate-400 fs-8 text-uppercase tracking-wider d-block fw-bold">Pending Dealerships</span>
                                    <h3 class="fw-bolder text-secondary mb-0">${stats.pendingDealersCount}</h3>
                                </div>
                            </div>
                        </div>
                    </div>

                    <!-- Actions & Moderation Overview Roster -->
                    <div class="row g-4">
                        
                        <!-- Right Pending Dealerships Column -->
                        <div class="col-lg-12">
                            <div class="card border-0 rounded-4 shadow-sm bg-white p-4 h-100">
                                <div class="d-flex justify-content-between align-items-center mb-3">
                                    <div>
                                        <span class="text-danger fw-bold fs-8 text-uppercase tracking-widest d-block">Dealerships</span>
                                        <h5 class="fw-bold text-secondary mb-0">Pending Dealerships</h5>
                                    </div>
                                    <a href="${pageContext.request.contextPath}/pending-dealers" class="btn btn-outline-secondary btn-sm fw-semibold rounded-pill px-3">
                                        View All
                                    </a>
                                </div>

                                <c:choose>
                                    <c:when test="${empty pendingDealers}">
                                        <div class="p-4 bg-light rounded-4 text-center my-auto border">
                                            <i class="bi bi-shield-check text-success fs-2 d-block mb-1"></i>
                                            <span class="fw-semibold text-slate-500 fs-7">There are no dealerships pending approval.</span>
                                        </div>
                                    </c:when>
                                    <c:otherwise>
                                        <div class="d-flex flex-column gap-2">
                                            <c:forEach var="dealer" items="${pendingDealers}" end="3">
                                                <div class="p-3 bg-light rounded-3 border d-flex justify-content-between align-items-center">
                                                    <div>
                                                        <strong class="text-secondary fs-7">${dealer.fullName}</strong>
                                                        <span class="text-slate-400 fs-8 d-block mt-1">User ID: <code>${dealer.userId}</code> &bull; Location: ${dealer.address}</span>
                                                    </div>
                                                    <form action="${pageContext.request.contextPath}/approve-dealer" method="post" class="d-flex gap-1">
                                                        <input type="hidden" name="userId" value="${dealer.userId}">
                                                        <input type="hidden" name="approvalStatus" value="APPROVED">
                                                        <button type="submit" class="btn btn-primary-custom btn-sm px-2 py-1 fs-8" title="Approve">
                                                            <i class="bi bi-check-circle-fill"></i>
                                                        </button>
                                                    </form>
                                                </div>
                                            </c:forEach>
                                        </div>
                                    </c:otherwise>
                                </c:choose>
                            </div>
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
