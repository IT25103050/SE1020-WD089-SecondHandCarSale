package com.carplatform.servlet;

import com.carplatform.dao.SellerProfileDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * DeactivateSellerServlet - Handles deactivating a Seller/Dealer account.
 * POST: Updates accountStatus to Inactive in users.txt.
 * Does NOT delete the record.
 */
@WebServlet("/deactivate-seller")
public class DeactivateSellerServlet extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get sellerId from form parameter
        String sellerId = request.getParameter("sellerId");

        if (sellerId == null || sellerId.isEmpty()) {
            response.sendRedirect(request.getContextPath() + "/seller-dashboard");
            return;
        }

        // Get file path
        String usersFile = getServletContext().getRealPath("/WEB-INF/data/users.txt");

        // Deactivate seller/dealer
        SellerProfileDAO sellerDAO = new SellerProfileDAO(usersFile);
        sellerDAO.deactivateSeller(sellerId);

        // Invalidate session
        if (request.getSession(false) != null) {
            request.getSession().invalidate();
        }

        // Redirect to login page or seller dashboard
        response.sendRedirect(request.getContextPath() + "/login.jsp");
    }
}
