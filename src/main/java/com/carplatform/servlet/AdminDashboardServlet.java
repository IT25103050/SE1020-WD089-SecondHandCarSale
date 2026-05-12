package com.carplatform.servlet;

import com.carplatform.dao.AdminDAO;
import com.carplatform.model.AdminDashboardStats;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/admin-dashboard")
public class AdminDashboardServlet extends HttpServlet {
    private AdminDAO adminDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminDAO = new AdminDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO: Add actual admin session check here
        // HttpSession session = request.getSession(false);
        // if (session == null || !"Admin".equals(session.getAttribute("role"))) {
        //     response.sendRedirect("login.jsp");
        //     return;
        // }

        AdminDashboardStats stats = adminDAO.getDashboardStats();
        request.setAttribute("stats", stats);
        request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);
    }
}
