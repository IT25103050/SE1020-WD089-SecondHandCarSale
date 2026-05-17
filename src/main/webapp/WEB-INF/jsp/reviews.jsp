<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Reviews | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Reviews -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Reviews Timeline Center -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-dark px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1 text-white">Public Reviews</span>
                                <h3 class="fw-bolder text-secondary mb-0">Platform Reviews</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    View feedback from buyers regarding vehicles and sellers on the platform.
                                </p>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Total Reviews: <strong>${reviews.size()}</strong>
                            </span>
                        </div>

                        <c:if test="${not empty param.added}">
                            <div class="alert alert-success alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-check-circle-fill me-2 text-success"></i> Review added successfully.
                            </div>
                        </c:if>

                        <c:if test="${param.error == 'onlyBuyer'}">
                            <div class="alert alert-danger alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2 text-danger"></i> Only Buyers are allowed to write reviews.
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'noCompletedTransaction'}">
                            <div class="alert alert-danger alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-exclamation-triangle-fill me-2 text-danger"></i> You can only write a review for a vehicle or seller with whom you have a completed (closed) transaction.
                            </div>
                        </c:if>
                        <c:if test="${param.error == 'alreadyReviewed'}">
                            <div class="alert alert-warning alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-exclamation-circle-fill me-2 text-warning"></i> You have already submitted a review for this vehicle or seller.
                            </div>
                        </c:if>

                        <c:choose>
                            <c:when test="${empty reviews}">
                                <div class="p-5 text-center bg-light rounded-4 border my-4">
                                    <i class="bi bi-star-half text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">No Reviews Found</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        There are no reviews currently available.
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="row g-4">
                                    <c:forEach var="rev" items="${reviews}">
                                        <div class="col-md-6">

                                            <div class="p-3 bg-light rounded-4 border h-100 d-flex flex-column justify-content-between">
                                                <div>
                                                    <div class="d-flex justify-content-between align-items-start mb-2">
                                                        <div>
                                                            <span class="text-slate-400 fs-8 d-block lh-1">Reviewer</span>
                                                            <strong class="text-secondary fs-7">User ID: <code>${rev.buyerId}</code></strong>
                                                        </div>
                                                        <div class="text-warning fs-8">
                                                            <c:forEach begin="1" end="${rev.rating}">
                                                                <i class="bi bi-star-fill"></i>
                                                            </c:forEach>
                                                            <c:forEach begin="${rev.rating + 1}" end="5">
                                                                <i class="bi bi-star text-slate-300"></i>
                                                            </c:forEach>
                                                        </div>
                                                    </div>

                                                    <div class="p-2 bg-white rounded-3 border mb-2">
                                                        <span class="text-slate-400 fs-8 text-uppercase tracking-widest d-block mb-1 fw-bold">Feedback</span>
                                                        <p class="text-slate-600 fs-7 mb-0 italic">
                                                            "${rev.displayReview()}"
                                                        </p>
                                                    </div>

                                                    <p class="text-secondary fs-7 mb-0">
                                                        <strong class="text-slate-500">Comments:</strong> ${rev.comment}
                                                    </p>

                                                    <c:if test="${not empty sessionScope.user && sessionScope.user.userId == rev.buyerId}">
                                                        <div class="mt-2 text-end">
                                                            <a href="${pageContext.request.contextPath}/edit-review?reviewId=${rev.reviewId}"
                                                               class="btn btn-sm btn-warning rounded-pill px-3 fs-8 fw-bold text-dark">
                                                                <i class="bi bi-pencil-square me-1"></i> Edit Review
                                                            </a>
                                                        </div>
                                                    </c:if>

                                                </div>

                                                <div class="pt-2 mt-2 border-top d-flex justify-content-between align-items-center text-slate-400 fs-8">
                                                    <span>Review ID: <code>${rev.reviewId}</code></span>
                                                    <span>Recorded: ${rev.createdAt}</span>
                                                </div>
                                            </div>

                                        </div>
                                    </c:forEach>
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
