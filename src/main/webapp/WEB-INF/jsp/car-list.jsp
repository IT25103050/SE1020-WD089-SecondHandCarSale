<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="Browse Verified Pre-Owned Inventory | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Page Header Showcase -->
    <div class="bg-secondary text-white py-5">
        <div class="container py-3">
            <nav aria-label="breadcrumb">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" class="text-slate-400">Home</a></li>
                    <li class="breadcrumb-item active text-white" aria-current="page">Browse Inventory</li>
                </ol>
            </nav>
            <h1 class="display-5 fw-bolder text-white mb-2">Available Market Vehicles</h1>
            <p class="text-slate-300 max-w-2xl mb-0 fs-5">
                Explore our wide selection of certified pre-owned vehicles ready for their next owner.
            </p>
        </div>
    </div>

    <!-- Main Dynamic Interface -->
    <main class="flex-shrink-0 py-5">
        <div class="container">
            
            <!-- Filter Options Panel -->
            <div class="card card-body bg-white rounded-4 shadow-sm border-0 mb-5 p-4">
                <form action="${pageContext.request.contextPath}/cars" method="get" class="row g-3 align-items-end">
                    <div class="col-lg-4 col-md-6">
                        <label for="brand" class="form-label fw-semibold text-secondary fs-7">Filter by Brand / Model</label>
                        <div class="input-group">
                            <span class="input-group-text bg-light border-end-0"><i class="bi bi-search text-slate-400"></i></span>
                            <input type="text" class="form-control border-start-0 bg-light" id="brand" name="brand" value="${param.brand}" placeholder="e.g. Ferrari, BMW, Tesla">
                        </div>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <label for="fuelType" class="form-label fw-semibold text-secondary fs-7">Powertrain Override</label>
                        <select class="form-select bg-light" id="fuelType" name="fuelType">
                            <option value="">All Engine Types</option>
                            <option value="Petrol" ${param.fuelType == 'Petrol' ? 'selected' : ''}>Petrol</option>
                            <option value="Diesel" ${param.fuelType == 'Diesel' ? 'selected' : ''}>Diesel</option>
                            <option value="Electric" ${param.fuelType == 'Electric' ? 'selected' : ''}>Electric</option>
                        </select>
                    </div>
                    <div class="col-lg-3 col-md-6">
                        <label for="maxPrice" class="form-label fw-semibold text-secondary fs-7">Maximum Price Cap (LKR)</label>
                        <input type="number" class="form-control bg-light" id="maxPrice" name="maxPrice" value="${param.maxPrice}" placeholder="e.g. 150000">
                    </div>
                    <div class="col-lg-2 col-md-6">
                        <button type="submit" class="btn btn-dark fw-semibold w-100 py-2 rounded-3">
                            Apply Filters
                        </button>
                    </div>
                </form>
                <c:if test="${not empty param.brand || not empty param.fuelType || not empty param.maxPrice}">
                    <div class="mt-3 text-end">
                        <a href="${pageContext.request.contextPath}/cars" class="text-danger fw-semibold fs-7 text-decoration-none">
                            <i class="bi bi-x-circle me-1"></i> Clear Filters
                        </a>
                    </div>
                </c:if>
            </div>

            <c:if test="${param.error == 'unavailable'}">
                <div class="alert alert-warning alert-auto-dismiss rounded-4 mb-4 shadow-sm" role="alert">
                    <i class="bi bi-exclamation-triangle-fill me-2"></i> The selected vehicle is currently reserved or already sold. Please select an available alternative.
                </div>
            </c:if>

            <!-- Vehicles Dynamic Roster Grid -->
            <div class="row g-4">
                <c:choose>
                    <c:when test="${empty cars}">
                        <div class="col-12 text-center py-5">
                            <div class="p-5 bg-white rounded-4 shadow-sm border border-dashed">
                                <i class="bi bi-binoculars text-slate-300 display-1 mb-3 d-block"></i>
                                <h4 class="fw-bold text-secondary">No Inventory Matches Active Search Query</h4>
                                <p class="text-slate-500 max-w-md mx-auto mb-4">
                                    Try adjusting your filters or search terms to find more vehicles.
                                </p>
                                <a href="${pageContext.request.contextPath}/cars" class="btn btn-outline-danger fw-semibold px-4 rounded-pill">
                                    View Full Inventory
                                </a>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="car" items="${cars}">
                            <div class="col-lg-4 col-md-6">
                                <div class="car-card">
                                    <div class="position-relative">
                                        <img src="${car.imagePath}" class="card-img-top" alt="${car.brand} ${car.model}" loading="lazy">
                                        <span class="position-absolute top-0 end-0 m-3 badge bg-dark bg-opacity-75 text-white backdrop-blur px-3 py-2 rounded-pill">
                                            <i class="bi bi-geo-alt-fill text-danger me-1"></i> ${car.location}
                                        </span>
                                    </div>
                                    <div class="card-body">
                                        <div>
                                            <div class="d-flex justify-content-between align-items-start mb-2">
                                                <span class="badge-fuel">${car.fuelType} Setup</span>
                                                <span class="badge bg-success bg-opacity-10 text-success fw-bold px-2 py-1">${car.condition}</span>
                                            </div>
                                            <h4 class="card-title fw-bold text-secondary mb-1">${car.brand} ${car.model}</h4>
                                            <p class="text-slate-500 fs-7 mb-3">
                                                <i class="bi bi-info-circle me-1 text-slate-400"></i> ${car.displayCarDetails()}
                                            </p>
                                            <div class="d-flex gap-3 text-slate-600 fs-7 mb-3 bg-light p-2 rounded-3">
                                                <span><i class="bi bi-calendar-event me-1 text-slate-400"></i> ${car.year}</span>
                                                <span>&bull;</span>
                                                <span><i class="bi bi-speedometer me-1 text-slate-400"></i> ${car.mileage} km</span>
                                                <span>&bull;</span>
                                                <span><i class="bi bi-gear me-1 text-slate-400"></i> ${car.transmission}</span>
                                            </div>
                                        </div>
                                        <div class="pt-3 border-top mt-auto d-flex justify-content-between align-items-center">
                                            <div>
                                                <span class="text-slate-400 fs-8 d-block lh-1">Asking Price</span>
                                                <span class="car-price">LKR <fmt:formatNumber value="${car.price}" pattern="#,###" /></span>
                                            </div>
                                            <a href="${pageContext.request.contextPath}/car-details?carId=${car.carId}" class="btn btn-dark fw-semibold px-3 py-2 rounded-3">
                                                Inspect Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>


        </div>
    </main>

    <!-- Shared Layout Footer -->
    <jsp:include page="fragments/footer.jsp" />

    <!-- Core Script Bundles -->
    <jsp:include page="fragments/layout-scripts.jsp" />

</body>
</html>
