package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    private final UserDAO userDAO;
    private final CarDAO carDAO;
    private final TransactionDAO transactionDAO;
    private final ReviewDAO reviewDAO;

    public AdminController(UserDAO userDAO, CarDAO carDAO, TransactionDAO transactionDAO, ReviewDAO reviewDAO) {
        this.userDAO = userDAO;
        this.carDAO = carDAO;
        this.transactionDAO = transactionDAO;
        this.reviewDAO = reviewDAO;
    }

    @GetMapping({"/", "/login"})
    public String login() {
        return "login";
    }

    @PostMapping("/login")
    public String processLogin(@RequestParam("email") String email,
                               @RequestParam("password") String password,
                               HttpSession session, Model model) {
        User user = userDAO.getUserByEmail(email.trim());
        if (user != null && checkPassword(password, user.getPasswordHash())) { 
            if ("Admin".equalsIgnoreCase(user.getRole())) {
                session.setAttribute("user", user);
                return "redirect:/admin-dashboard";
            }
        }
        model.addAttribute("errorMessage", "Invalid Admin credentials.");
        return "login";
    }

    private boolean checkPassword(String plainPassword, String hashedPassword) {
        if (plainPassword == null || hashedPassword == null) return false;
        try {
            java.security.MessageDigest digest = java.security.MessageDigest.getInstance("SHA-256");
            byte[] hash = digest.digest(plainPassword.getBytes(java.nio.charset.StandardCharsets.UTF_8));
            StringBuilder hexString = new StringBuilder();
            for (byte b : hash) {
                String hex = Integer.toHexString(0xff & b);
                if (hex.length() == 1) hexString.append('0');
                hexString.append(hex);
            }
            return hexString.toString().equalsIgnoreCase(hashedPassword);
        } catch (java.security.NoSuchAlgorithmException e) {
            return false;
        }
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/login";
    }

    @GetMapping("/manage-users")
    public String manageUsers(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("users", userDAO.getAllUsers());
        model.addAttribute("currentUri", "/dashboard");
        return "manage-users";
    }

    @PostMapping("/update-user-status")
    public String updateUserStatus(@RequestParam("userId") String userId,
                                   @RequestParam("accountStatus") String status,
                                   HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        User user = userDAO.getUserById(userId);
        if (user != null) {
            user.setAccountStatus(status);
            userDAO.updateUser(user);
        }
        return "redirect:/manage-users?updated=true";
    }



    @GetMapping("/pending-cars")
    public String pendingCars(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("pendingCars", carDAO.getPendingCars());
        model.addAttribute("currentUri", "/dashboard");
        return "pending-cars";
    }

    @PostMapping("/approve-car")
    public String approveCar(@RequestParam("carId") String carId,
                             @RequestParam("approvalStatus") String status,
                             HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        Car car = carDAO.getCarById(carId);
        if (car != null) {
            car.setApprovalStatus(status);
            carDAO.updateCar(car);
        }
        return "redirect:/pending-cars?resolved=true";
    }

    @GetMapping("/pending-dealers")
    public String pendingDealers(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("pendingDealers", userDAO.getPendingDealers());
        model.addAttribute("currentUri", "/dashboard");
        return "pending-dealers";
    }

    @PostMapping("/approve-dealer")
    public String approveDealer(@RequestParam("userId") String userId,
                                @RequestParam("approvalStatus") String status,
                                HttpSession session) {
        if (!isAdmin(session)) return "redirect:/login";
        User user = userDAO.getUserById(userId);
        if (user != null) {
            user.setApprovalStatus(status);
            userDAO.updateUser(user);
        }
        return "redirect:/pending-dealers?resolved=true";
    }



    @GetMapping("/manage-reviews")
    public String manageReviews(HttpSession session, Model model) {
        if (!isAdmin(session)) return "redirect:/login";
        model.addAttribute("reviews", reviewDAO.getAllReviews());
        model.addAttribute("currentUri", "/dashboard");
        return "manage-reviews";
    }

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user != null && "Admin".equalsIgnoreCase(user.getRole());
    }
}
