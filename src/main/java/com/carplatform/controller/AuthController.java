package com.carplatform.controller;

import com.carplatform.dao.UserDAO;
import com.carplatform.model.*;
import com.carplatform.util.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class AuthController {

    private final UserDAO userDAO;
    private final String userDataPath;

    public AuthController(UserDAO userDAO, ServletContext servletContext) {
        this.userDAO = userDAO;
        String path = servletContext.getRealPath("/WEB-INF/data/users.txt");
        if (path == null) {
            System.err.println("[AuthController] WARNING: ServletContext.getRealPath returned null. Falling back to relative path.");
            path = "src/main/webapp/WEB-INF/data/users.txt";
        }
        this.userDataPath = path;
    }

    @GetMapping("/")
    public String index() {
        return "redirect:/login";
    }

    @GetMapping("/login")
    public String showLoginForm() {
        return "login";
    }

    @GetMapping("/register")
    public String showRegisterForm() {
        return "register";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               HttpSession session, Model model) {
        if (ValidationUtil.isEmpty(email) || ValidationUtil.isEmpty(password)) {
            model.addAttribute("errorMessage", "Email and Password are required.");
            return "login";
        }

        User user = userDAO.getUserByEmail(email.trim());
        if (user != null && PasswordUtil.checkPassword(password, user.getPasswordHash())) {
            if ("SUSPENDED".equalsIgnoreCase(user.getAccountStatus())) {
                model.addAttribute("errorMessage", "Your account is suspended. Please contact admin.");
                return "login";
            }
            if ("Dealer".equalsIgnoreCase(user.getRole()) && "PENDING".equalsIgnoreCase(user.getApprovalStatus())) {
                model.addAttribute("errorMessage", "Your dealer account is pending manual admin review.");
                return "login";
            }

            // Populate session bindings
            session.setAttribute("user", user);
            session.setAttribute("userId", user.getUserId());
            session.setAttribute("fullName", user.getFullName());
            session.setAttribute("role", user.getRole());

            // Redirect based on role dashboard paths
            String role = user.getRole();
            if ("Seller".equalsIgnoreCase(role)) return "redirect:/seller-dashboard";
            if ("Dealer".equalsIgnoreCase(role)) return "redirect:/dealer-dashboard";
            
            return "redirect:/dashboard";
        } else {
            model.addAttribute("errorMessage", "Invalid email or password credentials.");
            return "login";
        }
    }

    @PostMapping("/register")
    public String processRegister(@RequestParam("fullName") String fullName,
                                  @RequestParam("email") String email,
                                  @RequestParam("password") String password,
                                  @RequestParam("confirmPassword") String confirmPassword,
                                  @RequestParam("phone") String phone,
                                  @RequestParam("address") String address,
                                  @RequestParam("role") String role,
                                  Model model) {
        if (!ValidationUtil.isValidEmail(email)) {
            model.addAttribute("errorMessage", "Please provide a valid email address.");
            return "register";
        }
        if (ValidationUtil.isEmpty(password) || !password.equals(confirmPassword)) {
            model.addAttribute("errorMessage", "Passwords do not match or are empty.");
            return "register";
        }
        if (userDAO.getUserByEmail(email.trim()) != null) {
            model.addAttribute("errorMessage", "Email is already registered.");
            return "register";
        }

        String userId = IDGenerator.generateUserId(userDataPath);
        String hashedPass = PasswordUtil.hashPassword(password);
        String selectedRole = ValidationUtil.isEmpty(role) ? "Seller" : role.trim();
        String approvalStatus = "Dealer".equalsIgnoreCase(selectedRole) ? "PENDING" : "APPROVED";
        String createdAt = java.time.LocalDate.now().toString();

        User newUser;
        if ("Dealer".equalsIgnoreCase(selectedRole)) {
            newUser = new Dealer(userId, fullName.trim(), email.trim(), hashedPass, phone.trim(), address.trim(), "ACTIVE", approvalStatus, createdAt);
        } else {
            newUser = new Seller(userId, fullName.trim(), email.trim(), hashedPass, phone.trim(), address.trim(), "ACTIVE", approvalStatus, createdAt);
        }

        userDAO.saveUser(newUser);
        model.addAttribute("successMessage", "Registration successful! You can now log in.");
        return "login";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login?logout=true";
    }
}
