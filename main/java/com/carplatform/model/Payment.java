package com.carplatform.model;

public abstract class Payment {
    private String paymentId;
    private String transactionId;
    private String paymentMethod; // Cash, Online
    private String paymentStatus; // PENDING, COMPLETED
    private String paymentDate;

    public Payment() {
    }

    public Payment(String paymentId, String transactionId, String paymentMethod,
                   String paymentStatus, String paymentDate) {
        this.paymentId = paymentId;
        this.transactionId = transactionId;
        this.paymentMethod = paymentMethod;
        this.paymentStatus = paymentStatus;
        this.paymentDate = paymentDate;
    }

    public String getPaymentId() { return paymentId; }
    public void setPaymentId(String paymentId) { this.paymentId = paymentId; }

    public String getTransactionId() { return transactionId; }
    public void setTransactionId(String transactionId) { this.transactionId = transactionId; }

    public String getPaymentMethod() { return paymentMethod; }
    public void setPaymentMethod(String paymentMethod) { this.paymentMethod = paymentMethod; }

    public String getPaymentStatus() { return paymentStatus; }
    public void setPaymentStatus(String paymentStatus) { this.paymentStatus = paymentStatus; }

    public String getPaymentDate() { return paymentDate; }
    public void setPaymentDate(String paymentDate) { this.paymentDate = paymentDate; }

    // OOP Concept: Abstraction
    // Abstract method to be overridden by subclasses (OnlinePayment, CashPayment).
    public abstract String processPayment(double amount);

    // OOP Concept: Polymorphism (Method Overloading)
    // Overloaded method with a different signature (adds currency parameter).
    public String processPayment(double amount, String currency) {
        return processPayment(amount) + " in " + currency;
    }

    public String toFileString() {
        return String.join("|",
            paymentId != null ? paymentId : "",
            transactionId != null ? transactionId : "",
            paymentMethod != null ? paymentMethod : "",
            paymentStatus != null ? paymentStatus : "",
            paymentDate != null ? paymentDate : ""
        );
    }
}
