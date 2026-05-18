<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Buy Cars - AutoMart</title>
    <!-- Bootstrap 5 CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.1/font/bootstrap-icons.css">
    <link href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600;700&family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="<c:url value='/css/style.css'/>">
</head>
<body class="d-flex flex-column min-vh-100 bg-light">

    <jsp:include page="fragments/navbar.jsp" />

    <main class="flex-grow-1">
        <!-- Page Header -->
        <div class="bg-dark text-white py-5 mb-5" style="background: linear-gradient(rgba(11, 18, 32, 0.8), rgba(11, 18, 32, 0.8)), url('https://images.unsplash.com/photo-1542282088-72c9c27ed0cd?q=80&w=1920&auto=format&fit=crop') center/cover;">
            <div class="container py-4">
                <h1 class="display-5 fw-bold mb-3 font-montserrat">Premium Cars For Sale</h1>
                <p class="lead mb-0 text-white-50">Browse our collection of verified, premium second-hand vehicles.</p>
                <nav aria-label="breadcrumb" class="mt-4">
                    <ol class="breadcrumb mb-0">
                        <li class="breadcrumb-item"><a href="/" class="text-white text-decoration-none">Home</a></li>
                        <li class="breadcrumb-item active text-primary" aria-current="page">Buy Cars</li>
                    </ol>
                </nav>
            </div>
        </div>

        <div class="container mb-5">
            <div class="row g-4">
                <!-- Mobile Filter Toggle -->
                <div class="col-12 d-lg-none mb-3">
                    <button class="btn btn-outline-dark w-100 d-flex justify-content-between align-items-center" type="button" data-bs-toggle="collapse" data-bs-target="#filterSidebarCollapse">
                        <span><i class="bi bi-funnel me-2"></i> Show Filters</span>
                        <i class="bi bi-chevron-down"></i>
                    </button>
                </div>

                <!-- Filter Sidebar -->
                <div class="col-lg-3">
                    <div class="collapse d-lg-block" id="filterSidebarCollapse">
                        <div class="glass-card bg-white p-4 sticky-lg-top" style="top: 100px; z-index: 10;">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <h5 class="fw-bold mb-0">Filters</h5>
                                <a href="#" class="text-muted small text-decoration-none hover-primary">Clear all</a>
                            </div>

                            <form action="<c:url value='/cars'/>" method="get">
                                <!-- Search Keyword -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted">Keyword</label>
                                    <input type="text" class="form-control bg-light border-0" placeholder="e.g. AMG, M Sport...">
                                </div>

                                <!-- Make/Model -->
                                <div class="mb-4 text-start">
                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted">Make</label>
                                    <select class="form-select bg-light border-0 mb-3" name="make">
                                        <option value="">Any Make</option>
                                        <option value="Aston Martin">Aston Martin</option>
                                        <option value="Audi">Audi</option>
                                        <option value="BMW">BMW</option>
                                        <option value="Ferrari">Ferrari</option>
                                        <option value="Mercedes">Mercedes-Benz</option>
                                        <option value="Porsche">Porsche</option>
                                    </select>

                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted">Model</label>
                                    <select class="form-select bg-light border-0" name="model">
                                        <option value="">Any Model</option>
                                    </select>
                                </div>

                                <!-- Price Range -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted">Price Range</label>
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <input type="number" class="form-control bg-light border-0" placeholder="Min LKR">
                                        </div>
                                        <div class="col-6">
                                            <input type="number" class="form-control bg-light border-0" placeholder="Max LKR">
                                        </div>
                                    </div>
                                </div>

                                <!-- Year -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted">Year</label>
                                    <div class="row g-2">
                                        <div class="col-6">
                                            <select class="form-select bg-light border-0">
                                                <option value="">Min</option>
                                                <option value="2015">2015</option>
                                            </select>
                                        </div>
                                        <div class="col-6">
                                            <select class="form-select bg-light border-0">
                                                <option value="">Max</option>
                                                <option value="2024">2024</option>
                                            </select>
                                        </div>
                                    </div>
                                </div>
                                
                                <!-- Mileage -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted">Max Mileage</label>
                                    <select class="form-select bg-light border-0">
                                        <option value="">Any Mileage</option>
                                        <option value="10000">Up to 10,000</option>
                                        <option value="30000">Up to 30,000</option>
                                        <option value="50000">Up to 50,000</option>
                                    </select>
                                </div>

                                <!-- Transmission -->
                                <div class="mb-4">
                                    <label class="form-label fw-semibold small text-uppercase tracking-wider text-muted mb-3">Transmission</label>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="checkbox" value="Automatic" id="transAuto">
                                        <label class="form-check-label" for="transAuto">Automatic</label>
                                    </div>
                                    <div class="form-check mb-2">
                                        <input class="form-check-input" type="checkbox" value="Manual" id="transManual">
                                        <label class="form-check-label" for="transManual">Manual</label>
                                    </div>
                                </div>

                                <button type="submit" class="btn btn-primary w-100 fw-bold">Apply Filters</button>
                            </form>
                        </div>
                    </div>
                </div>

                <!-- Cars List -->
                <div class="col-lg-9">
                    <!-- Sorting & Results -->
                    <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center mb-4 pb-3 border-bottom">
                        <p class="mb-3 mb-md-0 fw-semibold text-muted">Showing <span class="text-dark">1-9</span> of <span class="text-dark">42</span> Vehicles</p>
                        <div class="d-flex align-items-center">
                            <label class="me-2 text-muted fw-semibold small text-nowrap">Sort By:</label>
                            <select class="form-select form-select-sm bg-white border-light shadow-sm" style="width: auto;">
                                <option value="newest">Newest Arrivals</option>
                                <option value="price_low">Price: Low to High</option>
                                <option value="price_high">Price: High to Low</option>
                                <option value="mileage">Lowest Mileage</option>
                            </select>
                        </div>
                    </div>

                    <!-- Car Grid -->
                    <div class="row g-4">
                        <!-- Car Item -->
                        <div class="col-md-6 col-xl-4">
                            <div class="glass-card car-card h-100 d-flex flex-column rounded-4 bg-white border-0 shadow-sm">
                                <a href="<c:url value='/car-details'/>" class="text-decoration-none">
                                    <div class="car-image-wrapper position-relative rounded-top-4">
                                        <img src="https://images.unsplash.com/photo-1549314441-2a91216503c8?q=80&w=600&auto=format&fit=crop" alt="Mercedes AMG" class="w-100 object-fit-cover" style="height: 200px;">
                                        <span class="badge-new">NEW ARRIVAL</span>
                                    </div>
                                    <div class="p-4 d-flex flex-column flex-grow-1">
                                        <h5 class="fw-bold text-dark mb-1">Mercedes-Benz AMG GT</h5>
                                        <p class="text-muted small mb-3 flex-grow-1 line-clamp-2">Immaculate condition premium sport coupe with full service history and carbon interior.</p>
                                        
                                        <h4 class="fw-bold text-dark mb-4">LKR 115,000</h4>
                                        
                                        <div class="row g-2 text-muted small border-top pt-3">
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-calendar-event me-2 text-primary"></i> 2020
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-speedometer2 me-2 text-primary"></i> 12,300 km
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-fuel-pump me-2 text-primary"></i> Petrol
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-gear me-2 text-primary"></i> Auto
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <!-- Car Item -->
                        <div class="col-md-6 col-xl-4">
                            <div class="glass-card car-card h-100 d-flex flex-column rounded-4 bg-white border-0 shadow-sm">
                                <a href="<c:url value='/car-details'/>" class="text-decoration-none">
                                    <div class="car-image-wrapper position-relative rounded-top-4">
                                        <img src="https://images.unsplash.com/photo-1503376713282-3580435c246f?q=80&w=600&auto=format&fit=crop" alt="Aston Martin" class="w-100 object-fit-cover" style="height: 200px;">
                                    </div>
                                    <div class="p-4 d-flex flex-column flex-grow-1">
                                        <h5 class="fw-bold text-dark mb-1">Aston Martin Vantage</h5>
                                        <p class="text-muted small mb-3 flex-grow-1 line-clamp-2">Pristine grey exterior with striking red leather interior. Extended warranty available.</p>
                                        
                                        <h4 class="fw-bold text-dark mb-4">LKR 89,500</h4>
                                        
                                        <div class="row g-2 text-muted small border-top pt-3">
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-calendar-event me-2 text-primary"></i> 2019
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-speedometer2 me-2 text-primary"></i> 22,000 km
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-fuel-pump me-2 text-primary"></i> Petrol
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-gear me-2 text-primary"></i> Auto
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <!-- Car Item -->
                        <div class="col-md-6 col-xl-4">
                            <div class="glass-card car-card h-100 d-flex flex-column rounded-4 bg-white border-0 shadow-sm">
                                <a href="<c:url value='/car-details'/>" class="text-decoration-none">
                                    <div class="car-image-wrapper position-relative rounded-top-4">
                                        <img src="https://images.unsplash.com/photo-1580273916550-e323be2ae537?q=80&w=600&auto=format&fit=crop" alt="BMW M4" class="w-100 object-fit-cover" style="height: 200px;">
                                    </div>
                                    <div class="p-4 d-flex flex-column flex-grow-1">
                                        <h5 class="fw-bold text-dark mb-1">BMW M4 Competition</h5>
                                        <p class="text-muted small mb-3 flex-grow-1 line-clamp-2">Aggressive styling and unmatched performance. Fully inspected and approved.</p>
                                        
                                        <h4 class="fw-bold text-dark mb-4">LKR 65,000</h4>
                                        
                                        <div class="row g-2 text-muted small border-top pt-3">
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-calendar-event me-2 text-primary"></i> 2022
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-speedometer2 me-2 text-primary"></i> 8,500 km
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-fuel-pump me-2 text-primary"></i> Petrol
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-gear me-2 text-primary"></i> Auto
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <!-- Car Item -->
                        <div class="col-md-6 col-xl-4">
                            <div class="glass-card car-card h-100 d-flex flex-column rounded-4 bg-white border-0 shadow-sm">
                                <a href="<c:url value='/car-details'/>" class="text-decoration-none">
                                    <div class="car-image-wrapper position-relative rounded-top-4">
                                        <img src="https://images.unsplash.com/photo-1614162692292-7ac56d7f7f1e?q=80&w=600&auto=format&fit=crop" alt="Porsche 911" class="w-100 object-fit-cover" style="height: 200px;">
                                    </div>
                                    <div class="p-4 d-flex flex-column flex-grow-1">
                                        <h5 class="fw-bold text-dark mb-1">Porsche 911 Carrera S</h5>
                                        <p class="text-muted small mb-3 flex-grow-1 line-clamp-2">Classic lines with modern performance. Sports exhaust and Chrono package.</p>
                                        
                                        <h4 class="fw-bold text-dark mb-4">LKR 98,750</h4>
                                        
                                        <div class="row g-2 text-muted small border-top pt-3">
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-calendar-event me-2 text-primary"></i> 2021
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-speedometer2 me-2 text-primary"></i> 14,200 km
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-fuel-pump me-2 text-primary"></i> Petrol
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-gear me-2 text-primary"></i> Auto PDK
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>
                        
                        <!-- Car Item -->
                        <div class="col-md-6 col-xl-4">
                            <div class="glass-card car-card h-100 d-flex flex-column rounded-4 bg-white border-0 shadow-sm">
                                <a href="<c:url value='/car-details'/>" class="text-decoration-none">
                                    <div class="car-image-wrapper position-relative rounded-top-4">
                                        <img src="https://images.unsplash.com/photo-1605559424843-9e4c228bf1c2?q=80&w=600&auto=format&fit=crop" alt="Mercedes G Wagon" class="w-100 object-fit-cover" style="height: 200px;">
                                    </div>
                                    <div class="p-4 d-flex flex-column flex-grow-1">
                                        <h5 class="fw-bold text-dark mb-1">Mercedes-Benz G63 AMG</h5>
                                        <p class="text-muted small mb-3 flex-grow-1 line-clamp-2">Ultimate luxury SUV in Obsidian Black. Exclusive Nappa leather styling.</p>
                                        
                                        <h4 class="fw-bold text-dark mb-4">LKR 155,000</h4>
                                        
                                        <div class="row g-2 text-muted small border-top pt-3">
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-calendar-event me-2 text-primary"></i> 2023
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-speedometer2 me-2 text-primary"></i> 5,100 km
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-fuel-pump me-2 text-primary"></i> Petrol
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-gear me-2 text-primary"></i> Auto
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                        <!-- Car Item -->
                        <div class="col-md-6 col-xl-4">
                            <div class="glass-card car-card h-100 d-flex flex-column rounded-4 bg-white border-0 shadow-sm">
                                <a href="<c:url value='/car-details'/>" class="text-decoration-none">
                                    <div class="car-image-wrapper position-relative rounded-top-4">
                                        <img src="https://images.unsplash.com/photo-1542362567-b07e54358753?q=80&w=600&auto=format&fit=crop" alt="Maserati" class="w-100 object-fit-cover" style="height: 200px;">
                                    </div>
                                    <div class="p-4 d-flex flex-column flex-grow-1">
                                        <h5 class="fw-bold text-dark mb-1">Maserati Quattroporte</h5>
                                        <p class="text-muted small mb-3 flex-grow-1 line-clamp-2">Italian luxury saloon. Ferrari built V8 engine with breathtaking exhaust note.</p>
                                        
                                        <h4 class="fw-bold text-dark mb-4">LKR 45,995</h4>
                                        
                                        <div class="row g-2 text-muted small border-top pt-3">
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-calendar-event me-2 text-primary"></i> 2018
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-speedometer2 me-2 text-primary"></i> 34,000 km
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-fuel-pump me-2 text-primary"></i> Petrol
                                            </div>
                                            <div class="col-6 d-flex align-items-center">
                                                <i class="bi bi-gear me-2 text-primary"></i> Auto
                                            </div>
                                        </div>
                                    </div>
                                </a>
                            </div>
                        </div>

                    </div>

                    <!-- Pagination -->
                    <nav aria-label="Page navigation" class="mt-5">
                        <ul class="pagination justify-content-center">
                            <li class="page-item disabled">
                                <a class="page-link border-0 text-muted" href="#" tabindex="-1" aria-disabled="true">Previous</a>
                            </li>
                            <li class="page-item"><a class="page-link bg-primary text-white border-primary" href="#">1</a></li>
                            <li class="page-item"><a class="page-link text-dark border-0 hover-primary" href="#">2</a></li>
                            <li class="page-item"><a class="page-link text-dark border-0 hover-primary" href="#">3</a></li>
                            <li class="page-item"><span class="page-link border-0 text-muted">...</span></li>
                            <li class="page-item"><a class="page-link text-dark border-0 hover-primary" href="#">7</a></li>
                            <li class="page-item">
                                <a class="page-link border-0 text-dark hover-primary fw-semibold" href="#">Next</a>
                            </li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </main>

    <jsp:include page="fragments/footer.jsp" />

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
    <script src="<c:url value='/js/script.js'/>"></script>
</body>
</html>
