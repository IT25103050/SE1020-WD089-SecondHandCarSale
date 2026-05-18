package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class SellerDealerController {

    private final UserDAO userDAO;
    private final CarDAO carDAO;

    public SellerDealerController(UserDAO userDAO, CarDAO carDAO) {
        this.userDAO = userDAO;
        this.carDAO = carDAO;
    }

    @GetMapping("/seller-profile")
    public String viewSellerProfile(@RequestParam(value = "userId", required = false) String userId,
                                    HttpSession session, Model model) {
        User target = resolveTargetUser(userId, session);
        if (target == null) return "redirect:/login";

        model.addAttribute("profileUser", target);
        model.addAttribute("userInfoDisplay", target.displayUserInfo());
        model.addAttribute("inventory", carDAO.getCarsBySellerId(target.getUserId()));
        model.addAttribute("currentUri", "/dashboard");
        return "seller-dashboard"; // Reuses or acts as public summary view
    }

    @GetMapping("/dealer-profile")
    public String viewDealerProfile(@RequestParam(value = "userId", required = false) String userId,
                                    HttpSession session, Model model) {
        User target = resolveTargetUser(userId, session);
        if (target == null) return "redirect:/login";

        model.addAttribute("profileUser", target);
        model.addAttribute("userInfoDisplay", target.displayUserInfo());
        model.addAttribute("inventory", carDAO.getCarsBySellerId(target.getUserId()));
        model.addAttribute("currentUri", "/dashboard");
        return "dealer-dashboard"; // Reuses or acts as public summary view
    }

    @GetMapping("/seller-inventory")
    public String viewSellerInventory(@RequestParam("userId") String userId, Model model) {
        User seller = userDAO.getUserById(userId);
        if (seller == null) return "redirect:/cars";

        model.addAttribute("seller", seller);
        model.addAttribute("cars", carDAO.getCarsBySellerId(userId));
        model.addAttribute("currentUri", "/cars");
        return "car-list"; // Renders inventory using standard card layout
    }

    @GetMapping("/dashboard")
    public String dashboard(HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/";

        String role = user.getRole();
        if ("Admin".equalsIgnoreCase(role)) {
            return "redirect:/manage-cars";
        } else if ("Seller".equalsIgnoreCase(role)) {
            return "redirect:/seller-dashboard";
        } else if ("Dealer".equalsIgnoreCase(role)) {
            return "redirect:/dealer-dashboard";
        }
        return "redirect:/cars";
    }

    @GetMapping("/seller-dashboard")
    public String sellerDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Seller".equalsIgnoreCase(user.getRole())) {
            return "redirect:/";
        }
        model.addAttribute("profileUser", user);
        model.addAttribute("userInfoDisplay", user.displayUserInfo());
        model.addAttribute("myListings", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("inventory", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("currentUri", "/seller-dashboard");
        return "seller-dashboard";
    }

    @GetMapping("/dealer-dashboard")
    public String dealerDashboard(HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Dealer".equalsIgnoreCase(user.getRole())) {
            return "redirect:/";
        }
        model.addAttribute("profileUser", user);
        model.addAttribute("userInfoDisplay", user.displayUserInfo());
        model.addAttribute("myListings", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("inventory", carDAO.getCarsBySellerId(user.getUserId()));
        model.addAttribute("currentUri", "/dealer-dashboard");
        return "dealer-dashboard";
    }

    private User resolveTargetUser(String userId, HttpSession session) {
        if (userId != null) {
            return userDAO.getUserById(userId);
        }
        return (User) session.getAttribute("user");
    }
}
