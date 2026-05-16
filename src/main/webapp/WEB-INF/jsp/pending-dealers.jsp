<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Pending Dealerships | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Pending Dealerships -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Gateway Hub Workspace -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-danger px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Admin Tools</span>
                                <h3 class="fw-bolder text-secondary mb-0">Pending Dealerships</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    Review and approve new dealership registrations.
                                </p>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Pending Approvals: <strong>${pendingDealers.size()}</strong>
                            </span>
                        </div>

                        <c:if test="${not empty param.resolved}">
                            <div class="alert alert-success alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-check-circle-fill me-2 text-success"></i> Dealership approved successfully.
                            </div>
                        </c:if>

                        <c:choose>
                            <c:when test="${empty pendingDealers}">
                                <div class="p-5 text-center bg-light rounded-4 border my-4">
                                    <i class="bi bi-person-lines-fill text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">No Pending Dealerships</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        There are currently no new dealership registrations awaiting approval.
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0 fs-7">
                                        <thead class="table-light text-slate-400 fs-8 text-uppercase tracking-wider">
                                            <tr>
                                                <th scope="col">User ID</th>
                                                <th scope="col">Dealership Name</th>
                                                <th scope="col">Details</th>
                                                <th scope="col">Location</th>
                                                <th scope="col">Joined</th>
                                                <th scope="col" class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-slate-600">
                                            <c:forEach var="dealer" items="${pendingDealers}">
                                                <tr>
                                                    <td class="fw-bold text-secondary"><code>${dealer.userId}</code></td>
                                                    <td>
                                                        <strong class="text-secondary d-block">${dealer.fullName}</strong>
                                                        <span class="text-slate-400 fs-8 pe-1"><i class="bi bi-envelope me-1"></i>${dealer.email}</span>
                                                    </td>
                                                    <td>
                                                        <div class="max-w-xs text-truncate fs-8 bg-light p-1 rounded border italic" title="${dealer.displayUserInfo()}">
                                                            "${dealer.displayUserInfo()}"
                                                        </div>
                                                    </td>
                                                    <td><span class="text-secondary">${dealer.address}</span></td>
                                                    <td>${dealer.createdAt}</td>
                                                    <td class="text-end">
                                                        <form action="${pageContext.request.contextPath}/approve-dealer" method="post" class="d-inline">
                                                            <input type="hidden" name="userId" value="${dealer.userId}">
                                                            <input type="hidden" name="approvalStatus" value="APPROVED">
                                                            <button type="submit" class="btn btn-primary-custom btn-sm py-1 px-3 rounded-2 fs-8 fw-bold">
                                                                <i class="bi bi-check-circle me-1"></i> Approve
                                                            </button>
                                                        </form>
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
