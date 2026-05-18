<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="targetUser" value="${not empty profileUser ? profileUser : sessionScope.user}" />
<c:set var="isOwner" value="${not empty sessionScope.userId && sessionScope.userId == targetUser.userId}" />
<c:set var="targetInfo" value="${not empty userInfoDisplay ? userInfoDisplay : targetUser.displayUserInfo()}" />
<c:set var="targetCars" value="${not empty inventory ? inventory : myListings}" />

<c:set var="pageTitle" value="Seller Profile: ${targetUser.fullName} | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
    <style>
        /* Premium Profile Layout */
        .profile-banner {
            background: linear-gradient(135deg, #1e293b 0%, #0f172a 100%);
            border: none;
            border-radius: 24px;
            padding: 3rem;
            color: #ffffff;
            position: relative;
            overflow: hidden;
            box-shadow: 0 10px 30px rgba(15, 23, 42, 0.06);
        }

        .profile-banner::after {
            content: '';
            position: absolute;
            bottom: -50px;
            right: -50px;
            width: 250px;
            height: 250px;
            background: radial-gradient(circle, rgba(59, 130, 246, 0.1) 0%, rgba(59, 130, 246, 0) 75%);
            pointer-events: none;
        }

        .premium-profile-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            padding: 2.25rem;
            box-shadow: 0 4px 6px -1px rgba(0,0,0,0.02);
            transition: all 0.3s ease;
        }

        /* List car styles */
        .seller-car-card {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 20px;
            overflow: hidden;
            height: 100%;
            display: flex;
            flex-direction: column;
            transition: all 0.4s cubic-bezier(0.16, 1, 0.3, 1);
            box-shadow: 0 4px 6px rgba(0,0,0,0.02);
        }

        .seller-car-card:hover {
            transform: translateY(-8px);
            box-shadow: 0 30px 45px -15px rgba(15, 23, 42, 0.1);
            border-color: rgba(59, 130, 246, 0.2);
        }

        .seller-img-box {
            position: relative;
            height: 200px;
            overflow: hidden;
        }

        .seller-img-box img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            transition: transform 0.6s cubic-bezier(0.16, 1, 0.3, 1);
        }

        .seller-car-card:hover .seller-img-box img {
            transform: scale(1.08);
        }

        /* Modern Table Styles */
        .custom-table {
            background: #ffffff;
            border: 1px solid #e2e8f0;
            border-radius: 16px;
            overflow: hidden;
            box-shadow: 0 4px 6px rgba(0,0,0,0.01);
        }

        .custom-table th {
            background: #f8fafc;
            color: #475569;
            font-weight: 700;
            font-size: 0.8rem;
            text-transform: uppercase;
            letter-spacing: 0.5px;
            padding: 1.25rem 1.5rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .custom-table td {
            padding: 1.25rem 1.5rem;
            color: #334155;
            font-size: 0.85rem;
            border-bottom: 1px solid #e2e8f0;
        }

        .custom-table tr:last-child td {
            border-bottom: none;
        }
    </style>
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Seller Dashboard Base -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Navigation Sidebar for Owner -->
                <c:if test="${isOwner}">
                    <div class="col-lg-2 col-md-3">
                        <jsp:include page="fragments/sidebar.jsp" />
                    </div>
                </c:if>

                <!-- Center Content Hub -->
                <div class="${isOwner ? 'col-lg-10 col-md-9' : 'col-lg-12'}">
                    
                    <!-- Top Profile Banner -->
                    <div class="profile-banner mb-4">
                        <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-4">
                            <div>
                                <div class="d-flex align-items-center gap-2 mb-2">
                                    <span class="badge bg-primary bg-opacity-25 text-primary border border-primary border-opacity-25 px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8">
                                        ${targetUser.getDashboardName()}
                                    </span>
                                    <span class="badge bg-success bg-opacity-10 text-success px-2 py-1 fs-8">
                                        Status: ${targetUser.accountStatus}
                                    </span>
                                </div>
                                <h1 class="display-6 fw-extrabold text-white mb-2">${targetUser.fullName}</h1>
                                <p class="text-slate-300 fs-7 mb-3"><i class="bi bi-geo-alt-fill text-danger me-1"></i> Location: <strong>${targetUser.address}</strong></p>
                                
                                <div class="p-3 bg-white bg-opacity-5 rounded-4 border border-white border-opacity-10 d-inline-block">
                                    <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block fw-bold mb-1">Seller bio</span>
                                    <span class="text-slate-200 fs-7 italic">"${targetInfo}"</span>
                                </div>
                            </div>

                            <div class="d-flex flex-column gap-2 align-items-md-end text-md-end">
                                <span class="text-slate-400 fs-8">ID: <code>${targetUser.userId}</code></span>
                                <span class="text-slate-400 fs-8">Member Since: ${targetUser.createdAt}</span>
                                <c:if test="${isOwner}">
                                    <a href="${pageContext.request.contextPath}/add-car" class="btn btn-primary-custom px-4 py-2 mt-3 fs-7 fw-bold rounded-3">
                                        <i class="bi bi-plus-circle-fill me-1"></i> List New Vehicle
                                    </a>
                                </c:if>
                            </div>
                        </div>
                    </div>

                    <!-- Active Listings Section -->
                    <div class="premium-profile-card mb-4">
                        <div class="d-flex justify-content-between align-items-center mb-4">
                            <div>
                                <span class="text-primary fw-bold text-uppercase fs-8 tracking-widest d-block mb-1">Storefront Inventory</span>
                                <h4 class="fw-bold text-secondary mb-0">
                                    ${isOwner ? 'My Vehicles for Sale' : 'Vehicles for Sale'}
                                </h4>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">Total Listings: ${targetCars.size()}</span>
                        </div>

                        <c:choose>
                            <c:when test="${empty targetCars}">
                                <div class="p-5 text-center bg-light rounded-4 border">
                                    <i class="bi bi-car-front text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-6">No Vehicles Listed</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        ${isOwner ? 'You haven\'t listed any vehicles yet. Let\'s get started by creating a listing!' : 'This seller doesn\'t have any vehicles listed right now.'}
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row g-4">
                                    <c:forEach var="car" items="${targetCars}">
                                        <div class="col-md-6 col-lg-4">
                                            <div class="seller-car-card">
                                                <div class="seller-img-box">
                                                    <img src="${car.imagePath}" alt="${car.brand} ${car.model}">
                                                    <span class="position-absolute top-0 end-0 m-3 badge ${car.carStatus == 'AVAILABLE' ? 'bg-success' : 'bg-warning text-dark'} px-2 py-1 rounded-pill">
                                                        ${car.carStatus}
                                                    </span>
                                                </div>
                                                <div class="p-4 flex-grow-1 d-flex flex-column justify-content-between">
                                                    <div>
                                                        <div class="d-flex justify-content-between align-items-start mb-2">
                                                            <span class="tag-badge text-uppercase">${car.fuelType}</span>
                                                            <span class="text-primary fw-extrabold fs-6">LKR <fmt:formatNumber value="${car.price}" pattern="#,###" /></span>
                                                        </div>
                                                        <h5 class="fw-bold text-secondary mb-1">${car.brand} ${car.model}</h5>
                                                        <p class="text-slate-400 fs-8 mb-3">${car.year} Model &bull; ${car.mileage} km</p>
                                                    </div>

                                                    <div class="pt-3 border-top mt-auto d-flex gap-2">
                                                        <a href="${pageContext.request.contextPath}/car-details?carId=${car.carId}" 
                                                           class="btn btn-dark btn-sm fw-bold flex-grow-1 py-2 rounded-3 fs-8">
                                                            View Details
                                                        </a>
                                                        <c:if test="${isOwner}">
                                                            <a href="${pageContext.request.contextPath}/edit-car?carId=${car.carId}" 
                                                               class="btn btn-outline-secondary btn-sm px-3 py-2 rounded-3" title="Edit Listing">
                                                                <i class="bi bi-pencil"></i>
                                                            </a>
                                                        </c:if>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </c:otherwise>
                        </c:choose>
                    </div>

                    <!-- Purchase Requests (Owner Only) -->
                    <c:if test="${isOwner}">
                        <div class="premium-profile-card">
                            <div class="d-flex justify-content-between align-items-center mb-4">
                                <div>
                                    <span class="text-warning fw-bold text-uppercase fs-8 tracking-widest d-block mb-1">Buyer alerts</span>
                                    <h4 class="fw-bold text-secondary mb-0">Purchase Requests</h4>
                                </div>
                                <span class="badge bg-warning bg-opacity-10 text-warning px-3 py-2 rounded-pill fs-7 fw-bold">Action Required</span>
                            </div>

                            <c:choose>
                                <c:when test="${empty buyerRequests}">
                                    <p class="text-slate-400 fs-7 italic mb-0">
                                        You don't have any purchase requests for your vehicles yet.
                                    </p>
                                </c:when>
                                <c:otherwise>
                                    <div class="table-responsive rounded-3">
                                        <table class="table custom-table align-middle mb-0">
                                            <thead>
                                                <tr>
                                                    <th>Order ID</th>
                                                    <th>Vehicle ID</th>
                                                    <th>Buyer ID</th>
                                                    <th>Payment Method</th>
                                                    <th>Payment Status</th>
                                                    <th>Order Status</th>
                                                    <th class="text-end">Action</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="req" items="${buyerRequests}">
                                                    <tr>
                                                        <td class="fw-bold"><code>${req.transactionId}</code></td>
                                                        <td><code>${req.carId}</code></td>
                                                        <td><code>${req.buyerId}</code></td>
                                                        <td><span class="badge bg-light text-dark border px-2 py-1 rounded">${req.paymentMethod}</span></td>
                                                        <td>
                                                            <span class="badge ${req.paymentStatus == 'COMPLETED' ? 'bg-success bg-opacity-10 text-success' : 'bg-warning bg-opacity-10 text-warning'} fw-bold px-2 py-1 rounded">
                                                                ${req.paymentStatus}
                                                            </span>
                                                        </td>
                                                        <td>
                                                            <span class="badge ${req.transactionStatus == 'COMPLETED' ? 'bg-success bg-opacity-10 text-success' : 'bg-primary bg-opacity-10 text-primary'} fw-bold px-2 py-1 rounded">
                                                                ${req.transactionStatus}
                                                            </span>
                                                        </td>
                                                        <td class="text-end">
                                                            <a href="${pageContext.request.contextPath}/transaction-details?transactionId=${req.transactionId}" 
                                                               class="btn btn-outline-dark btn-sm py-1 px-3 fw-bold rounded-2 fs-8">
                                                                Review Request
                                                            </a>
                                                        </td>
                                                    </tr>
                                                </c:forEach>
                                            </tbody>
                                        </table>
                                    </div>
                                </c:otherwise>
                            </c:choose>
                        </div>
                    </c:if>

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
