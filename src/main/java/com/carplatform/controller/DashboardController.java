package com.carplatform.controller;

import com.carplatform.dao.UserDAO;
import com.carplatform.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class DashboardController {

    private final UserDAO userDAO;

    public DashboardController(UserDAO userDAO) {
        this.userDAO = userDAO;
    }

    @GetMapping("/dashboard")
    public String genericDashboard(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        
        String role = user.getRole();
        if ("Buyer".equalsIgnoreCase(role)) return "redirect:/buyer-dashboard";
        if ("Seller".equalsIgnoreCase(role)) return "redirect:/seller-dashboard";
        if ("Dealer".equalsIgnoreCase(role)) return "redirect:/dealer-dashboard";
        if ("Admin".equalsIgnoreCase(role)) return "redirect:/admin-dashboard";

        return "redirect:/";
    }

    @GetMapping("/buyer-dashboard")
    public String buyerDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Buyer", model);
        if (user == null) return "redirect:/login";

        model.addAttribute("currentUri", "/dashboard");
        return "buyer-dashboard";
    }

    @GetMapping("/seller-dashboard")
    public String sellerDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Seller", model);
        if (user == null) return "redirect:/login";

        model.addAttribute("currentUri", "/dashboard");
        return "seller-dashboard";
    }

    @GetMapping("/dealer-dashboard")
    public String dealerDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Dealer", model);
        if (user == null) return "redirect:/login";

        model.addAttribute("currentUri", "/dashboard");
        return "dealer-dashboard";
    }

    @GetMapping("/admin-dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Admin", model);
        if (user == null) return "redirect:/login";

        List<User> users = userDAO.getAllUsers();
        List<User> pendingDealers = userDAO.getPendingDealers();

        // Populate dynamic stats object for EL resolution ${stats.totalUsers}
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalUsers", users.size());
        stats.put("pendingDealersCount", pendingDealers.size());

        model.addAttribute("stats", stats);
        model.addAttribute("pendingDealers", pendingDealers);
        model.addAttribute("currentUri", "/dashboard");
        return "admin-dashboard";
    }

    private User checkAuth(HttpSession session, String expectedRole, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return null;
        // Permit Admin to view any dashboard layout for audit/testing purposes
        if ("Admin".equalsIgnoreCase(user.getRole())) return user;
        if (expectedRole.equalsIgnoreCase(user.getRole())) return user;
        return null;
    }
}
