package com.carplatform.controller;

import com.carplatform.dao.CarDAO;
import com.carplatform.model.User;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class HomeController {

    private final CarDAO carDAO;

    public HomeController(CarDAO carDAO) {
        this.carDAO = carDAO;
    }

    @GetMapping({"/", "/home"})
    public String index(Model model) {
        model.addAttribute("featuredCars", carDAO.getApprovedAvailableCars());
        model.addAttribute("currentUri", "/");
        return "index";
    }

    @GetMapping("/dev/login")
    public String devLogin(@RequestParam("role") String role, HttpSession session) {
        final String finalRole;
        final String finalFullName;
        final String finalUserId;
        
        if ("Admin".equalsIgnoreCase(role)) {
            finalUserId = "USR1004";
            finalFullName = "System Administrator";
            finalRole = "Admin";
        } else if ("Dealer".equalsIgnoreCase(role)) {
            finalUserId = "USR1003";
            finalFullName = "Sampath Dealers";
            finalRole = "Dealer";
        } else if ("Buyer".equalsIgnoreCase(role)) {
            finalUserId = "USR1001";
            finalFullName = "Ajith Perera";
            finalRole = "Buyer";
        } else {
            finalUserId = "USR1002";
            finalFullName = "Sunil Gamage";
            finalRole = "Seller";
        }
        
        User mockUser = new User() {
            @Override
            public String getDashboardName() { return finalRole + " Dashboard"; }
            @Override
            public String displayUserInfo() { return finalFullName + " (" + finalRole + ")"; }
        };
        mockUser.setUserId(finalUserId);
        mockUser.setFullName(finalFullName);
        mockUser.setRole(finalRole);
        mockUser.setEmail(finalRole.toLowerCase() + "@automart.com");
        
        session.setAttribute("user", mockUser);
        session.setAttribute("userId", finalUserId);
        session.setAttribute("fullName", finalFullName);
        session.setAttribute("role", finalRole);
        
        return "redirect:/";
    }

    @GetMapping("/logout")
    public String logout(HttpSession session) {
        session.invalidate();
        return "redirect:/";
    }

    @GetMapping("/login")
    public String login() {
        return "redirect:/";
    }
}
