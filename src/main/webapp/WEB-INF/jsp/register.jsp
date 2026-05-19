<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Create Authentication Profile | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Registration Hub Interface -->
    <main class="flex-shrink-0 py-5 my-auto">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-7 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-lg overflow-hidden bg-white">
                        
                        <!-- Header Banner -->
                        <div class="p-4 bg-secondary text-white text-center position-relative">
                            <span class="badge bg-danger mb-2 px-3 py-1 text-uppercase tracking-widest rounded-pill fs-8">Sign Up</span>
                            <h3 class="fw-bolder mb-0 text-white">Create an Account</h3>
                            <p class="text-slate-300 fs-7 mb-0 mt-1">Join AutoMart to buy and sell quality second-hand vehicles</p>
                        </div>

                        <div class="p-4 p-sm-5 bg-white">
                            
                            <!-- Status Feedback Displays -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger d-flex align-items-center rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                    <i class="bi bi-x-circle-fill me-2 text-danger"></i>
                                    <div>${errorMessage}</div>
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/register" method="post" class="row g-3">
                                
                                <div class="col-md-6">
                                    <label for="fullName" class="form-label fw-semibold text-secondary fs-7 mb-1">Full Name</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-person text-slate-400"></i></span>
                                        <input type="text" class="form-control bg-light border-start-0 py-2" id="fullName" name="fullName" placeholder="Ajith Perera" required autofocus>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="email" class="form-label fw-semibold text-secondary fs-7 mb-1">Email Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-envelope text-slate-400"></i></span>
                                        <input type="email" class="form-control bg-light border-start-0 py-2" id="email" name="email" placeholder="name@automart.com" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="password" class="form-label fw-semibold text-secondary fs-7 mb-1">Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-shield-lock text-slate-400"></i></span>
                                        <input type="password" class="form-control bg-light border-start-0 py-2" id="password" name="password" placeholder="••••••••" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="confirmPassword" class="form-label fw-semibold text-secondary fs-7 mb-1">Confirm Password</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-shield-check text-slate-400"></i></span>
                                        <input type="password" class="form-control bg-light border-start-0 py-2" id="confirmPassword" name="confirmPassword" placeholder="••••••••" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="phone" class="form-label fw-semibold text-secondary fs-7 mb-1">Phone Number</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-telephone text-slate-400"></i></span>
                                        <input type="text" class="form-control bg-light border-start-0 py-2" id="phone" name="phone" placeholder="0771234567" required>
                                    </div>
                                </div>

                                <div class="col-md-6">
                                    <label for="role" class="form-label fw-semibold text-secondary fs-7 mb-1">Account Type</label>
                                    <select class="form-select bg-light py-2" id="role" name="role" required>
                                        <option value="Buyer">I want to buy cars (Buyer)</option>
                                        <option value="Seller">I want to sell my car (Private Seller)</option>
                                        <option value="Dealer">I am a car dealer (Dealership)</option>
                                        <option value="Admin">Administrator</option>
                                    </select>
                                    <div class="form-text fs-8 text-slate-400">
                                        Dealer profiles default to PENDING status pending admin verification checks.
                                    </div>
                                </div>

                                <div class="col-12">
                                    <label for="address" class="form-label fw-semibold text-secondary fs-7 mb-1">Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-geo-alt text-slate-400"></i></span>
                                        <input type="text" class="form-control bg-light border-start-0 py-2" id="address" name="address" placeholder="Colombo" required>
                                    </div>
                                </div>

                                <div class="col-12 mt-4">
                                    <button type="submit" class="btn btn-primary-custom w-100 py-3 rounded-3 fw-bold fs-6">
                                        <i class="bi bi-person-plus-fill me-2"></i> Create Account
                                    </button>
                                </div>

                            </form>

                            <!-- Trust Info -->
                            <div class="mt-4 pt-3 border-top text-center">
                                <p class="text-slate-400 fs-8 mb-0">
                                    Your personal information is stored securely.
                                </p>
                            </div>

                        </div>

                        <!-- Footer Links -->
                        <div class="p-3 bg-light border-top text-center">
                            <span class="text-slate-500 fs-7">Already have an account?</span>
                            <a href="${pageContext.request.contextPath}/login" class="text-danger fw-bold fs-7 text-decoration-none ms-1">Sign In</a>
                        </div>

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
