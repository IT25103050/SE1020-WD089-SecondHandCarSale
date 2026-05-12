package com.carplatform.model;

public class AdminTransactionRecord {
    private String transactionId;
    private String buyerId;
    private String carId;
    private String sellerId;
    private String requestDate;
    private String transactionStatus;
    private String paymentMethod;
    private String paymentStatus;

    public AdminTransactionRecord(String transactionId, String buyerId, String carId, String sellerId, String requestDate, String transactionStatus, String paymentMethod, String paymentStatus) {
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
}
