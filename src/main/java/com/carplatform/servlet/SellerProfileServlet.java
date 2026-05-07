package com.carplatform.servlet;

import com.carplatform.dao.SellerInventoryDAO;
import com.carplatform.dao.SellerProfileDAO;
import com.carplatform.model.Seller;
import com.carplatform.model.SellerInventoryItem;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.List;

/**
 * SellerProfileServlet - Handles viewing a Seller's profile.
 * Loads seller details and available inventory.
 */
@WebServlet("/seller-profile")
public class SellerProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get sellerId from parameter, then session, then test ID
        String sellerId = request.getParameter("sellerId");
        if (sellerId == null || sellerId.isEmpty()) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                sellerId = (String) session.getAttribute("userId");
            }
        }
        if (sellerId == null || sellerId.isEmpty()) {
            sellerId = "U002"; // Test seller ID
        }

        // Get file paths
        String usersFile = getServletContext().getRealPath("/WEB-INF/data/users.txt");
        String carsFile = getServletContext().getRealPath("/WEB-INF/data/cars.txt");

        // Load seller profile
        SellerProfileDAO sellerDAO = new SellerProfileDAO(usersFile);
        Seller seller = sellerDAO.getSellerById(sellerId);

        // Load available inventory
        SellerInventoryDAO inventoryDAO = new SellerInventoryDAO(carsFile);
        List<SellerInventoryItem> inventory = inventoryDAO.getAvailableInventoryBySellerId(sellerId);

        // Set attributes for JSP
        request.setAttribute("seller", seller);
        request.setAttribute("inventory", inventory);

        // Forward to seller-profile.jsp
        request.getRequestDispatcher("/seller-profile.jsp").forward(request, response);
    }
}
