package com.wd089.servlet;

import com.wd089.dao.UserDAO;
import com.wd089.model.AdminUser;
import com.wd089.model.RegularUser;
import com.wd089.model.User;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.util.List;

@WebServlet("/user")
public class UserServlet extends HttpServlet {

    private UserDAO userDAO;

    @Override
    public void init() throws ServletException {
        userDAO = new UserDAO();
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("list".equals(action)) {
            List<User> users = userDAO.getAllUsers();
            request.setAttribute("users", users);
            request.getRequestDispatcher("/user/users.jsp").forward(request, response);

        } else if ("search".equals(action)) {
            String keyword = request.getParameter("keyword");
            List<User> users = userDAO.searchUsers(keyword == null ? "" : keyword);
            request.setAttribute("users", users);
            request.setAttribute("keyword", keyword);
            request.getRequestDispatcher("/user/users.jsp").forward(request, response);

        } else if ("logout".equals(action)) {
            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }
            response.sendRedirect(request.getContextPath() + "/index.jsp");

        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String action = request.getParameter("action");

        if ("register".equals(action)) {
            String userCode = request.getParameter("userCode");
            String username = request.getParameter("username");
            String email = request.getParameter("email");
            String role = request.getParameter("role");

            if (userDAO.existsByUserCode(userCode)) {
                request.setAttribute("error", "User Code already exists.");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                return;
            }

            if (userDAO.existsByUsername(username)) {
                request.setAttribute("error", "Username already exists.");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                return;
            }

            if (userDAO.existsByEmail(email)) {
                request.setAttribute("error", "Email already exists.");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
                return;
            }

            User user;

            if ("Admin".equalsIgnoreCase(role)) {
                user = new AdminUser();
            } else {
                user = new RegularUser();
            }

            user.setUserCode(userCode);
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setUsername(username);
            user.setEmail(email);
            user.setPhone(request.getParameter("phone"));
            user.setPassword(request.getParameter("password"));
            user.setRole(role);
            user.setStatus("Active");

            boolean success = userDAO.addUser(user);

            if (success) {
                response.sendRedirect(request.getContextPath() + "/user/login.jsp?registered=1");
            } else {
                request.setAttribute("error", "Registration failed.");
                request.getRequestDispatcher("/user/register.jsp").forward(request, response);
            }

        } else if ("login".equals(action)) {
            String username = request.getParameter("username");
            String password = request.getParameter("password");

            User user = userDAO.authenticate(username, password);

            if (user != null) {
                HttpSession session = request.getSession();
                session.setAttribute("loggedUser", user);
                response.sendRedirect(request.getContextPath() + "/user/profile.jsp");
            } else {
                request.setAttribute("error", "Invalid username or password.");
                request.getRequestDispatcher("/user/login.jsp").forward(request, response);
            }

        } else if ("update".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            String role = request.getParameter("role");
            User user;

            if ("Admin".equalsIgnoreCase(role)) {
                user = new AdminUser();
            } else {
                user = new RegularUser();
            }

            user.setId(id);
            user.setUserCode(request.getParameter("userCode"));
            user.setFirstName(request.getParameter("firstName"));
            user.setLastName(request.getParameter("lastName"));
            user.setUsername(request.getParameter("username"));
            user.setEmail(request.getParameter("email"));
            user.setPhone(request.getParameter("phone"));
            user.setPassword(request.getParameter("password"));
            user.setRole(role);
            user.setStatus(request.getParameter("status"));

            boolean updated = userDAO.updateUser(user);

            if (updated) {
                User refreshedUser = userDAO.getUserById(id);
                request.getSession().setAttribute("loggedUser", refreshedUser);
                response.sendRedirect(request.getContextPath() + "/user/profile.jsp?updated=1");
            } else {
                request.setAttribute("error", "Update failed.");
                request.getRequestDispatcher("/user/profile.jsp").forward(request, response);
            }

        } else if ("delete".equals(action)) {
            int id = Integer.parseInt(request.getParameter("id"));
            boolean deleted = userDAO.deleteUser(id);

            HttpSession session = request.getSession(false);
            if (session != null) {
                session.invalidate();
            }

            if (deleted) {
                response.sendRedirect(request.getContextPath() + "/index.jsp?deleted=1");
            } else {
                response.sendRedirect(request.getContextPath() + "/index.jsp?deleted=0");
            }

        } else {
            response.sendRedirect(request.getContextPath() + "/index.jsp");
        }
    }
}