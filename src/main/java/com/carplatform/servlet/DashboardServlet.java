package com.carplatform.servlet;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/dashboard")
public class DashboardServlet extends HttpServlet {

    // GET - Route user to the correct dashboard based on their role
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession(false);

        // If no active session, redirect to login
        if (session == null || session.getAttribute("role") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String role = (String) session.getAttribute("role");

        // Forward to the correct dashboard JSP based on role
        switch (role) {
            case "Buyer":
                request.getRequestDispatcher("/buyer-dashboard.jsp").forward(request, response);
                break;
            case "Seller":
                request.getRequestDispatcher("/seller-dashboard.jsp").forward(request, response);
                break;
            case "Dealer":
                request.getRequestDispatcher("/dealer-dashboard.jsp").forward(request, response);
                break;
            case "Admin":
                request.getRequestDispatcher("/admin-dashboard.jsp").forward(request, response);
                break;
            default:
                response.sendRedirect(request.getContextPath() + "/login");
                break;
        }
    }
}
