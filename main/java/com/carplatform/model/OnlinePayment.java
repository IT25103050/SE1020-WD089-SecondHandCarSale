package com.carplatform.model;

// OOP Concept: Inheritance - OnlinePayment inherits attributes and behaviors from the Payment base class.
public class OnlinePayment extends Payment {

    // OOP Concept: Default Constructor
    // Calls the superclass's constructor.
    public OnlinePayment() {
        super();
        setPaymentMethod("Online");
    }

    // OOP Concept: Parameterized Constructor
    // Part of Constructor Overloading.
    public OnlinePayment(String paymentId, String transactionId, String paymentStatus, String paymentDate) {
        super(paymentId, transactionId, "Online", paymentStatus, paymentDate);
    }

    // OOP Concept: Polymorphism (Method Overriding)
    // Provides a concrete implementation for the abstract method defined in Payment.
    @Override
    public String processPayment(double amount) {
        setPaymentStatus("COMPLETED"); // Simulated instant gateway verification success
        return "Online payment of LKR " + String.format("%.2f", amount) + " completed successfully.";
    }
}
