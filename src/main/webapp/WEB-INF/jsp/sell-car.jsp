<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Sell Your Car - AutoMart</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <jsp:include page="fragments/navbar.jsp" />

    <main class="flex-grow-1">
        <div class="container py-5 mt-4">
            <div class="row align-items-center mb-5">
                <div class="col-lg-6 mb-4 mb-lg-0">
                    <h1 class="display-6 fw-bold mb-3 font-montserrat text-dark">Sell Your Vehicle</h1>
                    <p class="lead text-muted mb-0">List your premium car in front of thousands of verified buyers. Fast, secure, and hassle-free.</p>
                </div>
                <div class="col-lg-6 text-lg-end">
                    <div class="d-inline-flex align-items-center bg-white rounded-pill px-4 py-2 shadow-sm border">
                        <i class="bi bi-shield-check text-success fs-4 me-2"></i>
                        <span class="fw-semibold text-muted">100% Secure Listing Process</span>
                    </div>
                </div>
            </div>

            <div class="row justify-content-center">
                <div class="col-lg-10">
                    <div class="glass-card bg-white p-4 p-md-5 border-0 shadow-sm">
                        <form action="<c:url value='/sell-car'/>" method="post" enctype="multipart/form-data">
                            
                            <!-- Section 1: Basic Vehicle Details -->
                            <h4 class="fw-bold mb-4 pb-2 border-bottom text-dark">Vehicle Details</h4>
                            <div class="row g-4 mb-5">
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Make *</label>
                                    <select class="form-select bg-light border-0" name="make" required>
                                        <option value="">Select Make</option>
                                        <option value="Aston Martin">Aston Martin</option>
                                        <option value="Audi">Audi</option>
                                        <option value="BMW">BMW</option>
                                        <option value="Ferrari">Ferrari</option>
                                        <option value="Mercedes">Mercedes-Benz</option>
                                        <option value="Porsche">Porsche</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Model *</label>
                                    <input type="text" class="form-control bg-light border-0" name="model" placeholder="e.g. 911 Carrera S" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Year of Manufacture *</label>
                                    <input type="number" class="form-control bg-light border-0" name="year" min="1990" max="2024" placeholder="YYYY" required>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Mileage *</label>
                                    <div class="input-group">
                                        <input type="number" class="form-control bg-light border-0" name="mileage" placeholder="0" required>
                                        <span class="input-group-text bg-light border-0 text-muted">km</span>
                                    </div>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Price (Asking) *</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-0 text-muted">LKR</span>
                                        <input type="number" class="form-control bg-light border-0" name="price" placeholder="0.00" required>
                                    </div>
                                </div>
                            </div>

                            <!-- Section 2: Specifications -->
                            <h4 class="fw-bold mb-4 pb-2 border-bottom text-dark">Specifications</h4>
                            <div class="row g-4 mb-5">
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Transmission</label>
                                    <select class="form-select bg-light border-0" name="transmission">
                                        <option value="Automatic">Automatic</option>
                                        <option value="Manual">Manual</option>
                                        <option value="Semi-Auto">Semi-Auto</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Fuel Type</label>
                                    <select class="form-select bg-light border-0" name="fuelType">
                                        <option value="Petrol">Petrol</option>
                                        <option value="Diesel">Diesel</option>
                                        <option value="Hybrid">Hybrid</option>
                                        <option value="Electric">Electric</option>
                                    </select>
                                </div>
                                <div class="col-md-4">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Body Style</label>
                                    <select class="form-select bg-light border-0" name="bodyStyle">
                                        <option value="Coupe">Coupe</option>
                                        <option value="Convertible">Convertible</option>
                                        <option value="Saloon">Saloon</option>
                                        <option value="SUV">SUV</option>
                                        <option value="Hatchback">Hatchback</option>
                                    </select>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Engine Size (Liters)</label>
                                    <input type="number" step="0.1" class="form-control bg-light border-0" name="engineSize" placeholder="e.g. 4.0">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Exterior Color</label>
                                    <input type="text" class="form-control bg-light border-0" name="color" placeholder="e.g. Obsidian Black">
                                </div>
                            </div>

                            <!-- Section 3: Description & Images -->
                            <h4 class="fw-bold mb-4 pb-2 border-bottom text-dark">Description & Media</h4>
                            <div class="row g-4 mb-4">
                                <div class="col-12">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Vehicle Title / Headline *</label>
                                    <input type="text" class="form-control bg-light border-0" name="title" placeholder="e.g. Immaculate Condition AMG GT with Carbon Pack" required>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Detailed Description *</label>
                                    <textarea class="form-control bg-light border-0" name="description" rows="6" placeholder="Describe the condition, service history, options, and features..." required></textarea>
                                </div>
                                <div class="col-12">
                                    <label class="form-label fw-semibold small text-muted text-uppercase tracking-wider">Upload Images *</label>
                                    <div class="border border-dashed border-2 rounded-4 p-5 text-center bg-light cursor-pointer position-relative">
                                        <input type="file" class="form-control position-absolute top-0 start-0 w-100 h-100 opacity-0" id="imageUpload" name="images" multiple accept="image/*" style="cursor: pointer;">
                                        <i class="bi bi-cloud-arrow-up text-primary" style="font-size: 3rem;"></i>
                                        <h5 class="mt-3 text-dark fw-bold">Click or drag images here</h5>
                                        <p class="text-muted small mb-0">Upload up to 10 high-quality images. First image will be the cover.</p>
                                    </div>
                                    <div id="imagePreview" class="d-flex flex-wrap mt-3 gap-2">
                                        <!-- Image previews will be injected here via JS -->
                                    </div>
                                </div>
                            </div>

                            <div class="alert alert-info border-0 rounded-4 mt-5">
                                <div class="d-flex">
                                    <i class="bi bi-info-circle-fill text-primary fs-4 me-3"></i>
                                    <div>
                                        <h6 class="fw-bold text-dark">Admin Verification Required</h6>
                                        <p class="small text-muted mb-0">Once submitted, your listing will be reviewed by our administration team before becoming visible to the public. This usually takes less than 24 hours.</p>
                                    </div>
                                </div>
                            </div>

                            <div class="mt-5 text-end">
                                <a href="<c:url value='/'/>" class="btn btn-light fw-bold px-4 me-2">Cancel</a>
                                <button type="submit" class="btn btn-primary btn-lg fw-bold px-5">Submit Listing Request</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="fragments/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/js/script.js'/>"></script>
</body>
</html>
