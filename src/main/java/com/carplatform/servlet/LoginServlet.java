package com.carplatform.servlet;

import com.carplatform.dao.UserDAO;
import com.carplatform.model.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/login")
public class LoginServlet extends HttpServlet {

    private String getFilePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/WEB-INF/data/users.txt");
    }

    // GET - Show login form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/login.jsp").forward(request, response);
    }

    // POST - Process login form
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getFilePath(request);
        UserDAO userDAO = new UserDAO(filePath);

        String email    = request.getParameter("email");
        String password = request.getParameter("password");

        // Validate credentials using UserDAO
        User user = userDAO.validateLogin(email, password);

        if (user == null) {
            request.setAttribute("error", "Invalid email or password. Please try again.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Check if account is active
        if ("Inactive".equalsIgnoreCase(user.getAccountStatus())) {
            request.setAttribute("error", "Your account has been deactivated. Please contact admin.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Dealers with Pending approval cannot log in
        if ("Dealer".equalsIgnoreCase(user.getRole())
                && "Pending".equalsIgnoreCase(user.getApprovalStatus())) {
            request.setAttribute("error", "Your dealer account is pending admin approval. Please wait.");
            request.getRequestDispatcher("/login.jsp").forward(request, response);
            return;
        }

        // Store user info in session
        HttpSession session = request.getSession();
        session.setAttribute("userId", user.getUserId());
        session.setAttribute("fullName", user.getFullName());
        session.setAttribute("role", user.getRole());

        // Redirect to dashboard
        response.sendRedirect(request.getContextPath() + "/dashboard");
    }
}
