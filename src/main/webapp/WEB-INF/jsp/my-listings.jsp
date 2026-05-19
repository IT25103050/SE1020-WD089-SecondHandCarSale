<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="My Vehicles | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- My Vehicles -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Inventory Grid Area -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex flex-column flex-sm-row justify-content-between align-items-sm-center gap-2">
                            <div>
                                <span class="badge bg-danger px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">My Vehicles</span>
                                <h3 class="fw-bolder text-secondary mb-0">Vehicles For Sale</h3>
                            </div>
                            <a href="${pageContext.request.contextPath}/add-car" class="btn btn-primary-custom fw-semibold rounded-3 py-2 px-3 fs-7 align-self-start align-self-sm-auto">
                                <i class="bi bi-plus-circle me-1"></i> Add Vehicle
                            </a>
                        </div>

                        <!-- Feedback Alerts -->
                        <c:if test="${not empty param.added}">
                            <div class="alert alert-success alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-check-circle-fill me-2 text-success"></i> Vehicle added successfully.
                            </div>
                        </c:if>

                        <c:if test="${not empty param.updated}">
                            <div class="alert alert-primary alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-info-circle-fill me-2 text-primary"></i> Vehicle updated successfully.
                            </div>
                        </c:if>

                        <c:if test="${not empty param.deleted}">
                            <div class="alert alert-secondary alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-trash-fill me-2 text-secondary"></i> Vehicle deleted successfully.
                            </div>
                        </c:if>

                        <c:choose>
                            <c:when test="${empty myListings}">
                                <div class="p-5 text-center bg-light rounded-4 border my-4">
                                    <i class="bi bi-collection text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">You have no vehicles listed</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-3">
                                        Add your first vehicle to start selling on AutoMart.
                                    </p>
                                    <a href="${pageContext.request.contextPath}/add-car" class="btn btn-dark fw-semibold fs-7 px-3 py-2 rounded-3">
                                        Add Vehicle
                                    </a>
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
                                                <th scope="col">Price</th>
                                                <th scope="col">Status</th>
                                                <th scope="col">Approval</th>
                                                <th scope="col" class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-slate-600">
                                            <c:forEach var="car" items="${myListings}">
                                                <tr>
                                                    <td class="fw-bold text-secondary"><code>${car.carId}</code></td>
                                                    <td>
                                                        <img src="${car.imagePath.startsWith('/') ? pageContext.request.contextPath : ''}${car.imagePath}" class="rounded-3 object-fit-cover" style="width: 50px; height: 35px;" alt="Thumbnail">
                                                    </td>
                                                    <td>
                                                        <strong class="text-secondary d-block">${car.brand} ${car.model}</strong>
                                                        <span class="text-slate-400 fs-8">${car.year} Model &bull; ${car.condition}</span>
                                                    </td>
                                                    <td><span class="badge bg-light text-dark border px-2 py-1">${car.fuelType}</span></td>
                                                    <td class="fw-bold text-danger">LKR <fmt:formatNumber value="${car.price}" pattern="#,###" /></td>
                                                    <td>
                                                        <span class="badge ${car.carStatus == 'AVAILABLE' ? 'bg-success' : 'bg-warning text-dark'}">
                                                            ${car.carStatus}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span class="badge ${car.approvalStatus == 'APPROVED' ? 'bg-success' : 'bg-secondary'}">
                                                            ${car.approvalStatus}
                                                        </span>
                                                    </td>
                                                    <td class="text-end">
                                                        <div class="d-flex gap-1 justify-content-end">
                                                            <a href="${pageContext.request.contextPath}/car-details?carId=${car.carId}" class="btn btn-outline-dark btn-sm py-1 px-2 rounded-2 fs-8" title="View">
                                                                <i class="bi bi-eye"></i>
                                                            </a>
                                                            <a href="${pageContext.request.contextPath}/edit-car?carId=${car.carId}" class="btn btn-outline-primary btn-sm py-1 px-2 rounded-2 fs-8" title="Modify">
                                                                <i class="bi bi-pencil"></i>
                                                            </a>
                                                            <form action="${pageContext.request.contextPath}/delete-car" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this vehicle?');">
                                                                <input type="hidden" name="carId" value="${car.carId}">
                                                                <button type="submit" class="btn btn-outline-danger btn-sm py-1 px-2 rounded-2 fs-8" title="Delete">
                                                                    <i class="bi bi-trash"></i>
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
