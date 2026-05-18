package com.carplatform.servlet;

import com.carplatform.dao.UserDAO;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/deactivate-account")
public class DeactivateAccountServlet extends HttpServlet {

    private String getFilePath(HttpServletRequest request) {
        return request.getServletContext().getRealPath("/WEB-INF/data/users.txt");
    }

    // POST - Deactivate account, invalidate session, redirect to login
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

        String userId = (String) session.getAttribute("userId");

        // Update accountStatus to Inactive in users.txt
        userDAO.deactivateUser(userId);

        // Invalidate session
        session.invalidate();

        // Redirect to login with a deactivation message
        response.sendRedirect(request.getContextPath() + "/login?info=Your+account+has+been+deactivated.");
    }
}
