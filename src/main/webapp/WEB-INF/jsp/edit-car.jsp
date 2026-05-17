<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Edit Vehicle | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Edit Vehicle Form -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Hub Form Area -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-secondary px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Edit Vehicle</span>
                                <h3 class="fw-bolder text-secondary mb-0">Edit Your Listing</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    Update the price, status, or description of your vehicle.
                                </p>
                            </div>
                            <span class="text-slate-400 fs-8">Vehicle ID: <code>${car.carId}</code></span>
                        </div>

                        <!-- Readonly Overview Card -->
                        <div class="p-3 bg-light rounded-3 mb-4 border d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-white text-dark border px-2 py-0 fs-8 me-2">${car.fuelType}</span>
                                <strong class="text-secondary fs-6">${car.brand} ${car.model} (${car.year})</strong>
                            </div>
                            <span class="badge bg-success bg-opacity-10 text-success fw-bold px-2 py-1">${car.condition}</span>
                        </div>

                        <form action="${pageContext.request.contextPath}/edit-car" method="post" class="row g-3">
                            <input type="hidden" name="carId" value="${car.carId}">

                            <div class="col-md-4">
                                <label for="price" class="form-label fw-semibold text-secondary fs-7 mb-1">Price (LKR)</label>
                                <input type="number" step="0.01" class="form-control bg-light py-2" id="price" name="price" value="${car.price}" required autofocus>
                            </div>

                            <div class="col-md-4">
                                <label for="mileage" class="form-label fw-semibold text-secondary fs-7 mb-1">Mileage (km)</label>
                                <input type="number" step="0.1" class="form-control bg-light py-2" id="mileage" name="mileage" value="${car.mileage}" required>
                            </div>

                            <div class="col-md-4">
                                <label for="carStatus" class="form-label fw-semibold text-secondary fs-7 mb-1">Status</label>
                                <select class="form-select bg-light py-2" id="carStatus" name="carStatus" required>
                                    <option value="AVAILABLE" ${car.carStatus == 'AVAILABLE' ? 'selected' : ''}>AVAILABLE</option>
                                    <option value="RESERVED" ${car.carStatus == 'RESERVED' ? 'selected' : ''}>RESERVED</option>
                                    <option value="SOLD" ${car.carStatus == 'SOLD' ? 'selected' : ''}>SOLD</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <label for="description" class="form-label fw-semibold text-secondary fs-7 mb-1">Description</label>
                                <textarea class="form-control bg-light" id="description" name="description" rows="5" required>${car.description}</textarea>
                            </div>

                            <div class="col-12 pt-3 border-top mt-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="${pageContext.request.contextPath}/my-listings" class="btn btn-outline-secondary px-3 py-2 fw-semibold fs-7">
                                        Cancel
                                    </a>
                                    <button type="submit" class="btn btn-primary-custom px-4 py-2 fw-bold">
                                        <i class="bi bi-check-circle-fill me-2"></i> Save Changes
                                    </button>
                                </div>
                            </div>

                        </form>

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
