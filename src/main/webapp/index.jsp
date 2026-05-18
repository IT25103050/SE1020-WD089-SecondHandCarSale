<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="AutoMart - Premium Second-Hand Vehicle Platform" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
    <style>
        /* ===== HERO SECTION - Simple, bulletproof styles ===== */
        .hero-section {
            background: linear-gradient(135deg, #0f172a 0%, #1e293b 100%);
            padding: 5rem 0 4rem;
            position: relative;
        }

        .hero-search-box {
            background: rgba(255, 255, 255, 0.08);
            border: 1px solid rgba(255, 255, 255, 0.15);
            border-radius: 20px;
            padding: 1.75rem 2rem;
            margin-top: 3rem;
        }

        .hero-search-box .form-select {
            background-color: rgba(255, 255, 255, 0.12) !important;
            border: 1px solid rgba(255, 255, 255, 0.2) !important;
            color: #ffffff !important;
            border-radius: 12px;
        }

        .hero-search-box .form-select:focus,
        .hero-search-box .form-select:active {
            background-color: rgba(255, 255, 255, 0.18) !important;
            border-color: rgba(255, 255, 255, 0.4) !important;
            color: #ffffff !important;
            box-shadow: 0 0 0 3px rgba(59, 130, 246, 0.25) !important;
        }

        .hero-search-box .form-select option {
            background: #1e293b;
            color: #ffffff;
        }

        .hero-search-box label {
            color: rgba(255, 255, 255, 0.6) !important;
        }

        .search-glass {
            background: rgba(255, 255, 255, 0.85);
            backdrop-filter: blur(20px);
            border: 1px solid rgba(255, 255, 255, 0.5);
            border-radius: 24px;
            padding: 2.25rem;
            box-shadow: 0 20px 40px -15px rgba(15, 23, 42, 0.12);
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .search-glass:hover {
            box-shadow: 0 25px 45px -10px rgba(15, 23, 42, 0.18);
        }

        .form-select, .form-control {
            background-color: #f8fafc;
            border: 1px solid #e2e8f0;
            border-radius: 12px;
            padding: 0.75rem 1rem;
            font-size: 0.9rem;
            font-weight: 500;
            color: #334155;
            transition: all 0.3s ease;
        }

        .form-select:focus, .form-control:focus {
            background-color: #ffffff;
            border-color: #3b82f6;
            box-shadow: 0 0 0 4px rgba(59, 130, 246, 0.1);
        }

        .search-btn {
            background: linear-gradient(135deg, #3b82f6 0%, #2563eb 100%);
            border: none;
            border-radius: 12px;
            padding: 0.75rem 2rem;
            font-weight: 600;
            transition: all 0.3s ease;
        }

        .search-btn:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(59, 130, 246, 0.4);
        }

        /* Brand Filters */
        .brand-pill {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 50px;
            padding: 0.6rem 1.5rem;
            font-weight: 600;
            font-size: 0.85rem;
            color: #475569;
            cursor: pointer;
            transition: all 0.3s cubic-bezier(0.4, 0, 0.2, 1);
            display: inline-flex;
            align-items: center;
            gap: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.02);
        }

        .brand-pill:hover, .brand-pill.active {
            background: #0f172a;
            border-color: #0f172a;
            color: #ffffff;
            transform: translateY(-3px);
            box-shadow: 0 10px 15px -3px rgba(15, 23, 42, 0.2);
        }

        /* Section Title Upgrade */
        .fancy-title {
            font-family: 'Outfit', sans-serif;
            font-weight: 800;
            font-size: 2.25rem;
            color: #0f172a;
            position: relative;
            margin-bottom: 2.5rem;
        }

        .fancy-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: -10px;
            width: 80px;
            height: 4px;
            background: linear-gradient(to right, #3b82f6, #6366f1);
            border-radius: 2px;
        }

        /* Interactive Statistics Section */
        .stat-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            padding: 2rem;
            text-align: center;
            transition: all 0.4s cubic-bezier(0.4, 0, 0.2, 1);
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.02);
            position: relative;
            overflow: hidden;
        }

        .stat-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.05);
            border-color: #3b82f6;
        }

        .stat-icon {
            width: 64px;
            height: 64px;
            margin: 0 auto 1.25rem;
            border-radius: 16px;
            background: rgba(59, 130, 246, 0.08);
            color: #3b82f6;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 1.75rem;
            transition: all 0.3s ease;
        }

        .stat-card:hover .stat-icon {
            background: #3b82f6;
            color: #ffffff;
            transform: scale(1.1) rotate(5deg);
        }

        /* Premium Car Card Design */
        .car-card-container {
            transition: opacity 0.4s ease, transform 0.4s ease;
        }

        .premium-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            box-shadow: 0 4px 10px rgba(0,0,0,0.02);
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            position: relative;
        }

        .premium-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 30px 45px -15px rgba(15, 23, 42, 0.12);
            border-color: rgba(59, 130, 246, 0.2);
        }

        .card-img-container {
            position: relative;
            height: 220px;
            overflow: hidden;
        }

        .card-img-container img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .premium-card:hover .card-img-container img {
            transform: scale(1.08);
        }

        .card-badge-status {
            position: absolute;
            top: 1rem;
            left: 1rem;
            background: rgba(15, 23, 42, 0.8);
            backdrop-filter: blur(8px);
            color: #ffffff;
            font-size: 0.75rem;
            font-weight: 600;
            padding: 0.35rem 0.85rem;
            border-radius: 30px;
        }

        .card-heart-btn {
            position: absolute;
            top: 1rem;
            right: 1rem;
            width: 36px;
            height: 36px;
            border-radius: 50%;
            background: rgba(255, 255, 255, 0.9);
            backdrop-filter: blur(8px);
            display: flex;
            align-items: center;
            justify-content: center;
            cursor: pointer;
            border: none;
            color: #64748b;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.1);
        }

        .card-heart-btn:hover {
            transform: scale(1.1);
            color: #ef4444;
        }

        .card-heart-btn.active {
            background: #ef4444;
            color: #ffffff;
        }

        .card-price-overlay {
            position: absolute;
            bottom: 1rem;
            right: 1rem;
            background: #ffffff;
            color: #0f172a;
            font-weight: 800;
            font-size: 1.1rem;
            padding: 0.4rem 1rem;
            border-radius: 12px;
            box-shadow: 0 8px 16px rgba(0,0,0,0.1);
        }

        .premium-card-body {
            padding: 1.5rem;
            flex-grow: 1;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .tag-row {
            display: flex;
            gap: 6px;
            flex-wrap: wrap;
            margin-bottom: 0.75rem;
        }

        .tag-badge {
            background: #f1f5f9;
            color: #475569;
            font-size: 0.7rem;
            font-weight: 600;
            padding: 0.25rem 0.6rem;
            border-radius: 6px;
        }

        .car-info-specs {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 10px;
            border-top: 1px solid #f1f5f9;
            padding-top: 1rem;
            margin-top: auto;
        }

        .spec-item {
            text-align: center;
        }

        .spec-icon {
            font-size: 1rem;
            color: #94a3b8;
            margin-bottom: 0.25rem;
            display: block;
        }

        .spec-text {
            font-size: 0.7rem;
            color: #64748b;
            font-weight: 500;
        }

        /* Call-To-Action Banner */
        .cta-banner {
            background: linear-gradient(135deg, #1e3a8a 0%, #0f172a 100%);
            border-radius: 28px;
            padding: 4rem 3rem;
            color: #ffffff;
            position: relative;
            overflow: hidden;
            box-shadow: 0 30px 60px -15px rgba(15, 23, 42, 0.3);
        }

        .cta-banner::before {
            content: '';
            position: absolute;
            top: -20%;
            right: -10%;
            width: 300px;
            height: 300px;
            background: radial-gradient(circle, rgba(59, 130, 246, 0.2) 0%, rgba(59, 130, 246, 0) 70%);
            filter: blur(40px);
            pointer-events: none;
        }
    </style>
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Premium Hero Section (search form embedded inside — no overlap possible) -->
    <section class="hero-section">
        <div class="container">

            <!-- Hero Content Row -->
            <div class="row align-items-center g-5 mb-5">
                <div class="col-lg-6">
                    <div class="d-inline-flex align-items-center gap-2 mb-4 px-3 py-2 rounded-pill" style="background:rgba(255,255,255,0.08); border:1px solid rgba(255,255,255,0.15); font-size:0.8rem; letter-spacing:2px; text-transform:uppercase; color:#f1f5f9;">
                        <i class="bi bi-stars" style="color:#facc15;"></i> Premium Automotive Hub
                    </div>
                    <h1 class="mb-4" style="font-family:'Outfit',sans-serif; font-weight:800; font-size:3.2rem; line-height:1.15; color:#ffffff !important;">
                        Discover Your Next <span style="color:#3b82f6 !important;">Perfect Drive</span>
                    </h1>
                    <p class="fs-6 mb-4 pe-lg-5" style="color:#cbd5e1 !important; line-height:1.7;">
                        Explore verified premium used vehicles from certified dealers and trusted sellers.
                        Buy with absolute transparency and sell your vehicle effortlessly.
                    </p>
                    <div class="d-flex flex-wrap gap-3 mb-4">
                        <a href="${pageContext.request.contextPath}/cars" class="btn btn-primary px-4 py-3 rounded-3 fw-bold">
                            <i class="bi bi-search me-2"></i> Explore Showcase
                        </a>
                        <a href="${pageContext.request.contextPath}/add-car" class="btn px-4 py-3 rounded-3 fw-semibold" style="background:rgba(255,255,255,0.08); border:1px solid rgba(255,255,255,0.25); color:#ffffff;">
                            <i class="bi bi-tag me-1"></i> List Your Vehicle
                        </a>
                    </div>
                    <p class="mb-0" style="color:rgba(255,255,255,0.45); font-size:0.72rem; font-weight:700; letter-spacing:0.05em; text-transform:uppercase;">
                        <i class="bi bi-shield-fill-check me-1" style="color:#22c55e;"></i>
                        All listed vehicles undergo rigorous multi-point verification by certified technicians.
                    </p>
                </div>
                <div class="col-lg-6">
                    <img src="https://images.unsplash.com/photo-1617788138017-80ad40651399?auto=format&fit=crop&w=800&q=80"
                         alt="Luxury grey sports car" class="img-fluid" style="border-radius:20px; box-shadow:0 20px 40px rgba(0,0,0,0.4);">
                </div>
            </div>

            <!-- Search Form Row — inside hero, below content, guaranteed no overlap -->
            <div class="row">
                <div class="col-12">
                    <div class="hero-search-box">
                        <p class="text-white text-opacity-50 fw-bold text-uppercase fs-8 tracking-wider mb-3">
                            <i class="bi bi-funnel-fill me-1"></i> Quick Vehicle Search
                        </p>
                        <form action="${pageContext.request.contextPath}/cars" method="get" class="row g-3 align-items-end">
                            <div class="col-md-3">
                                <label for="brandSelect" class="form-label fw-bold fs-8 text-uppercase tracking-wider mb-2">
                                    <i class="bi bi-tag-fill me-1"></i> Brand
                                </label>
                                <select class="form-select py-3" id="brandSelect" name="brand">
                                    <option value="">All Brands</option>
                                    <option value="Toyota">Toyota</option>
                                    <option value="Nissan">Nissan</option>
                                    <option value="Honda">Honda</option>
                                    <option value="Mercedes-Benz">Mercedes-Benz</option>
                                    <option value="BMW">BMW</option>
                                    <option value="Suzuki">Suzuki</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="typeSelect" class="form-label fw-bold fs-8 text-uppercase tracking-wider mb-2">
                                    <i class="bi bi-fuel-pump-fill me-1"></i> Fuel Type
                                </label>
                                <select class="form-select py-3" id="typeSelect" name="fuelType">
                                    <option value="">Any Fuel Type</option>
                                    <option value="Petrol">Petrol</option>
                                    <option value="Diesel">Diesel</option>
                                    <option value="Hybrid">Hybrid</option>
                                    <option value="Electric">Electric</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <label for="transmissionSelect" class="form-label fw-bold fs-8 text-uppercase tracking-wider mb-2">
                                    <i class="bi bi-gear-wide-connected me-1"></i> Transmission
                                </label>
                                <select class="form-select py-3" id="transmissionSelect" name="transmission">
                                    <option value="">Any Transmission</option>
                                    <option value="Automatic">Automatic</option>
                                    <option value="Manual">Manual</option>
                                </select>
                            </div>
                            <div class="col-md-3">
                                <button type="submit" class="btn btn-primary search-btn w-100 py-3 text-white fw-bold fs-6 rounded-3">
                                    <i class="bi bi-search me-2"></i> Find Match
                                </button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>

        </div>
    </section>

    <!-- Main Content Base -->
    <main class="flex-shrink-0 pt-5 pb-5">
        <div class="container pt-4">

            <!-- Interactive Brand Filter Pills -->
            <div class="mb-5 text-center">
                <span class="text-slate-400 fs-8 fw-bold text-uppercase tracking-wider d-block mb-3">Quick Brand Finder</span>
                <div class="d-flex flex-wrap justify-content-center gap-2" id="brandPillContainer">
                    <div class="brand-pill active" data-brand="ALL">
                        <i class="bi bi-grid-fill"></i> All Cars
                    </div>
                    <div class="brand-pill" data-brand="Toyota">Toyota</div>
                    <div class="brand-pill" data-brand="Nissan">Nissan</div>
                    <div class="brand-pill" data-brand="Honda">Honda</div>
                    <div class="brand-pill" data-brand="Mercedes-Benz">Mercedes</div>
                    <div class="brand-pill" data-brand="BMW">BMW</div>
                    <div class="brand-pill" data-brand="Suzuki">Suzuki</div>
                </div>
            </div>

            <!-- Featured Showcase Header -->
            <div class="d-flex justify-content-between align-items-end mb-4">
                <div>
                    <h2 class="fancy-title mb-0">Showcase Stock</h2>
                </div>
                <a href="${pageContext.request.contextPath}/cars" class="btn btn-link text-primary fw-bold text-decoration-none fs-7 hover-underline">
                    View Entire Showroom <i class="bi bi-arrow-right-short ms-1 fs-5"></i>
                </a>
            </div>

            <!-- Vehicles Showcase Cards -->
            <div class="row g-4 mb-5" id="featuredCarsGrid">
                <c:choose>
                    <c:when test="${empty featuredCars}">
                        <div class="col-12 text-center py-5">
                            <div class="p-5 bg-white rounded-4 shadow-sm border">
                                <i class="bi bi-car-front text-slate-200 display-1 mb-3 d-block"></i>
                                <h4 class="fw-bold text-secondary">No Vehicles Currently Active</h4>
                                <p class="text-slate-500 max-w-md mx-auto">
                                    Our inventory pipeline is currently awaiting authenticated verification uploads. Please check back shortly.
                                </p>
                            </div>
                        </div>
                    </c:when>
                    <c:otherwise>
                        <c:forEach var="car" items="${featuredCars}" varStatus="loop">
                            <div class="col-lg-3 col-md-6 car-card-container" data-car-brand="${car.brand}">
                                <div class="premium-card">
                                    <div class="card-img-container">
                                        <img src="${car.imagePath}" alt="${car.brand} ${car.model}">
                                        <span class="card-badge-status text-uppercase">
                                            <i class="bi bi-shield-fill-check me-1 text-success"></i> ${car.condition != null ? car.condition : 'Verified'}
                                        </span>
                                        <button class="card-heart-btn" data-car-id="${car.carId}" onclick="toggleFavorite(this)">
                                            <i class="bi bi-heart-fill"></i>
                                        </button>
                                        <div class="card-price-overlay">
                                            LKR <fmt:formatNumber value="${car.price}" pattern="#,###" />
                                        </div>
                                    </div>
                                    <div class="premium-card-body">
                                        <div>
                                            <div class="tag-row">
                                                <span class="tag-badge text-uppercase">${car.fuelType}</span>
                                                <span class="tag-badge text-uppercase">${car.transmission}</span>
                                            </div>
                                            <h4 class="car-title fs-5 fw-bold mb-1">${car.brand} ${car.model}</h4>
                                            <p class="text-slate-400 fs-8 mb-3"><i class="bi bi-geo-alt me-1"></i> Colombo Showroom</p>
                                        </div>
                                        
                                        <div class="car-info-specs">
                                            <div class="spec-item">
                                                <i class="bi bi-calendar-event spec-icon"></i>
                                                <span class="spec-text">${car.year}</span>
                                            </div>
                                            <div class="spec-item">
                                                <i class="bi bi-speedometer2 spec-icon"></i>
                                                <span class="spec-text">${car.mileage} km</span>
                                            </div>
                                            <div class="spec-item">
                                                <i class="bi bi-check-circle spec-icon text-success"></i>
                                                <span class="spec-text">Approved</span>
                                            </div>
                                        </div>

                                        <div class="pt-3 border-top mt-3">
                                            <a href="${pageContext.request.contextPath}/car-details?carId=${car.carId}" 
                                               class="btn btn-dark w-100 py-2 fs-7 fw-bold rounded-3">
                                                Explore Details
                                            </a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </c:forEach>
                    </c:otherwise>
                </c:choose>
            </div>

            <!-- Stats Showcase -->
            <div class="mb-5">
                <div class="text-center mb-5">
                    <span class="badge bg-primary bg-opacity-10 text-primary px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-2">Performance stats</span>
                    <h2 class="fw-bolder text-secondary">AutoMart In Numbers</h2>
                </div>
                <div class="row g-4">
                    <div class="col-6 col-lg-3">
                        <div class="stat-card">
                            <div class="stat-icon"><i class="bi bi-people-fill"></i></div>
                            <h2 class="fw-extrabold text-secondary mb-1 counter-val" data-target="1500">0</h2>
                            <span class="text-slate-400 fs-8 fw-semibold text-uppercase tracking-wider">Happy Drivers</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="stat-card">
                            <div class="stat-icon"><i class="bi bi-car-front-fill"></i></div>
                            <h2 class="fw-extrabold text-secondary mb-1 counter-val" data-target="420">0</h2>
                            <span class="text-slate-400 fs-8 fw-semibold text-uppercase tracking-wider">Premium Stock</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="stat-card">
                            <div class="stat-icon"><i class="bi bi-shield-fill-check"></i></div>
                            <h2 class="fw-extrabold text-secondary mb-1 counter-val" data-target="100">0</h2>
                            <span class="text-slate-400 fs-8 fw-semibold text-uppercase tracking-wider">% Safe Portal</span>
                        </div>
                    </div>
                    <div class="col-6 col-lg-3">
                        <div class="stat-card">
                            <div class="stat-icon"><i class="bi bi-award-fill"></i></div>
                            <h2 class="fw-extrabold text-secondary mb-1 counter-val" data-target="15">0</h2>
                            <span class="text-slate-400 fs-8 fw-semibold text-uppercase tracking-wider">Awards Won</span>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Premium Interactive CTA -->
            <div class="cta-banner text-center my-5">
                <div class="row justify-content-center">
                    <div class="col-lg-8">
                        <h2 class="display-6 fw-extrabold text-white mb-3">Ready to Upgrade Your Ride?</h2>
                        <p class="text-slate-300 fs-6 mb-4 pe-lg-5 ps-lg-5" style="opacity: 0.85;">
                            List your car in minutes with custom specs and high-quality images. Get matched with authenticated buyers instantly.
                        </p>
                        <a href="${pageContext.request.contextPath}/add-car" class="btn btn-primary px-5 py-3 fw-bold rounded-3 bg-white text-primary border-0 shadow-lg hover-scale">
                            <i class="bi bi-plus-circle-fill me-2"></i> Start Selling Now
                        </a>
                    </div>
                </div>
            </div>

        </div>
    </main>

    <!-- Shared Layout Footer -->
    <jsp:include page="fragments/footer.jsp" />

    <!-- Core Script Bundles -->
    <jsp:include page="fragments/layout-scripts.jsp" />

    <script>
        // Interactive JavaScript features for the home page
        document.addEventListener("DOMContentLoaded", function () {
            // Brand Pill filtering logic
            const brandPills = document.querySelectorAll(".brand-pill");
            const carCards = document.querySelectorAll(".car-card-container");

            brandPills.forEach(pill => {
                pill.addEventListener("click", function () {
                    // Update active class
                    brandPills.forEach(p => p.classList.remove("active"));
                    this.classList.add("active");

                    const selectedBrand = this.getAttribute("data-brand");

                    carCards.forEach(card => {
                        const cardBrand = card.getAttribute("data-car-brand");
                        if (selectedBrand === "ALL" || cardBrand.toLowerCase() === selectedBrand.toLowerCase()) {
                            card.style.display = "block";
                            setTimeout(() => {
                                card.style.opacity = "1";
                                card.style.transform = "scale(1)";
                            }, 50);
                        } else {
                            card.style.opacity = "0";
                            card.style.transform = "scale(0.95)";
                            setTimeout(() => {
                                card.style.display = "none";
                            }, 300);
                        }
                    });
                });
            });

            // Heart / Favorite Button logic using local storage
            window.toggleFavorite = function(btn) {
                const carId = btn.getAttribute("data-car-id");
                let favorites = JSON.parse(localStorage.getItem("favorites") || "[]");

                if (favorites.includes(carId)) {
                    favorites = favorites.filter(id => id !== carId);
                    btn.classList.remove("active");
                } else {
                    favorites.push(carId);
                    btn.classList.add("active");
                    // Micro animation
                    btn.style.transform = "scale(1.3)";
                    setTimeout(() => {
                        btn.style.transform = "";
                    }, 200);
                }
                localStorage.setItem("favorites", JSON.stringify(favorites));
            };

            // Set heart state on load
            const favorites = JSON.parse(localStorage.getItem("favorites") || "[]");
            document.querySelectorAll(".card-heart-btn").forEach(btn => {
                const carId = btn.getAttribute("data-car-id");
                if (favorites.includes(carId)) {
                    btn.classList.add("active");
                }
            });

            // Statistics Counter-Up animation when in viewport
            const counters = document.querySelectorAll(".counter-val");
            const speed = 200;

            const animateCounter = () => {
                counters.forEach(counter => {
                    const target = +counter.getAttribute("data-target");
                    let count = +counter.innerText;

                    // Lower speed value means faster incrementation
                    const increment = Math.ceil(target / speed);

                    if (count < target) {
                        counter.innerText = count + increment;
                        setTimeout(animateCounter, 10);
                    } else {
                        counter.innerText = target;
                    }
                });
            };

            // Intersection Observer to run statistics animation
            const observer = new IntersectionObserver((entries, observer) => {
                entries.forEach(entry => {
                    if (entry.isIntersecting) {
                        animateCounter();
                        observer.unobserve(entry.target);
                    }
                });
            }, { threshold: 0.5 });

            if (counters.length > 0) {
                observer.observe(counters[0].parentElement.parentElement);
            }
        });
    </script>

</body>
</html>
