<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Manage Transactions | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Manage Transactions -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Core Audit Hub -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-secondary px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Admin Tools</span>
                                <h3 class="fw-bolder text-secondary mb-0">Manage Transactions</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    Monitor all transactions and payments occurring on the platform.
                                </p>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Total Transactions: <strong>${transactions.size()}</strong>
                            </span>
                        </div>

                        <c:choose>
                            <c:when test="${empty transactions}">
                                <div class="p-5 text-center bg-light rounded-4 border my-4">
                                    <i class="bi bi-cash-stack text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">No Transactions Found</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        There are currently no transactions recorded on the platform.
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0 fs-7">
                                        <thead class="table-light text-slate-400 fs-8 text-uppercase tracking-wider">
                                            <tr>
                                                <th scope="col">Transaction ID</th>
                                                <th scope="col">Vehicle ID</th>
                                                <th scope="col">Buyer ID</th>
                                                <th scope="col">Seller ID</th>
                                                <th scope="col">Date</th>
                                                <th scope="col">Method</th>
                                                <th scope="col">Payment Status</th>
                                                <th scope="col">Transaction Status</th>
                                                <th scope="col" class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-slate-600">
                                            <c:forEach var="txn" items="${transactions}">
                                                <tr>
                                                    <td class="fw-bold text-secondary"><code>${txn.transactionId}</code></td>
                                                    <td class="fw-semibold">${txn.carId}</td>
                                                    <td><code>${txn.buyerId}</code></td>
                                                    <td><code>${txn.sellerId}</code></td>
                                                    <td>${txn.requestDate}</td>
                                                    <td>
                                                        <span class="badge bg-secondary bg-opacity-10 text-secondary">${txn.paymentMethod}</span>
                                                    </td>
                                                    <td>
                                                        <span class="badge ${txn.paymentStatus == 'COMPLETED' ? 'bg-success' : 'bg-warning text-dark'}">
                                                            ${txn.paymentStatus}
                                                        </span>
                                                    </td>
                                                    <td>
                                                        <span class="badge ${txn.transactionStatus == 'COMPLETED' ? 'bg-success' : (txn.transactionStatus == 'CANCELLED' ? 'bg-danger' : 'bg-primary')}">
                                                            ${txn.transactionStatus}
                                                        </span>
                                                    </td>
                                                    <td class="text-end">
                                                        <a href="${pageContext.request.contextPath}/transaction-details?transactionId=${txn.transactionId}" class="btn btn-outline-dark btn-sm py-1 px-3 rounded-2 fs-8 fw-semibold">
                                                            View Details
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
