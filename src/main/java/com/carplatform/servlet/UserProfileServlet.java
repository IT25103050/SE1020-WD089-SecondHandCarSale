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

@WebServlet("/user-profile")
public class UserProfileServlet extends HttpServlet {

    private String getFilePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/WEB-INF/data/users.txt");
    }

    // GET - Load user profile and forward to user-profile.jsp
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String filePath = getFilePath(request);
        UserDAO userDAO = new UserDAO(filePath);

        HttpSession session = request.getSession(false);

        String userId;

        // Get userId from session; use test ID "U001" if session is missing (for testing only)
        if (session != null && session.getAttribute("userId") != null) {
            userId = (String) session.getAttribute("userId");
        } else {
            userId = "U001"; // Testing fallback only
        }

        // Load user from users.txt
        User user = userDAO.getUserById(userId);

        if (user == null) {
            request.setAttribute("error", "User profile not found.");
            request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
            return;
        }

        // Send user object to JSP
        request.setAttribute("user", user);
        request.getRequestDispatcher("/user-profile.jsp").forward(request, response);
    }
}
