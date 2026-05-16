<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="Buyer Dashboard | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Buyer Dashboard -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Core Dashboard Center -->
                <div class="col-lg-10 col-md-9">
                    
                    <!-- Welcome Profile Jumbotron Banner -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                            <div>
                                <span class="badge bg-danger px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-2">
                                    ${sessionScope.user.getDashboardName()}
                                </span>
                                <h2 class="fw-bolder text-secondary mb-1">Welcome back, ${sessionScope.fullName}!</h2>
                                <p class="text-slate-400 fs-7 mb-0">
                                    <i class="bi bi-person-badge text-slate-400 me-1"></i> Profile Details: 
                                    <strong class="text-slate-600">${sessionScope.user.displayUserInfo()}</strong>
                                </p>
                            </div>
                        </div>
                    </div>

                    <!-- Account Information -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="fw-bold text-secondary mb-0">Account Information</h4>
                            <span class="badge bg-light text-secondary border px-2 py-1 fs-8">Secure</span>
                        </div>
                        <div class="p-4 bg-light rounded-4 border text-center">
                            <i class="bi bi-shield-lock text-primary display-4 d-block mb-3"></i>
                            <h5 class="fw-bold text-dark">User Management Core</h5>
                            <p class="text-slate-500 max-w-md mx-auto fs-7">
                                Your account is part of the AutoMart User Management module. You can securely log in, access your dashboard, and manage your session.
                            </p>
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
