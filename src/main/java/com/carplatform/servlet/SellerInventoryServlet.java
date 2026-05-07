package com.carplatform.servlet;

import com.carplatform.dao.SellerInventoryDAO;
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
 * SellerInventoryServlet - Handles viewing a Seller/Dealer's inventory.
 * Loads all cars belonging to the seller/dealer from cars.txt.
 */
@WebServlet("/seller-inventory")
public class SellerInventoryServlet extends HttpServlet {

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

        // Get file path
        String carsFile = getServletContext().getRealPath("/WEB-INF/data/cars.txt");

        // Load all inventory for this seller/dealer
        SellerInventoryDAO inventoryDAO = new SellerInventoryDAO(carsFile);
        List<SellerInventoryItem> inventory = inventoryDAO.getInventoryBySellerId(sellerId);

        // Set attributes for JSP
        request.setAttribute("inventory", inventory);
        request.setAttribute("sellerId", sellerId);

        // Forward to seller-inventory.jsp
        request.getRequestDispatcher("/seller-inventory.jsp").forward(request, response);
    }
}
