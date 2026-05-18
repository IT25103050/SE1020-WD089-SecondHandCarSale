package com.carplatform.dao;

import com.carplatform.model.*;
import com.carplatform.util.FileHandler;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class ReviewDAO {

    private static final String FILE_PATH = "src/main/webapp/WEB-INF/data/reviews.txt";

    public List<Review> getAllReviews() {
        List<String> lines = FileHandler.readAllLines(FILE_PATH);
        List<Review> reviews = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.trim().isEmpty()) continue;
            String[] parts = line.split("\\|");
            if (parts.length < 8) continue;
            {
                String reviewId = safeGet(parts, 0);
                String buyerId = safeGet(parts, 1);
                String carId = safeGet(parts, 2);
                String sellerId = safeGet(parts, 3);
                int rating = safeGetInt(parts, 4, 5);
                String comment = safeGet(parts, 5);
                String reviewType = safeGet(parts, 6);
                String createdAt = safeGet(parts, 7);

                Review r;
                if ("SELLER".equalsIgnoreCase(reviewType)) {
                    r = new SellerReview(reviewId, buyerId, carId, sellerId, rating, comment, createdAt);
                } else {
                    r = new CarReview(reviewId, buyerId, carId, sellerId, rating, comment, createdAt);
                }
                reviews.add(r);
            }
        }
        return reviews;
    }

    public Review getReviewById(String reviewId) {
        if (reviewId == null) return null;
        for (Review r : getAllReviews()) {
            if (reviewId.equalsIgnoreCase(r.getReviewId())) {
                return r;
            }
        }
        return null;
    }

    public List<Review> getReviewsByCarId(String carId) {
        List<Review> list = new ArrayList<>();
        if (carId == null) return list;
        for (Review r : getAllReviews()) {
            if ("CAR".equalsIgnoreCase(r.getReviewType()) && carId.equalsIgnoreCase(r.getCarId())) {
                list.add(r);
            }
        }
        return list;
    }

    public List<Review> getReviewsBySellerId(String sellerId) {
        List<Review> list = new ArrayList<>();
        if (sellerId == null) return list;
        for (Review r : getAllReviews()) {
            if ("SELLER".equalsIgnoreCase(r.getReviewType()) && sellerId.equalsIgnoreCase(r.getSellerId())) {
                list.add(r);
            }
        }
        return list;
    }

    public void saveReview(Review r) {
        if (r == null) return;
        FileHandler.writeLine(FILE_PATH, r.toFileString());
    }

    public void deleteReview(String reviewId) {
        if (reviewId == null) return;
        List<Review> list = getAllReviews();
        List<String> newLines = new ArrayList<>();
        for (Review r : list) {
            if (!r.getReviewId().equalsIgnoreCase(reviewId)) {
                newLines.add(r.toFileString());
            }
        }
        FileHandler.overwriteFile(FILE_PATH, newLines);
    }

    private String safeGet(String[] parts, int index) {
        return index < parts.length ? parts[index].trim() : "";
    }

    private int safeGetInt(String[] parts, int index, int defaultVal) {
        String val = safeGet(parts, index);
        try {
            return val.isEmpty() ? defaultVal : Integer.parseInt(val);
        } catch (NumberFormatException e) {
            return defaultVal;
        }
    }

    public double calculateCarAverageRating(String carId) {
        List<Review> reviews = getReviewsByCarId(carId);
        if (reviews.isEmpty()) return 0.0;
        int total = 0;
        for (Review review : reviews) total += review.getRating();
        return (double) total / reviews.size();
    }

    public double calculateSellerAverageRating(String sellerId) {
        List<Review> reviews = getReviewsBySellerId(sellerId);
        if (reviews.isEmpty()) return 0.0;
        int total = 0;
        for (Review review : reviews) total += review.getRating();
        return (double) total / reviews.size();
    }

    public boolean hasBuyerReviewed(String buyerId, String carId, String sellerId, String reviewType) {
        for (Review review : getAllReviews()) {
            if (buyerId.equalsIgnoreCase(review.getBuyerId())
                    && carId.equalsIgnoreCase(review.getCarId())
                    && sellerId.equalsIgnoreCase(review.getSellerId())
                    && reviewType.equalsIgnoreCase(review.getReviewType())) {
                return true;
            }
        }
        return false;
    }

    public void updateReview(String reviewId, int newRating, String newComment) {
        if (reviewId == null) return;

        List<Review> list = getAllReviews();
        List<String> newLines = new ArrayList<>();

        for (Review r : list) {
            if (r.getReviewId().equalsIgnoreCase(reviewId)) {
                // Update the fields on the existing object
                r.setRating(newRating);
                r.setComment(newComment.trim());
            }
            // Save the updated (or unchanged) record back to the line compilation list
            newLines.add(r.toFileString());
        }

        // Overwrite the file with the updated records
        FileHandler.overwriteFile(FILE_PATH, newLines);
    }
}
