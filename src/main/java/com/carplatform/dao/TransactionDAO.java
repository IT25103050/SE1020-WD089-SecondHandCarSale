package com.carplatform.dao;

import com.carplatform.model.Transaction;
import com.carplatform.util.FileHandler;
import jakarta.servlet.ServletContext;
import org.springframework.stereotype.Repository;

import java.util.ArrayList;
import java.util.List;

@Repository
public class TransactionDAO {

    private final String filePath;

    public TransactionDAO(ServletContext servletContext) {
        this.filePath = servletContext.getRealPath("/WEB-INF/data/transactions.txt");
    }

    public List<Transaction> getAllTransactions() {
        List<String> lines = FileHandler.readAllLines(filePath);
        List<Transaction> transactions = new ArrayList<>();
        for (String line : lines) {
            if (line == null || line.trim().isEmpty()) continue;
            String[] parts = line.split("\\|");
            if (parts.length < 8) continue;
            {
                String transactionId = safeGet(parts, 0);
                String buyerId = safeGet(parts, 1);
                String carId = safeGet(parts, 2);
                String sellerId = safeGet(parts, 3);
                String requestDate = safeGet(parts, 4);
                String transactionStatus = safeGet(parts, 5);
                String paymentMethod = safeGet(parts, 6);
                String paymentStatus = safeGet(parts, 7);

                Transaction t = new Transaction(transactionId, buyerId, carId, sellerId,
                                                requestDate, transactionStatus, paymentMethod, paymentStatus);
                transactions.add(t);
            }
        }
        return transactions;
    }

    public Transaction getTransactionById(String transactionId) {
        if (transactionId == null) return null;
        for (Transaction t : getAllTransactions()) {
            if (transactionId.equalsIgnoreCase(t.getTransactionId())) {
                return t;
            }
        }
        return null;
    }

    public List<Transaction> getTransactionsByBuyerId(String buyerId) {
        List<Transaction> list = new ArrayList<>();
        if (buyerId == null) return list;
        for (Transaction t : getAllTransactions()) {
            if (buyerId.equalsIgnoreCase(t.getBuyerId())) {
                list.add(t);
            }
        }
        return list;
    }

    public List<Transaction> getTransactionsBySellerId(String sellerId) {
        List<Transaction> list = new ArrayList<>();
        if (sellerId == null) return list;
        for (Transaction t : getAllTransactions()) {
            if (sellerId.equalsIgnoreCase(t.getSellerId())) {
                list.add(t);
            }
        }
        return list;
    }

    public void saveTransaction(Transaction t) {
        if (t == null) return;
        FileHandler.writeLine(filePath, t.toFileString());
    }

    public void updateTransaction(Transaction updatedTransaction) {
        if (updatedTransaction == null || updatedTransaction.getTransactionId() == null) return;
        List<Transaction> list = getAllTransactions();
        List<String> newLines = new ArrayList<>();
        for (Transaction t : list) {
            if (t.getTransactionId().equalsIgnoreCase(updatedTransaction.getTransactionId())) {
                newLines.add(updatedTransaction.toFileString());
            } else {
                newLines.add(t.toFileString());
            }
        }
        FileHandler.overwriteFile(filePath, newLines);
    }

    private String safeGet(String[] parts, int index) {
        return index < parts.length ? parts[index].trim() : "";
    }

    public void updateTransactionStatus(String transactionId, String status) {
        Transaction t = getTransactionById(transactionId);
        if (t != null) {
            t.setTransactionStatus(status);
            updateTransaction(t);
        }
    }

    public void updatePaymentStatus(String transactionId, String paymentStatus) {
        Transaction t = getTransactionById(transactionId);
        if (t != null) {
            t.setPaymentStatus(paymentStatus);
            updateTransaction(t);
        }
    }

    public void cancelTransaction(String transactionId) {
        updateTransactionStatus(transactionId, "CANCELLED");
    }

    public int getPendingTransactionsCount() {
        int count = 0;
        for (Transaction t : getAllTransactions()) {
            if ("PENDING".equalsIgnoreCase(t.getTransactionStatus())) count++;
        }
        return count;
    }

    public int getCompletedTransactionsCount() {
        int count = 0;
        for (Transaction t : getAllTransactions()) {
            if ("COMPLETED".equalsIgnoreCase(t.getTransactionStatus())) count++;
        }
        return count;
    }
}
