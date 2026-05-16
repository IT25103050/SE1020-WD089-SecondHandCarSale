package com.carplatform.model;

// OOP Concept: Abstraction - Base abstract class for reviews (CarReview, SellerReview).
public class Review {
    // OOP Concept: Encapsulation
    private String reviewId;
    
    // OOP Concept: Aggregation / Association
    // A Review 'has-a' relationship with Buyer, Car, and Seller (via IDs).
    private String buyerId;
    private String carId;
    private String sellerId;
    private int rating; // 1-5
    private String comment;
    private String reviewType; // CAR, SELLER
    private String createdAt;

    // OOP Concept: Default Constructor
    // Part of Constructor Overloading.
    public Review() {
    }

    public Review(String reviewId, String buyerId, String carId, String sellerId,
                  int rating, String comment, String reviewType, String createdAt) {
        this.reviewId = reviewId;
        this.buyerId = buyerId;
        this.carId = carId;
        this.sellerId = sellerId;
        this.rating = rating;
        this.comment = comment;
        this.reviewType = reviewType;
        this.createdAt = createdAt;
    }

    public String getReviewId() { return reviewId; }
    public void setReviewId(String reviewId) { this.reviewId = reviewId; }

    public String getBuyerId() { return buyerId; }
    public void setBuyerId(String buyerId) { this.buyerId = buyerId; }

    public String getCarId() { return carId; }
    public void setCarId(String carId) { this.carId = carId; }

    public String getSellerId() { return sellerId; }
    public void setSellerId(String sellerId) { this.sellerId = sellerId; }

    public int getRating() { return rating; }
    public void setRating(int rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getReviewType() { return reviewType; }
    public void setReviewType(String reviewType) { this.reviewType = reviewType; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }

    // OOP Concept: Abstraction
    // Abstract method to be implemented by subclasses.
    public String displayReview() {
        return "Rating: " + rating + "/5 - " + comment;
    }

    public String toFileString() {
        return String.join("|",
            reviewId != null ? reviewId : "",
            buyerId != null ? buyerId : "",
            carId != null ? carId : "",
            sellerId != null ? sellerId : "",
            String.valueOf(rating),
            comment != null ? comment : "",
            reviewType != null ? reviewType : "",
            createdAt != null ? createdAt : ""
        );
    }
}
