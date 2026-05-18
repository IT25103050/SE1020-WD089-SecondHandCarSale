package com.carplatform.model;

public class SellerReview extends Review {

    public SellerReview() {
        super();
        setReviewType("SELLER");
    }

    public SellerReview(String reviewId, String buyerId, String carId, String sellerId,
                        int rating, String comment, String createdAt) {
        super(reviewId, buyerId, carId, sellerId, rating, comment, "SELLER", createdAt);
    }

    @Override
    public String displayReview() {
        return "Merchant/Dealer Credibility Assessment [Rating: " + getRating() + "/5 Stars] - " + getComment();
    }
}
