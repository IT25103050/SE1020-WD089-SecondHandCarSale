package com.carplatform.servlet;

import com.carplatform.dao.DealerProfileDAO;
import com.carplatform.dao.SellerInventoryDAO;
import com.carplatform.model.Dealer;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * DealerDashboardServlet - Handles the Dealer Dashboard page.
 * Loads dealer profile, checks approval status, and loads inventory counts.
 */
@WebServlet("/dealer-dashboard")
public class DealerDashboardServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get dealerId from session, use test ID if missing
        HttpSession session = request.getSession(false);
        String dealerId = null;
        if (session != null) {
            dealerId = (String) session.getAttribute("userId");
        }
        if (dealerId == null || dealerId.isEmpty()) {
            dealerId = "U003"; // Test dealer ID
        }

        // Get file paths
        String usersFile = getServletContext().getRealPath("/WEB-INF/data/users.txt");
        String carsFile = getServletContext().getRealPath("/WEB-INF/data/cars.txt");

        // Load dealer profile
        DealerProfileDAO dealerDAO = new DealerProfileDAO(usersFile);
        Dealer dealer = dealerDAO.getDealerById(dealerId);

        // Check approval status
        boolean isApproved = dealerDAO.isDealerApproved(dealerId);

        // Load inventory counts
        SellerInventoryDAO inventoryDAO = new SellerInventoryDAO(carsFile);
        int totalListings = inventoryDAO.countTotalListings(dealerId);
        int availableListings = inventoryDAO.countAvailableListings(dealerId);
        int soldListings = inventoryDAO.countSoldListings(dealerId);
        int pendingListings = inventoryDAO.countPendingListings(dealerId);

        // Set attributes for JSP
        request.setAttribute("dealer", dealer);
        request.setAttribute("isApproved", isApproved);
        request.setAttribute("totalListings", totalListings);
        request.setAttribute("availableListings", availableListings);
        request.setAttribute("soldListings", soldListings);
        request.setAttribute("pendingListings", pendingListings);

        // Forward to dealer-dashboard.jsp
        request.getRequestDispatcher("/dealer-dashboard.jsp").forward(request, response);
    }
}
