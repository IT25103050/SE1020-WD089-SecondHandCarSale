package com.carplatform.model;

public class CarReview extends Review {

    public CarReview() {
        super();
        setReviewType("CAR");
    }

    public CarReview(String reviewId, String buyerId, String carId, String sellerId,
                     int rating, String comment, String createdAt) {
        super(reviewId, buyerId, carId, sellerId, rating, comment, "CAR", createdAt);
    }

    @Override
    public String displayReview() {
        return "Vehicle Assessment [Rating: " + getRating() + "/5 Stars] - " + getComment();
    }
}
