package com.carplatform.controller;

import com.carplatform.dao.*;
import com.carplatform.model.*;
import com.carplatform.util.*;
import jakarta.servlet.ServletContext;
import jakarta.servlet.http.HttpSession;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@com.carplatform.controller.Controller
public class TransactionController {

    private final TransactionDAO transactionDAO;
    private final PaymentDAO paymentDAO;
    private final ServletContext servletContext;
    private static final String TXN_DATA = "/WEB-INF/data/transactions.txt";
    private static final String PAY_DATA = "/WEB-INF/data/payments.txt";

    public TransactionController(TransactionDAO transactionDAO, PaymentDAO paymentDAO, ServletContext servletContext) {
        this.transactionDAO = transactionDAO;
        this.paymentDAO = paymentDAO;
        this.servletContext = servletContext;
    }

    @GetMapping("/")
    public String index() {
        return "redirect:/transactions";
    }

    @GetMapping("/ping")
    @ResponseBody
    public String ping() {
        return "Spring is alive!";
    }

    @GetMapping("/transactions")
    public String viewTransactions(HttpSession session, Model model) {
        // Simplified: Return all transactions if no specific user filter is possible
        List<Transaction> list = transactionDAO.getAllTransactions();
        model.addAttribute("transactions", list);
        model.addAttribute("currentUri", "/dashboard");
        return "transactions";
    }

    @GetMapping("/manage-transactions")
    public String manageTransactions(Model model) {
        List<Transaction> list = transactionDAO.getAllTransactions();
        model.addAttribute("transactions", list);
        model.addAttribute("currentUri", "/manage-transactions");
        return "manage-transactions";
    }

    @GetMapping("/transaction-details")
    public String viewTransactionDetails(@RequestParam("transactionId") String transactionId, HttpSession session, Model model) {
        Transaction t = transactionDAO.getTransactionById(transactionId);
        if (t == null) return "redirect:/transactions";

        Payment payment = paymentDAO.getPaymentByTransactionId(transactionId);

        model.addAttribute("transaction", t);
        model.addAttribute("payment", payment);
        model.addAttribute("currentUri", "/dashboard");
        return "transaction-details";
    }

    @PostMapping("/transactions")
    public String createTransaction(@RequestParam("carId") String carId,
                                    @RequestParam("buyerId") String buyerId,
                                    @RequestParam("sellerId") String sellerId,
                                    @RequestParam("price") double price,
                                    @RequestParam("paymentMethod") String paymentMethod,
                                    Model model) {
        
        String txnFilePath = servletContext.getRealPath(TXN_DATA);
        String payFilePath = servletContext.getRealPath(PAY_DATA);

        String txnId = IDGenerator.generateTransactionId(txnFilePath);
        String reqDate = java.time.LocalDate.now().toString();
        String chosenMethod = ValidationUtil.isEmpty(paymentMethod) ? "Online" : paymentMethod.trim();

        Payment payment;
        String initialPaymentStatus;
        String payId = IDGenerator.generatePaymentId(payFilePath);

        if ("Cash".equalsIgnoreCase(chosenMethod)) {
            payment = new CashPayment(payId, txnId, "PENDING", reqDate);
            payment.processPayment(price); 
            initialPaymentStatus = "PENDING";
        } else {
            payment = new OnlinePayment(payId, txnId, "COMPLETED", reqDate);
            payment.processPayment(price);
            initialPaymentStatus = "COMPLETED";
        }

        String txnStatus = "Cash".equalsIgnoreCase(chosenMethod) ? "PENDING" : "COMPLETED";

        Transaction t = new Transaction(txnId, buyerId, carId, sellerId, reqDate, txnStatus, chosenMethod, initialPaymentStatus);
        transactionDAO.saveTransaction(t);
        paymentDAO.savePayment(payment);

        return "redirect:/transaction-details?transactionId=" + txnId;
    }

    @PostMapping("/simulate-payment")
    public String simulatePayment(@RequestParam("transactionId") String transactionId) {
        Transaction t = transactionDAO.getTransactionById(transactionId);
        if (t != null) {
            t.setPaymentStatus("COMPLETED");
            t.setTransactionStatus("COMPLETED");
            transactionDAO.updateTransaction(t);

            Payment p = paymentDAO.getPaymentByTransactionId(transactionId);
            if (p != null) {
                p.setPaymentStatus("COMPLETED");
                paymentDAO.updatePayment(p);
            }
        }
        return "redirect:/transaction-details?transactionId=" + transactionId + "&verified=true";
    }

    @PostMapping("/cancel-transaction")
    public String cancelTransaction(@RequestParam("transactionId") String transactionId) {
        Transaction t = transactionDAO.getTransactionById(transactionId);
        if (t != null) {
            t.setTransactionStatus("CANCELLED");
            transactionDAO.updateTransaction(t);
        }
        return "redirect:/transactions?cancelled=true";
    }

    @PostMapping("/update-transaction")
    public String updateTransactionStatus(@RequestParam("transactionId") String transactionId,
                                          @RequestParam("transactionStatus") String status) {
        Transaction t = transactionDAO.getTransactionById(transactionId);
        if (t != null) {
            t.setTransactionStatus(status);
            transactionDAO.updateTransaction(t);
        }
        return "redirect:/transaction-details?transactionId=" + transactionId + "&updated=true";
    }
}
