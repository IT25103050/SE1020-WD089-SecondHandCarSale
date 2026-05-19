<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="${car.brand} ${car.model} (${car.year}) | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Vehicle Details -->
    <main class="flex-shrink-0 py-5">
        <div class="container">

            <nav aria-label="breadcrumb" class="mb-4">
                <ol class="breadcrumb">
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/" class="text-slate-400">Home</a></li>
                    <li class="breadcrumb-item"><a href="${pageContext.request.contextPath}/cars" class="text-slate-400">Inventory</a></li>
                    <li class="breadcrumb-item active text-secondary fw-semibold" aria-current="page">${car.brand} ${car.model}</li>
                </ol>
            </nav>

            <c:if test="${not empty param.reviewed}">
                <div class="alert alert-success alert-auto-dismiss rounded-4 mb-4 shadow-sm" role="alert">
                    <i class="bi bi-check-circle-fill me-2"></i> Review added successfully. Thank you for your feedback!
                </div>
            </c:if>

            <div class="row backward-spacing g-5">
                
                <!-- Left Media & Metadata Column -->
                <div class="col-lg-7">
                    <div class="card border-0 rounded-4 overflow-hidden shadow-sm mb-4">
                        <img src="${car.imagePath}" class="w-100 object-fit-cover" style="height: 450px;" alt="${car.brand} ${car.model}">
                        <div class="card-body p-4 bg-white">
                            <div class="d-flex justify-content-between align-items-center mb-3">
                                <span class="badge bg-danger px-3 py-2 fs-7 rounded-pill">${car.fuelType} Type</span>
                                <span class="badge bg-secondary bg-opacity-10 text-secondary px-3 py-2 fs-7 fw-bold rounded-pill">Status: ${car.carStatus}</span>
                            </div>
                            
                            <h1 class="display-5 fw-bolder text-secondary mb-1">${car.brand} ${car.model}</h1>
                            <p class="text-slate-400 fs-6 mb-4">Year: ${car.year} &bull; Condition: <span class="text-success fw-bold">${car.condition}</span></p>
                            
                            <h4 class="fw-bold text-secondary mb-3">Vehicle Description</h4>
                            <p class="text-slate-600 mb-4 lh-lg">
                                ${car.description}
                            </p>

                            <div class="p-3 bg-light rounded-4 border mb-4">
                                <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-1 fw-bold">Vehicle Specifications</span>
                                <p class="text-secondary fw-semibold mb-0">
                                    <i class="bi bi-cpu-fill text-danger me-2"></i> ${car.displayCarDetails()}
                                </p>
                            </div>

                            <div class="row g-3 text-center">
                                <div class="col-sm-4">
                                    <div class="p-3 bg-white rounded-3 border">
                                        <i class="bi bi-speedometer text-slate-300 fs-4 d-block mb-1"></i>
                                        <span class="text-slate-400 fs-8 d-block">Odometer</span>
                                        <span class="fw-bold text-secondary fs-6">${car.mileage} km</span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="p-3 bg-white rounded-3 border">
                                        <i class="bi bi-gear-wide-connected text-slate-300 fs-4 d-block mb-1"></i>
                                        <span class="text-slate-400 fs-8 d-block">Transmission</span>
                                        <span class="fw-bold text-secondary fs-6">${car.transmission}</span>
                                    </div>
                                </div>
                                <div class="col-sm-4">
                                    <div class="p-3 bg-white rounded-3 border">
                                        <i class="bi bi-geo-alt text-slate-300 fs-4 d-block mb-1"></i>
                                        <span class="text-slate-400 fs-8 d-block">Location</span>
                                        <span class="fw-bold text-secondary fs-6">${car.location}</span>
                                    </div>
                                </div>
                            </div>

                        </div>
                    </div>

                    <!-- Reviews -->
                    <div class="card border-0 rounded-4 shadow-sm p-4 bg-white">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <h4 class="fw-bold text-secondary mb-0">Vehicle Reviews</h4>
                            <a href="${pageContext.request.contextPath}/add-review?carId=${car.carId}" class="btn btn-outline-danger fw-semibold fs-7 rounded-pill px-3 py-1">
                                <i class="bi bi-pencil-square me-1"></i> Write a Review
                            </a>
                        </div>

                        <c:choose>
                            <c:when test="${empty reviews}">
                                <p class="text-slate-400 fs-7 italic mb-0">
                                    There are no reviews for this vehicle yet. Be the first to share your thoughts.
                                </p>
                            </c:when>
                            <c:otherwise>
                                <div class="d-flex flex-column gap-3">
                                    <c:forEach var="rev" items="${reviews}">
                                        <div class="p-3 bg-light rounded-3 border-start border-danger border-4">
                                            <div class="d-flex justify-content-between align-items-center mb-1">
                                                <span class="fw-bold text-secondary fs-7">User ID: ${rev.buyerId}</span>
                                                <span class="text-slate-400 fs-8">${rev.createdAt}</span>
                                            </div>
                                            <p class="text-slate-600 fs-7 mb-0">
                                                ${rev.displayReview()}
                                            </p>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>
                </div>

                <!-- Right Checkout Column -->
                <div class="col-lg-5">
                    
                    <!-- Pricing Panel -->
                    <div class="card border-0 rounded-4 shadow-sm p-4 bg-white mb-4">
                        <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-1 fw-bold">Price</span>
                        <h2 class="display-6 fw-bolder text-danger mb-3">LKR <fmt:formatNumber value="${car.price}" pattern="#,###" /></h2>

                        <!-- Estimated Value Box -->
                        <div class="p-3 bg-warning bg-opacity-10 rounded-3 mb-4 border border-warning border-opacity-25">
                            <div class="d-flex gap-2 align-items-start">
                                <i class="bi bi-calculator text-warning fs-5 mt-1"></i>
                                <div>
                                    <span class="fw-bold text-dark fs-7 d-block">Fair Market Value</span>
                                        <p class="text-slate-600 fs-8 mb-0">
                                            Based on our market analysis, the estimated value for this car is: 
                                            <strong class="text-secondary">LKR <fmt:formatNumber value="${estimatedValue}" pattern="#,###" /></strong>
                                        </p>
                                </div>
                            </div>
                        </div>

                        <hr class="border-secondary my-3">

                        <h5 class="fw-bold text-secondary mb-3">Secure Checkout</h5>
                        
                        <c:choose>
                            <c:when test="${car.carStatus != 'AVAILABLE'}">
                                <div class="p-3 bg-secondary bg-opacity-10 rounded-3 text-center">
                                    <span class="fw-bold text-secondary d-block">Vehicle Unavailable</span>
                                    <p class="text-slate-500 fs-7 mb-0">This vehicle is currently unavailable or pending a transaction.</p>
                                </div>
                            </c:when>
                            <c:when test="${empty sessionScope.user}">
                                <div class="p-4 bg-light rounded-4 text-center border">
                                    <i class="bi bi-shield-lock text-slate-300 fs-1 d-block mb-2"></i>
                                    <p class="text-slate-500 fs-7 mb-3">Please sign in to proceed with the purchase.</p>
                                    <a href="${pageContext.request.contextPath}/login" class="btn btn-dark fw-semibold w-100 rounded-3 py-2">
                                        Sign In to Buy
                                    </a>
                                </div>
                            </c:when>
                            <c:when test="${sessionScope.role == 'Buyer'}">
                                <form action="${pageContext.request.contextPath}/transactions" method="post" class="d-flex flex-column gap-3">
                                    <input type="hidden" name="carId" value="${car.carId}">
                                    
                                    <div>
                                        <label for="paymentMethod" class="form-label fw-semibold text-secondary fs-7">Payment Method</label>
                                        <select class="form-select bg-light" id="paymentMethod" name="paymentMethod" required>
                                            <option value="Online">Pay Securely Online</option>
                                            <option value="Cash">Pay In-Person with Seller</option>
                                        </select>
                                        <div class="form-text fs-8 text-slate-400">
                                            Online payments secure the vehicle instantly.
                                        </div>
                                    </div>

                                    <button type="submit" class="btn btn-primary-custom w-100 py-3 mt-2 rounded-3 fs-6">
                                        <i class="bi bi-lock-fill me-2"></i> Confirm Purchase
                                    </button>
                                </form>
                            </c:when>
                            <c:otherwise>
                                <div class="p-3 bg-light rounded-3 text-center border">
                                    <span class="fw-semibold text-slate-500 fs-7 d-block">Seller View</span>
                                    <p class="text-slate-400 fs-8 mb-0">Purchasing is restricted to buyer accounts.</p>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Verified Merchant / Dealership Card -->
                    <div class="card border-0 rounded-4 shadow-sm p-4 bg-white">
                        <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-3 fw-bold">Seller Details</span>
                        
                        <div class="d-flex align-items-center gap-3 mb-3">
                            <div class="bg-secondary text-white rounded-circle d-flex align-items-center justify-content-center fw-bold" style="width: 50px; height: 50px; font-size: 1.2rem;">
                                ${empty seller ? 'D' : seller.fullName.substring(0, 1)}
                            </div>
                            <div>
                                <h5 class="fw-bold text-secondary mb-0">${empty seller ? 'Seller' : seller.fullName}</h5>
                                <span class="badge bg-primary bg-opacity-10 text-primary fs-8">${empty seller ? 'Seller' : seller.role} Profile</span>
                            </div>
                        </div>

                        <div class="p-3 bg-light rounded-3 mb-3 border">
                            <span class="text-slate-400 fs-8 d-block mb-1 fw-semibold">Seller Note</span>
                            <p class="text-secondary fs-7 mb-0 italic">
                                "${empty seller ? 'Verified Seller' : seller.displayUserInfo()}"
                            </p>
                        </div>

                        <c:if test="${not empty seller}">
                            <div class="d-flex flex-column gap-2 text-slate-600 fs-7 mb-4">
                                <span><i class="bi bi-envelope text-slate-400 me-2"></i> ${seller.email}</span>
                                <span><i class="bi bi-telephone text-slate-400 me-2"></i> ${seller.phone}</span>
                                <span><i class="bi bi-geo text-slate-400 me-2"></i> ${seller.address}</span>
                            </div>
                            
                            <c:set var="targetProfilePath" value="${seller.role == 'Dealer' ? '/dealer-profile' : '/seller-profile'}" />
                            <a href="${pageContext.request.contextPath}${targetProfilePath}?userId=${seller.userId}" class="btn btn-outline-secondary w-100 fw-semibold rounded-3 py-2 fs-7">
                                View Seller Profile
                            </a>
                        </c:if>

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
