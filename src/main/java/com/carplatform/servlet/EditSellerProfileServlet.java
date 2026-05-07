package com.carplatform.servlet;

import com.carplatform.dao.SellerProfileDAO;
import com.carplatform.model.Seller;
import com.carplatform.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * EditSellerProfileServlet - Handles editing a Seller's profile.
 * GET: Loads profile and forwards to edit form.
 * POST: Updates phone and address in users.txt.
 */
@WebServlet("/edit-seller-profile")
public class EditSellerProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get sellerId from session or test ID
        HttpSession session = request.getSession(false);
        String sellerId = null;
        if (session != null) {
            sellerId = (String) session.getAttribute("userId");
        }
        if (sellerId == null || sellerId.isEmpty()) {
            sellerId = "U002"; // Test seller ID
        }

        // Get file path
        String usersFile = getServletContext().getRealPath("/WEB-INF/data/users.txt");

        // Load seller profile
        SellerProfileDAO sellerDAO = new SellerProfileDAO(usersFile);
        Seller seller = sellerDAO.getSellerById(sellerId);

        // Set attribute and forward to edit form
        request.setAttribute("seller", seller);
        request.getRequestDispatcher("/edit-seller-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get sellerId from session or test ID
        HttpSession session = request.getSession(false);
        String sellerId = null;
        if (session != null) {
            sellerId = (String) session.getAttribute("userId");
        }
        if (sellerId == null || sellerId.isEmpty()) {
            sellerId = "U002"; // Test seller ID
        }

        // Get form data
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");

        // Validate input
        if (!ValidationUtil.isValidPhone(phone)) {
            request.setAttribute("error", "Invalid phone number. Must start with 0 and be 10 digits.");
            doGet(request, response);
            return;
        }
        if (!ValidationUtil.isValidAddress(address)) {
            request.setAttribute("error", "Address must be between 3 and 200 characters.");
            doGet(request, response);
            return;
        }

        // Get file path
        String usersFile = getServletContext().getRealPath("/WEB-INF/data/users.txt");

        // Load existing seller
        SellerProfileDAO sellerDAO = new SellerProfileDAO(usersFile);
        Seller seller = sellerDAO.getSellerById(sellerId);

        if (seller != null) {
            // Update only phone and address (keep email and role unchanged)
            seller.setPhone(phone.trim());
            seller.setAddress(address.trim());

            // Save to file
            sellerDAO.updateSellerProfile(seller);
        }

        // Redirect to seller profile page
        response.sendRedirect(request.getContextPath() + "/seller-profile");
    }
}
