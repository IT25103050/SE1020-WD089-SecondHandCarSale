package com.carsales.platform;

import jakarta.persistence.*;
import java.time.LocalDateTime;


    @Entity
    @Table(name = "reviews")
    public class Review {

        @Id
        @GeneratedValue(strategy = GenerationType.IDENTITY)
        @Column(name = "review_id")
        private Long id;

        @Column(name = "car_id")
        private Long carId;
        @Column(name = "user_id")
        private Long userId;
        private int rating;
        private String comment;

        @Column(name = "created_at")
        private LocalDateTime createdAt = LocalDateTime.now();

        public Long getId() { return id; }
        public void setId(Long id) { this.id = id; }

        public Long getCarId() { return carId; }
        public void setCarId(Long carId) { this.carId = carId; }

        public Long getUserId() { return userId; }
        public void setUserId(Long userId) { this.userId = userId; }

        public int getRating() { return rating; }
        public void setRating(int rating) { this.rating = rating; }

        public String getComment() { return comment; }
        public void setComment(String comment) { this.comment = comment; }

        public LocalDateTime getCreatedAt() {
            return createdAt;
        }

        public void setCreatedAt(LocalDateTime createdAt) {
            this.createdAt = createdAt;
        }


    }
