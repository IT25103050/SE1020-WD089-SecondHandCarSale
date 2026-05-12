package com.carplatform.model;

public class AdminReviewRecord {
    private String reviewId;
    private String buyerId;
    private String carId;
    private String sellerId;
    private String rating;
    private String comment;
    private String reviewType;
    private String createdAt;

    public AdminReviewRecord(String reviewId, String buyerId, String carId, String sellerId, String rating, String comment, String reviewType, String createdAt) {
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

    public String getRating() { return rating; }
    public void setRating(String rating) { this.rating = rating; }

    public String getComment() { return comment; }
    public void setComment(String comment) { this.comment = comment; }

    public String getReviewType() { return reviewType; }
    public void setReviewType(String reviewType) { this.reviewType = reviewType; }

    public String getCreatedAt() { return createdAt; }
    public void setCreatedAt(String createdAt) { this.createdAt = createdAt; }
}
