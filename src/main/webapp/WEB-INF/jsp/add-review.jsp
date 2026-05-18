<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Add Review | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Add Review -->
    <main class="flex-shrink-0 py-4 my-auto">
        <div class="container-fluid px-lg-5">
            <div class="row justify-content-center">
                <div class="col-lg-6 col-md-8">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4">
                            <span class="badge bg-dark px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1 text-white">Feedback</span>
                            <h3 class="fw-bolder text-secondary mb-0">Write a Review</h3>
                            <p class="text-slate-400 fs-7 mb-0 mt-1">
                                Share your experience to help others make informed decisions.
                            </p>
                        </div>

                        <!-- Target Context Panel -->
                        <div class="p-3 bg-light rounded-4 mb-4 border">
                            <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-1 fw-bold">Review Target</span>
                            
                            <c:choose>
                                <c:when test="${reviewType == 'CAR'}">
                                    <div class="d-flex align-items-center gap-3">
                                        <img src="${targetCar.imagePath}" class="rounded-3 object-fit-cover" style="width: 70px; height: 50px;" alt="${targetCar.brand}">
                                        <div>
                                            <span class="badge bg-danger px-2 py-0 fs-8 me-1">${targetCar.fuelType}</span>
                                            <strong class="text-secondary d-block fs-6">${targetCar.brand} ${targetCar.model}</strong>
                                            <span class="text-slate-400 fs-8">Ref ID: <code>${targetCar.carId}</code></span>
                                        </div>
                                    </div>
                                </c:when>
                                <c:otherwise>
                                    <div class="d-flex align-items-center gap-3">
                                        <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center fw-bold" style="width: 50px; height: 50px; font-size: 1.2rem;">
                                            ${targetSeller.fullName.substring(0, 1)}
                                        </div>
                                        <div>
                                            <span class="badge bg-primary px-2 py-0 fs-8 me-1">${targetSeller.role} Profile</span>
                                            <strong class="text-secondary d-block fs-6">${targetSeller.fullName}</strong>
                                            <span class="text-slate-400 fs-8">Ref ID: <code>${targetSeller.userId}</code></span>
                                        </div>
                                    </div>
                                </c:otherwise>
                            </c:choose>

                        </div>

                        <!-- Submission Form -->
                        <form action="${pageContext.request.contextPath}/add-review" method="post" class="row g-3">
                            <input type="hidden" name="reviewType" value="${reviewType}">
                            <input type="hidden" name="carId" value="${not empty targetCar ? targetCar.carId : ''}">
                            <input type="hidden" name="sellerId" value="${not empty targetSeller ? targetSeller.userId : (not empty targetCar ? targetCar.sellerId : '')}">

                            <div class="col-12">
                                <label for="rating" class="form-label fw-semibold text-secondary fs-7 mb-1">Rating (1 - 5 Stars)</label>
                                <select class="form-select bg-light py-2" id="rating" name="rating" required autofocus>
                                    <option value="5" selected>⭐⭐⭐⭐⭐ 5 / 5 - Excellent</option>
                                    <option value="4">⭐⭐⭐⭐ 4 / 5 - Good</option>
                                    <option value="3">⭐⭐⭐ 3 / 5 - Average</option>
                                    <option value="2">⭐⭐ 2 / 5 - Poor</option>
                                    <option value="1">⭐ 1 / 5 - Terrible</option>
                                </select>
                            </div>

                            <div class="col-12">
                                <label for="comment" class="form-label fw-semibold text-secondary fs-7 mb-1">Comments</label>
                                <textarea class="form-control bg-light" id="comment" name="comment" rows="4" placeholder="Share details of your experience..." required></textarea>
                            </div>

                            <div class="col-12 pt-3 border-top mt-4">
                                <div class="d-flex justify-content-between align-items-center">
                                    <a href="${pageContext.request.contextPath}/reviews" class="btn btn-outline-secondary px-3 py-2 fw-semibold fs-7">
                                        Back to Reviews
                                    </a>
                                    <button type="submit" class="btn btn-dark px-4 py-2 fw-bold">
                                        <i class="bi bi-star-fill text-warning me-2"></i> Submit Review
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
