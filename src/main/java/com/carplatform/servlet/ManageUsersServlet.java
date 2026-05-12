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

@WebServlet("/manage-users")
public class ManageUsersServlet extends HttpServlet {
    private AdminUserDAO adminUserDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminUserDAO = new AdminUserDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminUserRecord> users = adminUserDAO.getAllUsers();
        request.setAttribute("users", users);
        request.getRequestDispatcher("/manage-users.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String userId = request.getParameter("userId");

        if (action != null && userId != null) {
            switch (action) {
                case "activate":
                    adminUserDAO.activateUser(userId);
                    break;
                case "deactivate":
                    adminUserDAO.deactivateUser(userId);
                    break;
                case "delete":
                    adminUserDAO.deleteUser(userId);
                    break;
            }
        }
        response.sendRedirect(request.getContextPath() + "/manage-users");
    }
}
