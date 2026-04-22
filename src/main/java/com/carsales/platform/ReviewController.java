package com.carsales.platform;

import org.springframework.web.bind.annotation.PathVariable;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;

@Controller
public class ReviewController {

    @Autowired
    private ReviewRepository reviewRepository; // This is our "Clerk" that talks to MySQL


    @GetMapping("/add-review")
    public String showForm(Model model) {
        model.addAttribute("review", new Review()); // Hand the user a blank form
        return "add-review";
    }


    @PostMapping("/save-review")
    public String saveReview(@ModelAttribute("review") Review review) {
        review.setUserId(1L); // Just for now, we pretend User #1 is logged in
        reviewRepository.save(review); // The Magic Line: This saves it to MySQL!
        return "redirect:/add-review?success";
    }


    @GetMapping("/reviews")
    public String viewReviews(Model model) {
        // We are getting the list from the database
        List<Review> list = reviewRepository.findAll();

        // We are naming the 'container' "allReviews"
        model.addAttribute("allReviews", list);

        // This MUST match the name of your HTML file exactly
        return "view-reviews";
    }

    @GetMapping("/delete-review/{id}")
    public String deleteReview(@PathVariable("id") Long id) {
        reviewRepository.deleteById(id);
        return "redirect:/reviews"; // After deleting, go back to the list
    }


    @GetMapping("/edit-review/{id}")
    public String showEditForm(@PathVariable("id") Long id, Model model) {
        Review review = reviewRepository.findById(id)
                .orElseThrow(() -> new IllegalArgumentException("Invalid review Id:" + id));
        model.addAttribute("review", review);
        return "edit-review";
    }


    @PostMapping("/update-review/{id}")
    public String updateReview(@PathVariable("id") Long id, @ModelAttribute("review") Review review) {
        // Keep the original ID so it overwrites the old row instead of creating a new one
        review.setId(id);
        reviewRepository.save(review);
        return "redirect:/reviews";
    }

}