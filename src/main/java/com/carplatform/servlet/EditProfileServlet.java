package com.carplatform.servlet;

import com.carplatform.dao.UserDAO;
import com.carplatform.model.User;
import com.carplatform.util.ValidationUtil;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/edit-profile")
public class EditProfileServlet extends HttpServlet {

    private String getFilePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/WEB-INF/data/users.txt");
    }

    // GET - Load current user and show edit form
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getFilePath(request);
        UserDAO userDAO = new UserDAO(filePath);

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String userId = (String) session.getAttribute("userId");
        User user = userDAO.getUserById(userId);

        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user-profile");
            return;
        }

        request.setAttribute("user", user);
        request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
    }

    // POST - Update fullName, phone, address only
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getFilePath(request);
        UserDAO userDAO = new UserDAO(filePath);

        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("userId") == null) {
            response.sendRedirect(request.getContextPath() + "/login");
            return;
        }

        String userId  = (String) session.getAttribute("userId");
        String fullName= request.getParameter("fullName");
        String phone   = request.getParameter("phone");
        String address = request.getParameter("address");

        // Validate required fields
        if (ValidationUtil.isEmpty(fullName) || ValidationUtil.isEmpty(phone) || ValidationUtil.isEmpty(address)) {
            User user = userDAO.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("error", "Full name, phone, and address cannot be empty.");
            request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
            return;
        }

        // Validate phone format
        if (!ValidationUtil.isValidPhone(phone)) {
            User user = userDAO.getUserById(userId);
            request.setAttribute("user", user);
            request.setAttribute("error", "Please enter a valid phone number (e.g., 0771234567).");
            request.getRequestDispatcher("/edit-profile.jsp").forward(request, response);
            return;
        }

        // Load existing user and update only allowed fields
        User user = userDAO.getUserById(userId);
        if (user == null) {
            response.sendRedirect(request.getContextPath() + "/user-profile");
            return;
        }

        user.setFullName(fullName);
        user.setPhone(phone);
        user.setAddress(address);
        // Email and role are NOT changed

        userDAO.updateUser(user);

        // Update fullName in session
        session.setAttribute("fullName", fullName);

        // Redirect back to profile
        response.sendRedirect(request.getContextPath() + "/user-profile?success=Profile+updated+successfully.");
    }
}
