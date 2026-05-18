<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="targetUser" value="${not empty profileUser ? profileUser : sessionScope.user}" />
<c:set var="isOwner" value="${not empty sessionScope.userId && sessionScope.userId == targetUser.userId}" />
<c:set var="targetInfo" value="${not empty userInfoDisplay ? userInfoDisplay : targetUser.displayUserInfo()}" />
<c:set var="targetCars" value="${not empty inventory ? inventory : myListings}" />

<c:set var="pageTitle" value="Dealership: ${targetUser.fullName} | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Dealership Dashboard -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Conditionally Render Sidebar for Logged-In Owner Context -->
                <c:if test="${isOwner}">
                    <div class="col-lg-2 col-md-3">
                        <jsp:include page="fragments/sidebar.jsp" />
                    </div>
                </c:if>

                <!-- Dynamic Showroom Center Width -->
                <div class="${isOwner ? 'col-lg-10 col-md-9' : 'col-lg-12'}">
                    
                    <!-- Dealership Showcase Identity Card -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4 border-top border-danger border-5">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                            <div>
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-danger px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8">
                                        Dealership Profile
                                    </span>
                                    <span class="badge bg-primary bg-opacity-10 text-primary px-2 py-1 fs-8 fw-bold">
                                        Verified
                                    </span>
                                </div>
                                <h1 class="display-6 fw-bolder text-secondary mb-1">${targetUser.fullName}</h1>
                                <p class="text-slate-500 fs-6 mb-3"><i class="bi bi-geo-alt-fill text-danger me-1"></i> Location: <strong>${targetUser.address}</strong></p>
                                
                                <div class="p-3 bg-light rounded-4 border d-inline-block max-w-2xl">
                                    <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block fw-bold lh-1 mb-1">About the Dealership</span>
                                    <span class="text-secondary fw-semibold fs-6">"${targetInfo}"</span>
                                </div>
                            </div>

                            <div class="d-flex flex-column gap-2 align-items-md-end">
                                <span class="text-slate-400 fs-8">User ID: <code>${targetUser.userId}</code></span>
                                <span class="badge ${targetUser.approvalStatus == 'APPROVED' ? 'bg-success' : 'bg-warning text-dark'}">
                                    Status: ${targetUser.approvalStatus}
                                </span>
                                <span class="text-slate-400 fs-8">Account: ${targetUser.accountStatus}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Account Information -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="fw-bold text-secondary mb-0">Dealer Administration</h4>
                            <span class="badge bg-light text-secondary border px-2 py-1 fs-8">Authorized</span>
                        </div>
                        <div class="p-4 bg-light rounded-4 border text-center">
                            <i class="bi bi-shop text-danger display-4 d-block mb-3"></i>
                            <h5 class="fw-bold text-dark">Verified Dealership Account</h5>
                            <p class="text-slate-500 max-w-md mx-auto fs-7">
                                This account is a verified Dealership in the AutoMart system. Inventory management and sales tracking modules have been removed to prioritize User Management isolation.
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
