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
        
        String role = user.getRole();
        if ("Seller".equalsIgnoreCase(role)) return "redirect:/seller-dashboard";
        if ("Dealer".equalsIgnoreCase(role)) return "redirect:/dealer-dashboard";

        return "redirect:/login";
    }

    @GetMapping("/seller-dashboard")
    public String sellerDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Seller", model);
        if (user == null) return "redirect:/login";

        List<Car> myCars = carDAO.getCarsBySellerId(user.getUserId());
        model.addAttribute("myListings", myCars);
        model.addAttribute("buyerRequests", transactionDAO.getTransactionsBySellerId(user.getUserId()));
        model.addAttribute("currentUri", "/dashboard");
        return "seller-dashboard";
    }

    @GetMapping("/dealer-dashboard")
    public String dealerDashboard(HttpSession session, Model model) {
        User user = checkAuth(session, "Dealer", model);
        if (user == null) return "redirect:/login";

        model.addAttribute("inventory", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("currentUri", "/dashboard");
        return "dealer-dashboard";
    }

    private User checkAuth(HttpSession session, String expectedRole, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return null;
        if (expectedRole.equalsIgnoreCase(user.getRole())) return user;
        return null;
    }
}
