package com.carplatform.model;

public class CashPayment extends Payment {

    public CashPayment() {
        super();
        setPaymentMethod("Cash");
    }

    public CashPayment(String paymentId, String transactionId, String paymentStatus, String paymentDate) {
        super(paymentId, transactionId, "Cash", paymentStatus, paymentDate);
    }

    @Override
    public String processPayment(double amount) {
        setPaymentStatus("PENDING"); // Requires manual admin or seller approval upon cash verification
        return "Cash payment of LKR " + String.format("%.2f", amount) + " initialized. Pending physical verification.";
    }
}
