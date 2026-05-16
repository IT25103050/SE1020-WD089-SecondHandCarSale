<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Member Portal Authentication | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Authentication Interface Showcase -->
    <main class="flex-shrink-0 py-5 my-auto">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-lg-5 col-md-7">
                    
                    <div class="card border-0 rounded-4 shadow-lg overflow-hidden bg-white">
                        
                        <!-- Header Banner -->
                        <div class="p-4 bg-secondary text-white text-center position-relative">
                            <span class="badge bg-danger mb-2 px-3 py-1 text-uppercase tracking-widest rounded-pill fs-8">Sign In</span>
                            <h3 class="fw-bolder mb-0 text-white">Welcome Back</h3>
                            <p class="text-slate-300 fs-7 mb-0 mt-1">Sign in to your AutoMart account</p>
                        </div>

                        <div class="p-4 p-sm-5 bg-white">
                            
                            <!-- Status Feedback Displays -->
                            <c:if test="${not empty errorMessage}">
                                <div class="alert alert-danger d-flex align-items-center rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                    <i class="bi bi-x-circle-fill me-2 text-danger"></i>
                                    <div>${errorMessage}</div>
                                </div>
                            </c:if>

                            <c:if test="${not empty successMessage}">
                                <div class="alert alert-success d-flex align-items-center rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                    <i class="bi bi-check-circle-fill me-2 text-success"></i>
                                    <div>${successMessage}</div>
                                </div>
                            </c:if>

                            <form action="${pageContext.request.contextPath}/login" method="post" class="d-flex flex-column gap-3">
                                
                                <div>
                                    <label for="email" class="form-label fw-semibold text-secondary fs-7 mb-1">Email Address</label>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-envelope text-slate-400"></i></span>
                                        <input type="email" class="form-control bg-light border-start-0 py-2" id="email" name="email" placeholder="name@automart.com" required autofocus>
                                    </div>
                                </div>

                                <div>
                                    <div class="d-flex justify-content-between align-items-center mb-1">
                                        <label for="password" class="form-label fw-semibold text-secondary fs-7 mb-0">Password</label>
                                        <a href="#" class="text-danger fs-8 text-decoration-none fw-medium">Forgot password?</a>
                                    </div>
                                    <div class="input-group">
                                        <span class="input-group-text bg-light border-end-0"><i class="bi bi-shield-lock text-slate-400"></i></span>
                                        <input type="password" class="form-control bg-light border-start-0 py-2" id="password" name="password" placeholder="••••••••" required>
                                    </div>
                                </div>

                                <div class="form-check my-1">
                                    <input class="form-check-input" type="checkbox" value="" id="rememberMe">
                                    <label class="form-check-label text-slate-500 fs-7" for="rememberMe">
                                        Remember me
                                    </label>
                                </div>

                                <button type="submit" class="btn btn-primary-custom w-100 py-2 mt-2 rounded-3 fw-bold">
                                    Sign In
                                </button>

                            </form>

                        </div>

                        <!-- Footer Links -->
                        <div class="p-3 bg-light border-top text-center">
                            <span class="text-slate-500 fs-7">Don't have an account?</span>
                            <a href="${pageContext.request.contextPath}/register" class="text-danger fw-bold fs-7 text-decoration-none ms-1">Create Account</a>
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
