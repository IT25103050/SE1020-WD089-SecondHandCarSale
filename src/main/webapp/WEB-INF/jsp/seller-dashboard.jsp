<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="targetUser" value="${not empty profileUser ? profileUser : sessionScope.user}" />
<c:set var="isOwner" value="${not empty sessionScope.userId && sessionScope.userId == targetUser.userId}" />
<c:set var="targetInfo" value="${not empty userInfoDisplay ? userInfoDisplay : targetUser.displayUserInfo()}" />
<c:set var="targetCars" value="${not empty inventory ? inventory : myListings}" />

<c:set var="pageTitle" value="Seller Profile: ${targetUser.fullName} | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Seller Dashboard -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Conditionally Render Sidebar for Logged-In Owner Context -->
                <c:if test="${isOwner}">
                    <div class="col-lg-2 col-md-3">
                        <jsp:include page="fragments/sidebar.jsp" />
                    </div>
                </c:if>

                <!-- Dynamic Content Center Width -->
                <div class="${isOwner ? 'col-lg-10 col-md-9' : 'col-lg-12'}">
                    
                    <!-- Banner Identity Header -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3">
                            <div>
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-danger px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8">
                                        ${targetUser.getDashboardName()}
                                    </span>
                                    <span class="badge bg-secondary bg-opacity-10 text-secondary px-2 py-1 fs-8">
                                        Status: ${targetUser.accountStatus}
                                    </span>
                                </div>
                                <h2 class="fw-bolder text-secondary mb-1">${targetUser.fullName}</h2>
                                <p class="text-slate-500 fs-6 mb-2">Location: <strong>${targetUser.address}</strong></p>
                                
                                <div class="p-2 bg-light rounded-3 border d-inline-block">
                                    <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block fw-bold lh-1 mb-1">About the Seller</span>
                                    <span class="text-slate-600 fs-7 italic">"${targetInfo}"</span>
                                </div>
                            </div>

                            <div class="d-flex flex-column gap-2 align-items-md-end">
                                <span class="text-slate-400 fs-8">User ID: <code>${targetUser.userId}</code></span>
                                <span class="text-slate-400 fs-8">Joined: ${targetUser.createdAt}</span>
                            </div>
                        </div>
                    </div>

                    <!-- Account Information -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-3">
                            <h4 class="fw-bold text-secondary mb-0">Seller Portal</h4>
                            <span class="badge bg-light text-secondary border px-2 py-1 fs-8">Active</span>
                        </div>
                        <div class="p-4 bg-light rounded-4 border text-center">
                            <i class="bi bi-person-check text-success display-4 d-block mb-3"></i>
                            <h5 class="fw-bold text-dark">Verified Seller Profile</h5>
                            <p class="text-slate-500 max-w-md mx-auto fs-7">
                                This profile is registered as a Seller in the AutoMart system. All vehicle listing and transaction modules have been removed to focus on User Management.
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
