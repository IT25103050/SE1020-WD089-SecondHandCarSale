<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Add a New Vehicle | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Add Car Form -->
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
                        
                        <div class="border-bottom pb-3 mb-4">
                            <span class="badge bg-danger px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Add a New Vehicle</span>
                            <h3 class="fw-bolder text-secondary mb-0">List Your Car for Sale</h3>
                            <p class="text-slate-400 fs-7 mb-0 mt-1">
                                Enter the details of your vehicle to list it on AutoMart.
                            </p>
                        </div>

                        <c:if test="${not empty errorMessage}">
                            <div class="alert alert-danger alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-x-circle-fill me-2 text-danger"></i> ${errorMessage}
                            </div>
                        </c:if>

                        <form action="${pageContext.request.contextPath}/add-car" method="post" enctype="multipart/form-data" class="row g-3">
                            
                            <div class="col-md-4">
                                <label for="brand" class="form-label fw-semibold text-secondary fs-7 mb-1">Make / Brand</label>
                                <input type="text" class="form-control bg-light py-2" id="brand" name="brand" placeholder="e.g. Toyota" required autofocus>
                            </div>

                            <div class="col-md-4">
                                <label for="model" class="form-label fw-semibold text-secondary fs-7 mb-1">Model</label>
                                <input type="text" class="form-control bg-light py-2" id="model" name="model" placeholder="e.g. Corolla Axio" required>
                            </div>

                            <div class="col-md-4">
                                <label for="year" class="form-label fw-semibold text-secondary fs-7 mb-1">Year</label>
                                <input type="number" class="form-control bg-light py-2" id="year" name="year" min="1950" max="2026" value="2022" required>
                            </div>

                            <div class="col-md-4">
                                <label for="price" class="form-label fw-semibold text-secondary fs-7 mb-1">Price (LKR)</label>
                                <input type="number" step="0.01" class="form-control bg-light py-2" id="price" name="price" placeholder="135000" required>
                            </div>

                            <div class="col-md-4">
                                <label for="mileage" class="form-label fw-semibold text-secondary fs-7 mb-1">Mileage (km)</label>
                                <input type="number" step="0.1" class="form-control bg-light py-2" id="mileage" name="mileage" placeholder="4500" required>
                            </div>

                            <div class="col-md-4">
                                <label for="fuelType" class="form-label fw-semibold text-secondary fs-7 mb-1">Fuel Type</label>
                                <select class="form-select bg-light py-2" id="fuelType" name="fuelType" required>
                                    <option value="Petrol">Petrol</option>
                                    <option value="Diesel">Diesel</option>
                                    <option value="Electric">Electric</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="transmission" class="form-label fw-semibold text-secondary fs-7 mb-1">Gearbox Type</label>
                                <select class="form-select bg-light py-2" id="transmission" name="transmission" required>
                                    <option value="Automatic">Automatic Transmission</option>
                                    <option value="Manual">Manual Transmission</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="condition" class="form-label fw-semibold text-secondary fs-7 mb-1">Condition</label>
                                <select class="form-select bg-light py-2" id="condition" name="condition" required>
                                    <option value="Used">Used</option>
                                    <option value="Pristine">Pristine</option>
                                    <option value="New">New</option>
                                </select>
                            </div>

                            <div class="col-md-4">
                                <label for="location" class="form-label fw-semibold text-secondary fs-7 mb-1">Location</label>
                                <input type="text" class="form-control bg-light py-2" id="location" name="location" placeholder="e.g. Colombo, Kandy" required>
                            </div>

                            <div class="col-12">
                                <label for="description" class="form-label fw-semibold text-secondary fs-7 mb-1">Description</label>
                                <textarea class="form-control bg-light" id="description" name="description" rows="4" placeholder="Describe the condition, features, and history of the vehicle." required></textarea>
                            </div>

                            <div class="col-12">
                                <label for="imageFile" class="form-label fw-semibold text-secondary fs-7 mb-1">Upload Photo (Optional)</label>
                                <input class="form-control bg-light" type="file" id="imageFile" name="imageFile" accept="image/*">
                                <div class="form-text fs-8 text-slate-400">
                                    If you don't upload a photo, a standard placeholder image will be used.
                                </div>
                            </div>

                            <div class="col-12 pt-3 border-top mt-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <span class="text-slate-400 fs-8 italic">
                                        <i class="bi bi-info-circle me-1"></i> Your listing will be visible after a quick review.
                                    </span>
                                    <button type="submit" class="btn btn-primary-custom px-4 py-2 fw-bold">
                                        <i class="bi bi-cloud-arrow-up-fill me-2"></i> Submit Listing
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
