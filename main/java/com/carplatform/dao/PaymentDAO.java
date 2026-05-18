package com.carplatform.dao;

import com.carplatform.model.*;
import com.carplatform.util.FileHandler;
import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class PaymentDAO {

    private final ServletContext servletContext;
    private static final String DATA_PATH = "/WEB-INF/data/payments.txt";

    public PaymentDAO(ServletContext servletContext) {
        this.servletContext = servletContext;
    }

    private String getFilePath() {
        return servletContext.getRealPath(DATA_PATH);
    }

    public List<Payment> getAllPayments() {
        List<String> lines = FileHandler.readAllLines(getFilePath());
        List<Payment> payments = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.trim().isEmpty()) continue;
            String[] parts = line.split("\\|");
            if (parts.length < 5) continue;
            {
                String paymentId = safeGet(parts, 0);
                String transactionId = safeGet(parts, 1);
                String paymentMethod = safeGet(parts, 2);
                String paymentStatus = safeGet(parts, 3);
                String paymentDate = safeGet(parts, 4);

                Payment p;
                if ("Cash".equalsIgnoreCase(paymentMethod)) {
                    p = new CashPayment(paymentId, transactionId, paymentStatus, paymentDate);
                } else {
                    p = new OnlinePayment(paymentId, transactionId, paymentStatus, paymentDate);
                }
                payments.add(p);
            }
        }
        return payments;
    }

    public Payment getPaymentById(String paymentId) {
        if (paymentId == null) return null;
        for (Payment p : getAllPayments()) {
            if (paymentId.equalsIgnoreCase(p.getPaymentId())) {
                return p;
            }
        }
        return null;
    }

    public Payment getPaymentByTransactionId(String transactionId) {
        if (transactionId == null) return null;
        for (Payment p : getAllPayments()) {
            if (transactionId.equalsIgnoreCase(p.getTransactionId())) {
                return p;
            }
        }
        return null;
    }

    public void savePayment(Payment p) {
        if (p == null) return;
        FileHandler.writeLine(getFilePath(), p.toFileString());
    }

    public void updatePayment(Payment updatedPayment) {
        if (updatedPayment == null || updatedPayment.getPaymentId() == null) return;
        List<Payment> list = getAllPayments();
        List<String> newLines = new ArrayList<>();
        for (Payment p : list) {
            if (p.getPaymentId().equalsIgnoreCase(updatedPayment.getPaymentId())) {
                newLines.add(updatedPayment.toFileString());
            } else {
                newLines.add(p.toFileString());
            }
        }
        FileHandler.overwriteFile(getFilePath(), newLines);
    }

    private String safeGet(String[] parts, int index) {
        return index < parts.length ? parts[index].trim() : "";
    }

    public void updatePaymentStatus(String transactionId, String status) {
        Payment payment = getPaymentByTransactionId(transactionId);
        if (payment != null) {
            payment.setPaymentStatus(status);
            updatePayment(payment);
        }
    }
}
