<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<nav class="navbar navbar-expand-lg bg-light sticky-top py-3 border-bottom shadow-sm">
    <div class="container">
        <a class="navbar-brand" href="${pageContext.request.contextPath}/transactions">
            Auto<span>Mart</span> | Transactions
        </a>
        <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
            <span class="navbar-toggler-icon"></span>
        </button>
        
        <div class="collapse navbar-collapse" id="navbarNav">
            <ul class="navbar-nav mx-auto mb-2 mb-lg-0 gap-3">
                <li class="nav-item">
                    <a class="nav-link ${currentUri == '/transactions' ? 'active border-bottom border-primary border-2 pb-1' : ''}" href="${pageContext.request.contextPath}/transactions">View Transactions</a>
                </li>
            </ul>

            <div class="d-flex align-items-center">
                <div class="dropdown">
                    <button class="btn btn-outline-dark dropdown-toggle fw-semibold d-flex align-items-center gap-2 rounded-pill bg-white" type="button" id="userMenu" data-bs-toggle="dropdown" aria-expanded="false">
                        <i class="bi bi-person-circle fs-5"></i>
                        <span>Transaction Management</span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-end shadow" aria-labelledby="userMenu">
                        <li>
                            <a class="dropdown-item fw-medium" href="${pageContext.request.contextPath}/transactions">
                                <i class="bi bi-receipt me-2 text-warning"></i> Transactions
                            </a>
                        </li>
                        <li><hr class="dropdown-divider"></li>
                        <li>
                            <a class="dropdown-item text-danger fw-semibold" href="#">
                                <i class="bi bi-shield-lock me-2"></i> Secured Module
                            </a>
                        </li>
                    </ul>
                </div>
            </div>
        </div>
    </div>
</nav>
