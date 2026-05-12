package com.carplatform.servlet;

import com.carplatform.dao.AdminUserDAO;
import com.carplatform.model.AdminUserRecord;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/pending-dealers")
public class PendingDealersServlet extends HttpServlet {
    private AdminUserDAO adminUserDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminUserDAO = new AdminUserDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminUserRecord> pendingDealers = adminUserDAO.getPendingDealers();
        request.setAttribute("pendingDealers", pendingDealers);
        request.getRequestDispatcher("/pending-dealers.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String userId = request.getParameter("userId");

        if (action != null && userId != null) {
            if ("approve".equals(action)) {
                adminUserDAO.approveDealer(userId);
            } else if ("reject".equals(action)) {
                adminUserDAO.rejectDealer(userId);
            }
        }
        response.sendRedirect(request.getContextPath() + "/pending-dealers");
    }
}
