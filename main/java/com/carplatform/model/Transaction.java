package com.carplatform.model;

public class Transaction {
    // OOP Concept: Encapsulation - Private fields to protect data integrity.
    private String transactionId;
    
    // OOP Concept: Aggregation / Association
    // Transaction 'has-a' Buyer, Car, and Seller. Instead of storing entire objects,
    // it stores their IDs to represent the relationship (weak aggregation).
    private String buyerId;
    private String carId;
    private String sellerId;
    private String requestDate;
    private String transactionStatus; // PENDING, COMPLETED, CANCELLED
    private String paymentMethod; // Cash, Online
    private String paymentStatus; // PENDING, COMPLETED

    // OOP Concept: Default Constructor
    // Provides a way to instantiate a Transaction object without parameters.
    public Transaction() {
    }

    // OOP Concept: Parameterized Constructor
    // Overloaded constructor to instantiate a Transaction with specific data.
    public Transaction(String transactionId, String buyerId, String carId, String sellerId,
                       String requestDate, String transactionStatus, String paymentMethod, String paymentStatus) {
        this.transactionId = transactionId;
        this.buyerId = buyerId;
        this.carId = carId;
        this.sellerId = sellerId;
        this.requestDate = requestDate;
        this.transactionStatus = transactionStatus;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
    }

    public String getTransactionId() { return transactionId; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }

    public String getBuyerId() { return buyerId; }
    public void setBuyerId(String buyerId) { this.buyerId = buyerId; }

    public String getCarId() { return carId; }
    public void setCarId(String carId) { this.carId = carId; }

    public String getSellerId() { return sellerId; }
    public void setSellerId(String sellerId) { this.sellerId = sellerId; }

    public String getRequestDate() { return requestDate; }
    public void setRequestDate(String requestDate) { this.requestDate = requestDate; }

    public String getTransactionStatus() { return transactionStatus; }
    public void setTransactionStatus(String transactionStatus) { this.transactionStatus = transactionStatus; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String toFileString() {
        return String.join("|",
            transactionId != null ? transactionId : "",
            buyerId != null ? buyerId : "",
            carId != null ? carId : "",
            sellerId != null ? sellerId : "",
            requestDate != null ? requestDate : "",
            transactionStatus != null ? transactionStatus : "",
            paymentMethod != null ? paymentMethod : "",
            paymentStatus != null ? paymentStatus : ""
        );
    }
}
