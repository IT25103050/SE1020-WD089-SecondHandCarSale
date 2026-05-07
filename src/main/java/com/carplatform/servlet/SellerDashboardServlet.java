package com.carplatform.servlet;

import com.carplatform.dao.SellerInventoryDAO;
import com.carplatform.dao.SellerProfileDAO;
import com.carplatform.model.Seller;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * SellerDashboardServlet - Handles the Seller Dashboard page.
 * Loads seller profile and inventory counts.
 */
@WebServlet("/seller-dashboard")
public class SellerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get sellerId from session, use test ID if missing
        HttpSession session = request.getSession(false);
        String sellerId = null;
        if (session != null) {
            sellerId = (String) session.getAttribute("userId");
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

        // Load inventory counts
        SellerInventoryDAO inventoryDAO = new SellerInventoryDAO(carsFile);
        int totalListings = inventoryDAO.countTotalListings(sellerId);
        int availableListings = inventoryDAO.countAvailableListings(sellerId);
        int soldListings = inventoryDAO.countSoldListings(sellerId);
        int pendingListings = inventoryDAO.countPendingListings(sellerId);

        // Set attributes for JSP
        request.setAttribute("seller", seller);
        request.setAttribute("totalListings", totalListings);
        request.setAttribute("availableListings", availableListings);
        request.setAttribute("soldListings", soldListings);
        request.setAttribute("pendingListings", pendingListings);

        // Forward to seller-dashboard.jsp
        request.getRequestDispatcher("/seller-dashboard.jsp").forward(request, response);
    }
}
