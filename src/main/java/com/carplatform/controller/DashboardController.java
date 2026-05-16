package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import java.util.*;

@Controller
public class DashboardController {

    private final UserDAO userDAO;
    private final CarDAO carDAO;
    private final TransactionDAO transactionDAO;
    private final ReviewDAO reviewDAO;

    public DashboardController(UserDAO userDAO, CarDAO carDAO, TransactionDAO transactionDAO, ReviewDAO reviewDAO) {
        this.userDAO = userDAO;
        this.carDAO = carDAO;
        this.transactionDAO = transactionDAO;
        this.reviewDAO = reviewDAO;
    }

    @GetMapping("/dashboard")
    public String genericDashboard(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";
        
        if ("Admin".equalsIgnoreCase(user.getRole())) return "redirect:/admin-dashboard";

        return "redirect:/login";
    }

    @GetMapping("/admin-dashboard")
    public String adminDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Admin", model);
        if (user == null) return "redirect:/login";

        List<User> users = userDAO.getAllUsers();
        List<Car> cars = carDAO.getAllCars();
        List<Car> pendingCars = carDAO.getPendingCars();
        List<User> pendingDealers = userDAO.getPendingDealers();
        List<Transaction> transactions = transactionDAO.getAllTransactions();
        List<Review> reviews = reviewDAO.getAllReviews();

        // Populate dynamic stats object for EL resolution ${stats.totalUsers}
        Map<String, Object> stats = new HashMap<>();
        stats.put("totalUsers", users.size());
        stats.put("totalCars", cars.size());
        stats.put("pendingCarsCount", pendingCars.size());
        stats.put("pendingDealersCount", pendingDealers.size());
        stats.put("totalTransactions", transactions.size());
        stats.put("totalReviews", reviews.size());

        model.addAttribute("stats", stats);
        model.addAttribute("pendingCars", pendingCars);
        model.addAttribute("pendingDealers", pendingDealers);
        model.addAttribute("recentTransactions", transactions.size() > 5 ? transactions.subList(0, 5) : transactions);
        model.addAttribute("recentReviews", reviews.size() > 5 ? reviews.subList(0, 5) : reviews);
        model.addAttribute("currentUri", "/dashboard");
        return "admin-dashboard";
    }

    private User checkAuth(HttpSession session, String expectedRole, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return null;
        if (expectedRole.equalsIgnoreCase(user.getRole())) return user;
        return null;
    }
}
