package com.carplatform.servlet;

import com.carplatform.dao.UserDAO;
import com.carplatform.model.*;
import com.carplatform.util.IDGenerator;
import com.carplatform.util.PasswordUtil;
import com.carplatform.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/register")
public class RegisterServlet extends HttpServlet {

    private String getFilePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/WEB-INF/data/users.txt");
    }

    // GET - Show registration form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.getRequestDispatcher("/register.jsp").forward(request, response);
    }

    // POST - Process registration form
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getFilePath(request);
        UserDAO userDAO = new UserDAO(filePath);

        // Read form fields
        String fullName       = request.getParameter("fullName");
        String email          = request.getParameter("email");
        String password       = request.getParameter("password");
        String confirmPassword= request.getParameter("confirmPassword");
        String phone          = request.getParameter("phone");
        String address        = request.getParameter("address");
        String role           = request.getParameter("role");

        // Validate required fields
        if (ValidationUtil.isEmpty(fullName) || ValidationUtil.isEmpty(email)
                || ValidationUtil.isEmpty(password) || ValidationUtil.isEmpty(confirmPassword)
                || ValidationUtil.isEmpty(phone) || ValidationUtil.isEmpty(address)
                || ValidationUtil.isEmpty(role)) {
            request.setAttribute("error", "All fields are required.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate email format
        if (!ValidationUtil.isValidEmail(email)) {
            request.setAttribute("error", "Please enter a valid email address.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate phone format
        if (!ValidationUtil.isValidPhone(phone)) {
            request.setAttribute("error", "Please enter a valid phone number (e.g., 0771234567).");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Validate password match
        if (!ValidationUtil.isPasswordMatch(password, confirmPassword)) {
            request.setAttribute("error", "Passwords do not match.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Check for duplicate email
        if (userDAO.isEmailExists(email)) {
            request.setAttribute("error", "An account with this email already exists.");
            request.getRequestDispatcher("/register.jsp").forward(request, response);
            return;
        }

        // Generate user ID and hash password
        String userId       = IDGenerator.generateUserId(filePath);
        String passwordHash = PasswordUtil.hashPassword(password);
        String accountStatus = "Active";
        String approvalStatus;
        String createdAt    = LocalDate.now().toString();

        // Dealers require admin approval; others are auto-approved
        if ("Dealer".equalsIgnoreCase(role)) {
            approvalStatus = "Pending";
        } else {
            approvalStatus = "Approved";
        }

        // Create appropriate User subclass based on role
        User newUser;
        switch (role) {
            case "Buyer":
                newUser = new Buyer(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
                break;
            case "Seller":
                newUser = new Seller(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
                break;
            case "Dealer":
                newUser = new Dealer(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
                break;
            case "Admin":
                newUser = new Admin(userId, fullName, email, passwordHash, phone, address, accountStatus, approvalStatus, createdAt);
                break;
            default:
                request.setAttribute("error", "Invalid role selected.");
                request.getRequestDispatcher("/register.jsp").forward(request, response);
                return;
        }

        // Save user to users.txt
        userDAO.addUser(newUser);

        // Redirect to login with success message
        response.sendRedirect(request.getContextPath() + "/login?success=Registration+successful.+Please+login.");
    }
}
