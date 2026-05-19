<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<c:set var="pageTitle" value="Transaction Details | AutoMart" scope="request" />

<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>

<body class="d-flex flex-column h-100 bg-light">

<jsp:include page="fragments/navbar.jsp" />

<main class="flex-shrink-0 py-4">
    <div class="container-fluid px-lg-5">
        <div class="row g-4">

            <div class="col-lg-2 col-md-3">
                <jsp:include page="fragments/sidebar.jsp" />
            </div>

            <div class="col-lg-10 col-md-9">

                <nav aria-label="breadcrumb" class="mb-3">
                    <ol class="breadcrumb fs-7">
                        <li class="breadcrumb-item">
                            <a href="${pageContext.request.contextPath}/transactions" class="text-slate-400">Transactions</a>
                        </li>
                        <li class="breadcrumb-item active text-secondary fw-semibold" aria-current="page">
                            ${transaction.transactionId}
                        </li>
                    </ol>
                </nav>

                <c:if test="${not empty param.verified}">
                    <div class="alert alert-success alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                        <i class="bi bi-check-circle-fill me-2 text-success"></i>
                        Transaction completed successfully.
                    </div>
                </c:if>

                <c:if test="${not empty param.updated}">
                    <div class="alert alert-primary alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                        <i class="bi bi-info-circle-fill me-2 text-primary"></i>
                        Transaction status updated.
                    </div>
                </c:if>

                <c:choose>
                    <c:when test="${empty transaction}">
                        <div class="card border-0 rounded-4 shadow-sm bg-white p-5 text-center">
                            <i class="bi bi-exclamation-triangle text-warning display-4 mb-3"></i>
                            <h3 class="fw-bold text-secondary">Transaction Not Found</h3>
                            <p class="text-slate-500">The requested transaction could not be found.</p>
                            <a href="${pageContext.request.contextPath}/transactions" class="btn btn-dark rounded-3">
                                Back to Transactions
                            </a>
                        </div>
                    </c:when>

                    <c:otherwise>

                        <div class="card border-0 rounded-4 shadow-sm bg-white p-4 mb-4 border-top border-danger border-5">

                            <div class="d-flex flex-column flex-md-row justify-content-between align-items-md-center gap-3 pb-3 border-bottom">
                                <div>
                                    <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-1 fw-bold">
                                        Order Details
                                    </span>
                                    <h3 class="fw-bolder text-secondary mb-0">
                                        Order: <code>${transaction.transactionId}</code>
                                    </h3>
                                    <span class="text-slate-400 fs-8">
                                        Date: ${transaction.requestDate}
                                    </span>
                                </div>

                                <div class="d-flex flex-wrap gap-2 align-items-center">
                                    <span class="badge bg-secondary bg-opacity-10 text-secondary px-3 py-2 fs-7">
                                        Method: ${transaction.paymentMethod}
                                    </span>

                                    <span class="badge ${transaction.paymentStatus == 'COMPLETED' ? 'bg-success' : 'bg-warning text-dark'} px-3 py-2 fs-7">
                                        Payment: ${transaction.paymentStatus}
                                    </span>

                                    <span class="badge ${transaction.transactionStatus == 'COMPLETED' ? 'bg-success' : (transaction.transactionStatus == 'CANCELLED' ? 'bg-danger' : 'bg-primary')} px-3 py-2 fs-7">
                                        Order Status: ${transaction.transactionStatus}
                                    </span>
                                </div>
                            </div>

                            <div class="p-3 bg-light rounded-4 my-4 border">
                                <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-1 fw-bold">
                                    Payment Information
                                </span>

                                <c:choose>
                                    <c:when test="${empty payment}">
                                        <p class="text-secondary fw-semibold fs-6 mb-0 italic">
                                            <i class="bi bi-info-circle text-warning me-2"></i>
                                            Payment information will appear here once processed.
                                        </p>
                                    </c:when>
                                    <c:otherwise>
                                        <p class="text-secondary fw-semibold fs-6 mb-0 italic">
                                            <i class="bi bi-shield-check text-success me-2"></i>
                                            Payment ID: ${payment.paymentId} |
                                            Method: ${payment.paymentMethod} |
                                            Status: ${payment.paymentStatus} |
                                            Date: ${payment.paymentDate}
                                        </p>
                                    </c:otherwise>
                                </c:choose>
                            </div>

                            <div class="row g-4">

                                <div class="col-lg-4">
                                    <div class="p-3 bg-white rounded-4 border h-100">
                                        <span class="text-danger fw-bold fs-8 text-uppercase tracking-widest d-block mb-2">
                                            Vehicle Information
                                        </span>
                                        <div class="p-2 bg-light rounded-3 text-center mb-2">
                                            <span class="text-slate-400 fs-8 d-block">Vehicle ID</span>
                                            <strong class="text-secondary fs-6"><code>${transaction.carId}</code></strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="p-3 bg-white rounded-4 border h-100">
                                        <span class="text-primary fw-bold fs-8 text-uppercase tracking-widest d-block mb-2">
                                            Buyer Information
                                        </span>
                                        <div class="p-2 bg-light rounded-3 text-center mb-2">
                                            <span class="text-slate-400 fs-8 d-block">Buyer ID</span>
                                            <strong class="text-secondary fs-6"><code>${transaction.buyerId}</code></strong>
                                        </div>
                                    </div>
                                </div>

                                <div class="col-lg-4">
                                    <div class="p-3 bg-white rounded-4 border h-100">
                                        <span class="text-success fw-bold fs-8 text-uppercase tracking-widest d-block mb-2">
                                            Seller Information
                                        </span>
                                        <div class="p-2 bg-light rounded-3 text-center mb-2">
                                            <span class="text-slate-400 fs-8 d-block">Seller ID</span>
                                            <strong class="text-secondary fs-6"><code>${transaction.sellerId}</code></strong>
                                        </div>
                                    </div>
                                </div>

                            </div>
                        </div>

                        <div class="row g-4">

                            <div class="col-lg-6">
                                <div class="card border-0 rounded-4 shadow-sm bg-white p-4 h-100">
                                    <span class="text-secondary fw-bold fs-8 text-uppercase tracking-widest d-block mb-1">
                                        Order Actions
                                    </span>
                                    <h5 class="fw-bold text-secondary mb-2">Cancel Transaction</h5>
                                    <p class="text-slate-400 fs-7 mb-3">
                                        Cancel this transaction and close the record.
                                    </p>

                                    <c:choose>
                                        <c:when test="${transaction.transactionStatus == 'CANCELLED' || transaction.transactionStatus == 'COMPLETED'}">
                                            <div class="p-2 bg-light rounded-3 text-center border mt-auto">
                                                <span class="text-slate-400 fs-8 italic">
                                                    This transaction is closed and cannot be modified.
                                                </span>
                                            </div>
                                        </c:when>

                                        <c:otherwise>
                                            <form action="${pageContext.request.contextPath}/cancel-transaction" method="post" class="mt-auto" onsubmit="return confirm('Are you sure you want to cancel this transaction?');">
                                                <input type="hidden" name="transactionId" value="${transaction.transactionId}">
                                                <button type="submit" class="btn btn-outline-danger fw-semibold w-100 py-2 fs-7 rounded-3">
                                                    <i class="bi bi-x-circle me-1"></i>
                                                    Cancel Transaction
                                                </button>
                                            </form>
                                        </c:otherwise>
                                    </c:choose>
                                </div>
                            </div>

                            <div class="col-lg-6">
                                <div class="card border-0 rounded-4 shadow-sm bg-white p-4 h-100 border-start border-danger border-4">
                                    <span class="text-danger fw-bold fs-8 text-uppercase tracking-widest d-block mb-1">
                                        Admin Tools
                                    </span>
                                    <h5 class="fw-bold text-secondary mb-2">Manage Transaction</h5>

                                    <div class="d-flex flex-column gap-2 mt-2">

                                        <form action="${pageContext.request.contextPath}/simulate-payment" method="post">
                                            <input type="hidden" name="transactionId" value="${transaction.transactionId}">
                                            <button type="submit" class="btn btn-dark w-100 fw-bold py-2 fs-7 rounded-3" title="Mark as Paid">
                                                <i class="bi bi-cash-coin me-2 text-warning"></i>
                                                Mark Payment as Completed
                                            </button>
                                        </form>

                                        <form action="${pageContext.request.contextPath}/update-transaction" method="post" class="d-flex gap-2 align-items-center mt-2 pt-2 border-top">
                                            <input type="hidden" name="transactionId" value="${transaction.transactionId}">

                                            <label for="statusSelect" class="form-label fs-8 text-slate-500 mb-0 fw-semibold text-nowrap">
                                                Override Mode:
                                            </label>

                                            <select class="form-select form-select-sm bg-light" id="statusSelect" name="transactionStatus">
                                                <option value="PENDING" ${transaction.transactionStatus == 'PENDING' ? 'selected' : ''}>PENDING</option>
                                                <option value="COMPLETED" ${transaction.transactionStatus == 'COMPLETED' ? 'selected' : ''}>COMPLETED</option>
                                                <option value="CANCELLED" ${transaction.transactionStatus == 'CANCELLED' ? 'selected' : ''}>CANCELLED</option>
                                            </select>

                                            <button type="submit" class="btn btn-outline-secondary btn-sm fw-semibold px-3 py-1">
                                                Set
                                            </button>
                                        </form>

                                    </div>
                                </div>
                            </div>

                        </div>

                    </c:otherwise>
                </c:choose>

            </div>
        </div>
    </div>
</main>

<jsp:include page="fragments/footer.jsp" />
<jsp:include page="fragments/layout-scripts.jsp" />

</body>
</html>