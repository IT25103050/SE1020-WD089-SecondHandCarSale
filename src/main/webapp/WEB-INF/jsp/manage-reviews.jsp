<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<c:set var="pageTitle" value="Manage Reviews | AutoMart" scope="request" />
<!DOCTYPE html>
<html lang="en" class="h-100">
<head>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="d-flex flex-column h-100 bg-light">

    <!-- Navigation Header -->
    <jsp:include page="fragments/navbar.jsp" />

    <!-- Manage Reviews -->
    <main class="flex-shrink-0 py-4">
        <div class="container-fluid px-lg-5">
            <div class="row g-4">
                
                <!-- Left Navigation Sidebar -->
                <div class="col-lg-2 col-md-3">
                    <jsp:include page="fragments/sidebar.jsp" />
                </div>

                <!-- Right Supervision Reviews Base -->
                <div class="col-lg-10 col-md-9">
                    
                    <div class="card border-0 rounded-4 shadow-sm bg-white p-4">
                        
                        <div class="border-bottom pb-3 mb-4 d-flex justify-content-between align-items-center">
                            <div>
                                <span class="badge bg-secondary px-3 py-1 rounded-pill text-uppercase tracking-widest fs-8 mb-1">Admin Tools</span>
                                <h3 class="fw-bolder text-secondary mb-0">Manage Reviews</h3>
                                <p class="text-slate-400 fs-7 mb-0 mt-1">
                                    View and moderate all user reviews across the platform.
                                </p>
                            </div>
                            <span class="badge bg-light text-secondary border px-3 py-2 fs-7 rounded-pill">
                                Total Reviews: <strong>${reviews.size()}</strong>
                            </span>
                        </div>

                        <c:if test="${not empty param.deleted}">
                            <div class="alert alert-secondary alert-auto-dismiss rounded-3 fs-7 py-2 px-3 mb-4 shadow-sm" role="alert">
                                <i class="bi bi-trash-fill me-2 text-secondary"></i> Review deleted successfully.
                            </div>
                        </c:if>

                        <c:choose>
                            <c:when test="${empty reviews}">
                                <div class="p-5 text-center bg-light rounded-4 border my-4">
                                    <i class="bi bi-star text-slate-300 fs-1 d-block mb-2"></i>
                                    <span class="fw-bold text-slate-500 d-block fs-5">No Reviews Found</span>
                                    <p class="text-slate-400 fs-7 max-w-md mx-auto mb-0">
                                        There are currently no reviews submitted by users on the platform.
                                    </p>
                                </div>
                            </c:when>
                            <c:otherwise>
                                <div class="table-responsive">
                                    <table class="table table-hover align-middle mb-0 fs-7">
                                        <thead class="table-light text-slate-400 fs-8 text-uppercase tracking-wider">
                                            <tr>
                                                <th scope="col">Review ID</th>
                                                <th scope="col">Buyer ID</th>
                                                <th scope="col">Target</th>
                                                <th scope="col">Rating</th>
                                                <th scope="col">Comment</th>
                                                <th scope="col">Date</th>
                                                <th scope="col" class="text-end">Actions</th>
                                            </tr>
                                        </thead>
                                        <tbody class="text-slate-600">
                                            <c:forEach var="rev" items="${reviews}">
                                                <tr>
                                                    <td class="fw-bold text-secondary"><code>${rev.reviewId}</code></td>
                                                    <td><code>${rev.buyerId}</code></td>
                                                    <td>
                                                        <div class="max-w-xs text-truncate fs-8 bg-light p-1 rounded border italic" title="${rev.displayReview()}">
                                                            "${rev.displayReview()}"
                                                        </div>
                                                    </td>
                                                    <td class="text-warning fw-bold">
                                                        ${rev.rating} / 5 <i class="bi bi-star-fill fs-8"></i>
                                                    </td>
                                                    <td><span class="text-secondary max-w-sm d-inline-block text-truncate" title="${rev.comment}">${rev.comment}</span></td>
                                                    <td>${rev.createdAt}</td>
                                                    <td class="text-end">
                                                        <form action="${pageContext.request.contextPath}/delete-review" method="post" class="d-inline" onsubmit="return confirm('Are you sure you want to delete this review?');">
                                                            <input type="hidden" name="reviewId" value="${rev.reviewId}">
                                                            <button type="submit" class="btn btn-outline-danger btn-sm py-1 px-2 rounded-2 fs-8" title="Delete Review">
                                                                <i class="bi bi-trash"></i> Delete
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
