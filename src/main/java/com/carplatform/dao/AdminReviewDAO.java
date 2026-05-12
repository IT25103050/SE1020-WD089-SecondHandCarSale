package com.carplatform.dao;

import com.carplatform.model.AdminReviewRecord;
import com.carplatform.util.FileHandler;
import java.util.ArrayList;
import java.util.List;

public class AdminReviewDAO {
    private final String REVIEWS_FILE;

    public AdminReviewDAO(String basePath) {
        REVIEWS_FILE = basePath + "/reviews.txt";
    }

    public List<AdminReviewRecord> getAllReviews() {
        List<AdminReviewRecord> reviews = new ArrayList<>();
        for (String line : FileHandler.readLines(REVIEWS_FILE)) {
            String[] p = line.split("\\|");
            if (p.length >= 8) {
                reviews.add(new AdminReviewRecord(p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]));
            }
        }
        return reviews;
    }

    public AdminReviewRecord getReviewById(String reviewId) {
        for (AdminReviewRecord r : getAllReviews()) {
            if (r.getReviewId().equals(reviewId)) return r;
        }
        return null;
    }

    public void deleteReview(String reviewId) {
        List<String> lines = FileHandler.readLines(REVIEWS_FILE);
        List<String> newLines = new ArrayList<>();
        for (String line : lines) {
            if (!line.startsWith(reviewId + "|")) {
                newLines.add(line);
            }
        }
        FileHandler.writeLines(REVIEWS_FILE, newLines);
    }
}
