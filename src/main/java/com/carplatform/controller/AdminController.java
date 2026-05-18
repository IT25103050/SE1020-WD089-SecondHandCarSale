package com.carplatform.controller;

import com.carplatform.dao.UserDAO;
import com.carplatform.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class AdminController {

    private final UserDAO userDAO;

    public AdminController(UserDAO userDAO) {
        this.userDAO = userDAO;
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

    private boolean isAdmin(HttpSession session) {
        User user = (User) session.getAttribute("user");
        return user != null && "Admin".equalsIgnoreCase(user.getRole());
    }
}
