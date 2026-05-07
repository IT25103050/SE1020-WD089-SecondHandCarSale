package com.carplatform.servlet;

import com.carplatform.dao.DealerProfileDAO;
import com.carplatform.dao.SellerInventoryDAO;
import com.carplatform.model.Dealer;
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
 * DealerProfileServlet - Handles viewing a Dealer's profile.
 * Loads dealer details and available/approved inventory.
 */
@WebServlet("/dealer-profile")
public class DealerProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get dealerId from parameter, then session, then test ID
        String dealerId = request.getParameter("dealerId");
        if (dealerId == null || dealerId.isEmpty()) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                dealerId = (String) session.getAttribute("userId");
            }
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

        // Load available inventory
        SellerInventoryDAO inventoryDAO = new SellerInventoryDAO(carsFile);
        List<SellerInventoryItem> inventory = inventoryDAO.getAvailableInventoryBySellerId(dealerId);

        // Set attributes for JSP
        request.setAttribute("dealer", dealer);
        request.setAttribute("inventory", inventory);

        // Forward to dealer-profile.jsp
        request.getRequestDispatcher("/dealer-profile.jsp").forward(request, response);
    }
}
