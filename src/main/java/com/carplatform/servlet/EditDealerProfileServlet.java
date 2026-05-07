package com.carplatform.servlet;

import com.carplatform.dao.DealerProfileDAO;
import com.carplatform.model.Dealer;
import com.carplatform.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

/**
 * EditDealerProfileServlet - Handles editing a Dealer's profile.
 * GET: Loads profile and forwards to edit form.
 * POST: Updates phone, address, and dealer description in users.txt.
 */
@WebServlet("/edit-dealer-profile")
public class EditDealerProfileServlet extends HttpServlet {

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get dealerId from session or test ID
        HttpSession session = request.getSession(false);
        String dealerId = null;
        if (session != null) {
            dealerId = (String) session.getAttribute("userId");
        }
        if (dealerId == null || dealerId.isEmpty()) {
            dealerId = "U003"; // Test dealer ID
        }

        // Get file path
        String usersFile = getServletContext().getRealPath("/WEB-INF/data/users.txt");

        // Load dealer profile
        DealerProfileDAO dealerDAO = new DealerProfileDAO(usersFile);
        Dealer dealer = dealerDAO.getDealerById(dealerId);

        // Set attribute and forward to edit form
        request.setAttribute("dealer", dealer);
        request.getRequestDispatcher("/edit-dealer-profile.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get dealerId from session or test ID
        HttpSession session = request.getSession(false);
        String dealerId = null;
        if (session != null) {
            dealerId = (String) session.getAttribute("userId");
        }
        if (dealerId == null || dealerId.isEmpty()) {
            dealerId = "U003"; // Test dealer ID
        }

        // Get form data
        String phone = request.getParameter("phone");
        String address = request.getParameter("address");
        String dealerDescription = request.getParameter("dealerDescription");

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

        // Load existing dealer
        DealerProfileDAO dealerDAO = new DealerProfileDAO(usersFile);
        Dealer dealer = dealerDAO.getDealerById(dealerId);

        if (dealer != null) {
            // Update phone, address (keep email and role unchanged)
            dealer.setPhone(phone.trim());
            dealer.setAddress(address.trim());
            if (dealerDescription != null) {
                dealer.setDealerDescription(dealerDescription.trim());
            }

            // Save to file
            dealerDAO.updateDealerProfile(dealer);
        }

        // Redirect to dealer profile page
        response.sendRedirect(request.getContextPath() + "/dealer-profile");
    }
}
