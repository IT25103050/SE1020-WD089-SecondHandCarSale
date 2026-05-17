<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <title>Edit Review - AutoMart</title>
    <jsp:include page="fragments/layout-header.jsp" />
</head>
<body class="bg-light">
    <jsp:include page="fragments/navbar.jsp" />

    <div class="container my-5">
        <div class="row justify-content-center">
            <div class="col-md-6">
                <div class="card shadow">
                    <div class="card-header bg-warning text-dark">
                        <h4 class="mb-0"><i class="fas fa-edit me-2"></i>Edit Your Review</h4>
                    </div>
                    <div class="card-body">
                        <form action="${pageContext.request.contextPath}/edit-review" method="post">
                            <input type="hidden" name="reviewId" value="${review.reviewId}" />

                            <div class="mb-3">
                                <label class="form-label fw-bold">Review ID</label>
                                <input type="text" class="form-control" value="${review.reviewId}" disabled />
                            </div>

                            <div class="mb-3">
                                <label for="rating" class="form-label fw-bold">Rating (1 to 5 Stars)</label>
                                <select class="form-select" id="rating" name="rating">
                                    <c:forEach var="i" begin="1" end="5">
                                        <option value="${i}" ${review.rating == i ? 'selected' : ''}>${i} Stars</option>
                                    </c:forEach>
                                </select>
                            </div>

                            <div class="mb-3">
                                <label for="comment" class="form-label fw-bold">Your Review Comment</label>
                                <textarea class="form-control" id="comment" name="comment" rows="4" required>${review.comment}</textarea>
                            </div>

                            <div class="d-flex justify-content-between">
                                <a href="${pageContext.request.contextPath}/reviews" class="btn btn-secondary">Cancel</a>
                                <button type="submit" class="btn btn-warning fw-bold">Update Review</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <jsp:include page="fragments/footer.jsp" />
    <jsp:include page="fragments/layout-scripts.jsp" />
</body>
</html>