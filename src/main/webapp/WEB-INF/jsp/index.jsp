<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="AutoMart - Premium Second-Hand Vehicle Platform" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
    <style>
        body { background-color: #f8fafc; }
        .hero-section {
            background-color: #f8fafc;
            position: relative;
            z-index: 1;
        }
        .hero-img-container {
            position: relative;
            border-radius: 1rem;
            overflow: hidden;
            box-shadow: 0 20px 40px rgba(0,0,0,0.1);
        }
        .hero-img-container img {
            width: 100%;
            display: block;
        }
        .search-glass {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 1rem;
            padding: 1.5rem;
            box-shadow: 0 10px 25px rgba(0,0,0,0.05);
            max-width: 1000px;
            margin: -60px auto 0;
            position: relative;
            z-index: 10;
        }
        .form-select, .form-control {
            background-color: #f1f5f9;
            border: none;
            color: #475569;
            font-weight: 500;
        }
        .form-select:focus, .form-control:focus {
            background-color: #e2e8f0;
            box-shadow: none;
        }
        .input-group-text {
            background-color: #f1f5f9;
            border: none;
        }
        .section-title {
            font-weight: 800;
            color: #1e293b;
            position: relative;
            padding-bottom: 0.5rem;
            display: inline-block;
        }
        .section-title::after {
            content: '';
            position: absolute;
            left: 0;
            bottom: 0;
            height: 3px;
            width: 60px;
            background-color: var(--primary-color);
        }
        .car-card {
            background: #ffffff;
            border: none;
            border-radius: 1rem;
            overflow: hidden;
            transition: all 0.3s ease;
            box-shadow: 0 4px 6px rgba(0,0,0,0.03);
            height: 100%;
            display: flex;
            flex-direction: column;
        }
        .car-card:hover {
            transform: translateY(-5px);
            box-shadow: 0 15px 30px rgba(0,0,0,0.08);
        }
        .car-img-wrapper {
            position: relative;
            height: 200px;
        }
        .car-img-wrapper img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        .badge-new {
            position: absolute;
            top: 1rem;
            right: 1rem;
            background: rgba(255,255,255,0.9);
            color: #3b82f6;
            font-size: 0.7rem;
            font-weight: 700;
            padding: 0.25rem 0.75rem;
            border-radius: 1rem;
            letter-spacing: 0.5px;
        }
        .car-title {
            font-weight: 700;
            color: #1e293b;
            font-size: 1.15rem;
            margin-bottom: 0.5rem;
        }
        .car-desc {
            color: #64748b;
            font-size: 0.85rem;
            margin-bottom: 1rem;
            display: -webkit-box;
            -webkit-line-clamp: 2;
            -webkit-box-orient: vertical;
            overflow: hidden;
        }
        .car-price-tag {
            font-weight: 800;
            color: #0f172a;
            font-size: 1.25rem;
            margin-bottom: 1.5rem;
        }
        .car-specs {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 0.75rem;
            font-size: 0.75rem;
            color: #64748b;
        }
        .car-specs i {
            margin-right: 0.25rem;
            color: #94a3b8;
        }
    </style>
</head>
<body class="d-flex flex-column h-100">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Premium Hero Showcase -->
    <section class="hero-section py-5">
        <div class="container pt-4 pb-5">
            <div class="row align-items-center">
                <div class="col-lg-5 pe-lg-5 mb-5 mb-lg-0">
                    <h1 class="display-4 fw-bolder tracking-tight text-dark mb-4" style="line-height: 1.1;">AutoMart<br>User Management<br>System</h1>
                    <p class="text-secondary fs-6 mb-4 pe-md-4" style="line-height: 1.6;">
                        Secure authentication and role-based access control for Buyers, Sellers, Dealers, and Administrators.
                    </p>
                    <div class="d-flex gap-3 mt-2">
                        <c:choose>
                            <c:when test="${empty sessionScope.user}">
                                <a href="${pageContext.request.contextPath}/login" class="btn btn-primary px-4 py-2 fw-semibold rounded-pill">Sign In</a>
                                <a href="${pageContext.request.contextPath}/register" class="btn btn-outline-secondary px-4 py-2 fw-semibold rounded-pill bg-white">Create Account</a>
                            </c:when>
                            <c:otherwise>
                                <a href="${pageContext.request.contextPath}/dashboard" class="btn btn-primary px-4 py-2 fw-semibold rounded-pill">Go to Dashboard</a>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>
                <div class="col-lg-7">
                    <div class="hero-img-container">
                        <img src="${pageContext.request.contextPath}/images/hero-supercar.png" alt="Sleek silver supercar">
                    </div>
                </div>
            </div>
        </div>
    </section>

    <!-- Main Content Area -->
    <main class="flex-shrink-0 pt-5 pb-5 mt-4">
        <div class="container pt-4">
            
            <!-- Dynamic Notifications Alert -->
            <c:if test="${not empty param.logout}">
                <div class="alert alert-success alert-auto-dismiss shadow-sm rounded-4 mb-4" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> Successfully signed out of the secure platform portal.
                </div>
            </c:if>

            <div class="row g-4 justify-content-center">
                <div class="col-md-8 text-center py-5">
                    <div class="p-5 bg-white rounded-4 shadow-sm border">
                        <i class="bi bi-shield-check text-primary display-1 mb-3 d-block"></i>
                        <h4 class="fw-bold text-dark">Robust User Management</h4>
                        <p class="text-slate-500 max-w-md mx-auto">
                            The AutoMart project has been cleaned to focus exclusively on core User Management features including registration, login, and secure session handling.
                        </p>
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
