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
                                <c:if test="${isOwner}">
                                    <a href="${pageContext.request.contextPath}/add-car" class="btn btn-primary-custom fw-semibold rounded-3 py-2 px-3 mt-2 fs-7">
                                        <i class="bi bi-plus-circle me-1"></i> Add Vehicle
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- Vehicles List -->
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        <div class="d-flex justify-content-between align-items-center mb-3 pt-1">
                            <div>
                                <span class="text-danger fw-bold text-uppercase fs-8 tracking-widest d-block">Inventory</span>
                                <h4 class="fw-bold text-secondary mb-0">
                                    ${isOwner ? 'My Dealership Vehicles' : 'Dealership Vehicles'}
                                </h4>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Total Vehicles: <strong>${targetCars.size()}</strong>
                            </span>
                        </div>

                        <c:choose>
                            <c:when test="${empty targetCars}">
                                <div class="p-5 text-center bg-light rounded-4 border my-3">
                                    <i class="bi bi-shop-window text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">No Vehicles Listed</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        ${isOwner ? 'You don\'t have any vehicles listed. Add your first vehicle to start selling.' : 'This dealership currently has no vehicles listed.'}
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row g-4 mt-1">
                                    <c:forEach var="car" items="${targetCars}">
                                        <div class="col-lg-4 col-md-6">
                                            <div class="car-card">
                                                <div class="position-relative">
                                                    <img src="${car.imagePath.startsWith('/') ? pageContext.request.contextPath : ''}${car.imagePath}" class="card-img-top" alt="${car.brand} ${car.model}" loading="lazy">
                                                    <span class="position-absolute top-0 end-0 m-3 badge ${car.carStatus == 'AVAILABLE' ? 'bg-success' : 'bg-warning text-dark'} px-2 py-1 rounded-pill">
                                                        ${car.carStatus}
                                                    </span>
                                                </div>
                                                <div class="card-body p-3">
                                                    <div class="d-flex justify-content-between align-items-start mb-1">
                                                        <span class="badge-fuel">${car.fuelType} Engine</span>
                                                        <span class="text-danger fw-bolder fs-6">LKR <fmt:formatNumber value="${car.price}" pattern="#,###" /></span>
                                                    </div>
                                                    <h5 class="fw-bold text-secondary mb-1">${car.brand} ${car.model}</h5>
                                                    <p class="text-slate-400 fs-8 mb-2">${car.year} Model &bull; ${car.mileage} km &bull; ${car.transmission}</p>

                                                    <div class="p-2 bg-light rounded-3 mb-3 border">
                                                        <span class="text-slate-400 fs-8 d-block lh-1 mb-1">Estimated Value</span>
                                                        <strong class="text-secondary fs-7">LKR <fmt:formatNumber value="${car.calculateEstimatedValue()}" pattern="#,###" /></strong>
                                                    </div>

                                                    <div class="pt-2 border-top mt-auto d-flex gap-2">
                                                        <a href="${pageContext.request.contextPath}/car-details?carId=${car.carId}" class="btn btn-dark btn-sm fw-semibold flex-grow-1 py-1 rounded-2 fs-8">
                                                            View Details
                                                        </a>
                                                        <c:if test="${isOwner}">
                                                            <a href="${pageContext.request.contextPath}/edit-car?carId=${car.carId}" class="btn btn-outline-secondary btn-sm px-2 py-1 rounded-2" title="Edit Vehicle">
                                                                <i class="bi bi-pencil"></i>
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
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
