<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<nav class="navbar navbar-expand-lg bg-light sticky-top py-3 border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/">
            Auto<span>Mart</span>
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 gap-3">
                <li class="nav-item">
                    <a class="nav-link ${currentUri == '/' ? 'active border-bottom border-primary border-2 pb-1' : ''}" href="${pageContext.request.contextPath}/">Home</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${currentUri == '/cars' ? 'active border-bottom border-primary border-2 pb-1' : ''}" href="${pageContext.request.contextPath}/cars">Buy Cars</a>
                </li>
                <li class="nav-item">
                    <a class="nav-link ${currentUri == '/sell-car' ? 'active border-bottom border-primary border-2 pb-1' : ''}" href="${pageContext.request.contextPath}/add-car">Sell Car</a>
                </li>

                <li class="nav-item">
                    <a class="nav-link ${currentUri == '/reviews' ? 'active border-bottom border-primary border-2 pb-1' : ''}" href="${pageContext.request.contextPath}/reviews">Reviews</a>
                </li>
            </ul>

            <div class="d-flex align-items-center">
                <c:choose>
                    <c:when test="${empty sessionScope.user}">
                        <a href="${pageContext.request.contextPath}/login" class="btn btn-outline-dark rounded-pill me-3 px-4 fw-medium bg-white">Login</a>
                        <a href="${pageContext.request.contextPath}/register" class="btn btn-primary rounded-pill px-4 fw-medium text-white">Register</a>
                    </c:when>
                    <c:otherwise>
                        <div class="dropdown">
                            <button class="btn btn-outline-dark dropdown-toggle fw-semibold d-flex align-items-center gap-2 rounded-pill bg-white" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                                <i class="bi bi-person-circle fs-5"></i>
                                <span>${sessionScope.fullName}</span>
                            </button>
                            <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userMenu">
                                <li>
                                    <a class="dropdown-item fw-medium" href="${pageContext.request.contextPath}/dashboard">
                                        <i class="bi bi-speedometer2 me-2 text-danger"></i> Dashboard
                                    </a>
                                </li>
                                <c:if test="${sessionScope.role == 'Seller' || sessionScope.role == 'Dealer' || sessionScope.role == 'Admin'}">
                                    <li>
                                        <a class="dropdown-item fw-medium" href="${pageContext.request.contextPath}/my-listings">
                                            <i class="bi bi-car-front me-2 text-primary"></i> My Listings
                                        </a>
                                    </li>
                                    <li>
                                        <a class="dropdown-item fw-medium" href="${pageContext.request.contextPath}/add-car">
                                            <i class="bi bi-plus-circle me-2 text-success"></i> List a Vehicle
                                        </a>
                                    </li>
                                </c:if>
                                <li>
                                    <a class="dropdown-item fw-medium" href="${pageContext.request.contextPath}/transactions">
                                        <i class="bi bi-receipt me-2 text-warning"></i> Transactions
                                    </a>
                                </li>
                                <li><hr class="dropdown-divider"></li>
                                <li>
                                    <a class="dropdown-item text-danger fw-semibold" href="${pageContext.request.contextPath}/logout">
                                        <i class="bi bi-box-arrow-right me-2"></i> Sign Out
                                    </a>
                                </li>
                            </ul>
                        </div>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </div>
</nav>
