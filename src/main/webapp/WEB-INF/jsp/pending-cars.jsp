<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="Pending Vehicles | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Pending Vehicles -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Moderation Workspace -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-warning text-dark px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Admin Tools</span>
                                <h3 class="fw-bolder text-secondary mb-0">Pending Vehicles</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    Review and approve new vehicles added by sellers or dealerships.
                                </p>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Pending Approvals: <strong>${pendingCars.size()}</strong>
                            </span>
                        </div>

                        <c:if test="${not empty param.resolved}">
                            <div class="alert alert-success alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-check-circle-fill me-2 text-success"></i> Vehicle approved successfully.
                            </div>
                        </c:if>

                        <c:choose>
                            <c:when test="${empty pendingCars}">
                                <div class="p-5 text-center bg-light rounded-4 border my-4">
                                    <i class="bi bi-shield-check text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">No Pending Vehicles</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        There are currently no new vehicles awaiting approval.
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0 fs-7">
                                        <thead class="table-light text-slate-400 fs-8 text-uppercase tracking-wider">
                                            <tr>
                                                <th scope="col">Vehicle ID</th>
                                                <th scope="col">Photo</th>
                                                <th scope="col">Vehicle</th>
                                                <th scope="col">Fuel Type</th>
                                                <th scope="col">Seller ID</th>
                                                <th scope="col">Price</th>
                                                <th scope="col">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-slate-600">
                                            <c:forEach var="car" items="${pendingCars}">
                                                <tr>
                                                    <td class="fw-bold text-secondary"><code>${car.carId}</code></td>
                                                    <td>
                                                        <img src="${car.imagePath}" class="rounded-3 object-fit-cover" style="width: 50px; height: 35px;" alt="Thumbnail">
                                                    </td>
                                                    <td>
                                                        <strong class="text-secondary d-block">${car.brand} ${car.model}</strong>
                                                        <span class="text-slate-400 fs-8">${car.year} Model &bull; <span class="text-success fw-bold">${car.condition}</span></span>
                                                    </td>
                                                    <td>
                                                        <span class="badge bg-light text-dark border px-2 py-1">${car.fuelType}</span>
                                                    </td>
                                                    <td><code>${car.sellerId}</code></td>
                                                    <td>
                                                        <span class="text-danger fw-bold d-block">LKR <fmt:formatNumber value="${car.price}" pattern="#,###" /></span>
                                                        <span class="text-slate-400 fs-8 italic">Estimated Value: LKR <fmt:formatNumber value="${car.calculateEstimatedValue()}" pattern="#,###" /></span>
                                                    </td>
                                                    <td>
                                                        <div class="d-flex gap-1 align-items-center">
                                                            <a href="${pageContext.request.contextPath}/car-details?carId=${car.carId}" class="btn btn-outline-dark btn-sm py-1 px-2 rounded-2 fs-8" title="View Details">
                                                                View
                                                            </a>
                                                            <form action="${pageContext.request.contextPath}/approve-car" method="post" class="d-inline">
                                                                <input type="hidden" name="carId" value="${car.carId}">
                                                                <input type="hidden" name="approvalStatus" value="APPROVED">
                                                                <button type="submit" class="btn btn-success btn-sm py-1 px-3 rounded-2 fs-8 fw-bold">
                                                                    <i class="bi bi-check-lg me-1"></i> Approve
                                                                </button>
                                                            </form>
                                                        </div>
                                                    </td>
                                                </tr>
                                            </c:forEach>
                                        </tbody>
                                    </table>
                                </div>
                            </c:otherwise>
                        </c:choose>

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
