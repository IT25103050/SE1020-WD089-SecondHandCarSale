package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import com.carplatform.util.*;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

@Controller
public class ReviewController {

    private final ReviewDAO reviewDAO;
    private final CarDAO carDAO;
    private final UserDAO userDAO;
    private final TransactionDAO transactionDAO;
    private static final String FILE_PATH = "src/main/webapp/WEB-INF/data/reviews.txt";

    public ReviewController(ReviewDAO reviewDAO, CarDAO carDAO, UserDAO userDAO, TransactionDAO transactionDAO) {
        this.reviewDAO = reviewDAO;
        this.carDAO = carDAO;
        this.userDAO = userDAO;
        this.transactionDAO = transactionDAO;
    }

    @GetMapping("/reviews")
    public String listReviews(Model model) {
        model.addAttribute("reviews", reviewDAO.getAllReviews());
        model.addAttribute("currentUri", "/dashboard");
        return "reviews";
    }

    @GetMapping("/add-review")
    public String showAddReviewForm(@RequestParam(value = "carId", required = false) String carId,
                                    @RequestParam(value = "sellerId", required = false) String sellerId,
                                    HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        if (!"Buyer".equalsIgnoreCase(user.getRole())) {
            return "redirect:/reviews?error=onlyBuyer";
        }

        if (!ValidationUtil.isEmpty(carId)) {
            model.addAttribute("targetCar", carDAO.getCarById(carId));
            model.addAttribute("reviewType", "CAR");
        } else if (!ValidationUtil.isEmpty(sellerId)) {
            model.addAttribute("targetSeller", userDAO.getUserById(sellerId));
            model.addAttribute("reviewType", "SELLER");
        } else {
            return "redirect:/cars";
        }

        model.addAttribute("currentUri", "/dashboard");
        return "add-review";
    }

    @PostMapping("/add-review")
    public String processAddReview(@RequestParam("reviewType") String reviewType,
                                   @RequestParam(value = "carId", required = false) String carId,
                                   @RequestParam(value = "sellerId", required = false) String sellerId,
                                   @RequestParam("rating") int rating,
                                   @RequestParam("comment") String comment,
                                   HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/login";

        if (!"Buyer".equalsIgnoreCase(user.getRole())) {
            return "redirect:/reviews?error=onlyBuyer";
        }

        String revId = IDGenerator.generateReviewId(FILE_PATH);
        String createdAt = java.time.LocalDate.now().toString();
        int safeRating = ValidationUtil.isValidRating(rating) ? rating : 5;

        Review review;
        String targetSellerId;

        if ("SELLER".equalsIgnoreCase(reviewType)) {
            targetSellerId = sellerId != null ? sellerId : "";
            if (!hasCompletedTransaction(user.getUserId(), "", targetSellerId)) {
                return "redirect:/reviews?error=noCompletedTransaction";
            }
            if (reviewDAO.hasBuyerReviewed(user.getUserId(), "", targetSellerId, "SELLER")) {
                return "redirect:/reviews?error=alreadyReviewed";
            }
            review = new SellerReview(revId, user.getUserId(), "", targetSellerId, safeRating, comment.trim(), createdAt);
        } else {
            Car car = carDAO.getCarById(carId);
            targetSellerId = car != null ? car.getSellerId() : "";
            if (!hasCompletedTransaction(user.getUserId(), carId != null ? carId : "", targetSellerId)) {
                return "redirect:/reviews?error=noCompletedTransaction";
            }
            if (reviewDAO.hasBuyerReviewed(user.getUserId(), carId != null ? carId : "", targetSellerId, "CAR")) {
                return "redirect:/reviews?error=alreadyReviewed";
            }
            review = new CarReview(revId, user.getUserId(), carId, targetSellerId, safeRating, comment.trim(), createdAt);
        }

        reviewDAO.saveReview(review);

        if ("CAR".equalsIgnoreCase(reviewType) && !ValidationUtil.isEmpty(carId)) {
            return "redirect:/car-details?carId=" + carId + "&reviewed=true";
        }
        return "redirect:/reviews?added=true";
    }

    @PostMapping("/delete-review")
    public String deleteReview(@RequestParam("reviewId") String reviewId, HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null || !"Admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/login";
        }

        reviewDAO.deleteReview(reviewId);
        return "redirect:/manage-reviews?deleted=true";
    }

    private boolean hasCompletedTransaction(String buyerId, String carId, String sellerId) {
        for (Transaction t : transactionDAO.getTransactionsByBuyerId(buyerId)) {
            boolean sameCar = carId != null && carId.equalsIgnoreCase(t.getCarId());
            boolean sameSeller = sellerId != null && sellerId.equalsIgnoreCase(t.getSellerId());
            boolean completed = "COMPLETED".equalsIgnoreCase(t.getTransactionStatus());
            if (completed && (sameCar || sameSeller)) {
                return true;
            }
        }
        return false;
    }

    // 1. GET route to display the edit form with existing review data
    @GetMapping("/edit-review")
    public String showEditReviewForm(@RequestParam("reviewId") String reviewId, HttpSession session, Model model) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/reviews?error=loginRequired";

        Review review = reviewDAO.getReviewById(reviewId);
        if (review == null) return "redirect:/reviews?error=notFound";

        // Security check: Only the buyer who wrote it (or an Admin) can modify it
        if (!user.getUserId().equalsIgnoreCase(review.getBuyerId()) && !"Admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/reviews?error=unauthorized";
        }

        model.addAttribute("review", review);
        model.addAttribute("currentUri", "/reviews");
        return "edit-review";
    }

    // 2. POST route to save the updated review records
    @PostMapping("/edit-review")
    public String processEditReview(@RequestParam("reviewId") String reviewId,
                                    @RequestParam("rating") int rating,
                                    @RequestParam("comment") String comment,
                                    HttpSession session) {
        User user = (User) session.getAttribute("user");
        if (user == null) return "redirect:/reviews?error=loginRequired";

        Review review = reviewDAO.getReviewById(reviewId);
        if (review == null) return "redirect:/reviews?error=notFound";

        // Double security validation
        if (!user.getUserId().equalsIgnoreCase(review.getBuyerId()) && !"Admin".equalsIgnoreCase(user.getRole())) {
            return "redirect:/reviews?error=unauthorized";
        }

        int safeRating = com.carplatform.util.ValidationUtil.isValidRating(rating) ? rating : 5;

        // Call DAO layer to overwrite files
        reviewDAO.updateReview(reviewId, safeRating, comment);

        return "redirect:/reviews?updated=true";
    }
}
