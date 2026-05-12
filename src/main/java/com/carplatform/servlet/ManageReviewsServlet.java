package com.carplatform.servlet;

import com.carplatform.dao.AdminReviewDAO;
import com.carplatform.model.AdminReviewRecord;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage-reviews")
public class ManageReviewsServlet extends HttpServlet {
    private AdminReviewDAO adminReviewDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminReviewDAO = new AdminReviewDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminReviewRecord> reviews = adminReviewDAO.getAllReviews();
        request.setAttribute("reviews", reviews);
        request.getRequestDispatcher("/manage-reviews.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String reviewId = request.getParameter("reviewId");

        if ("delete".equals(action) && reviewId != null) {
            adminReviewDAO.deleteReview(reviewId);
        }
        response.sendRedirect(request.getContextPath() + "/manage-reviews");
    }
}
