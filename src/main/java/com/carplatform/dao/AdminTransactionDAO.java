package com.carplatform.dao;

import com.carplatform.model.AdminTransactionRecord;
import com.carplatform.util.FileHandler;
import java.util.ArrayList;
import java.util.List;

public class AdminTransactionDAO {
    private final String TRANSACTIONS_FILE;

    public AdminTransactionDAO(String basePath) {
        TRANSACTIONS_FILE = basePath + "/transactions.txt";
    }

    public List<AdminTransactionRecord> getAllTransactions() {
        List<AdminTransactionRecord> txs = new ArrayList<>();
        for (String line : FileHandler.readLines(TRANSACTIONS_FILE)) {
            String[] p = line.split("\\|");
            if (p.length >= 8) {
                txs.add(new AdminTransactionRecord(p[0], p[1], p[2], p[3], p[4], p[5], p[6], p[7]));
            }
        }
        return txs;
    }

    public AdminTransactionRecord getTransactionById(String transactionId) {
        for (AdminTransactionRecord t : getAllTransactions()) {
            if (t.getTransactionId().equals(transactionId)) return t;
        }
        return null;
    }

    public void updateTransactionStatus(String transactionId, String status) {
        updateField(transactionId, 5, status);
    }

    public void updatePaymentStatus(String transactionId, String paymentStatus) {
        updateField(transactionId, 7, paymentStatus);
    }

    private void updateField(String transactionId, int index, String newValue) {
        List<String> lines = FileHandler.readLines(TRANSACTIONS_FILE);
        List<String> newLines = new ArrayList<>();
        for (String line : lines) {
            String[] p = line.split("\\|");
            if (p.length >= 8 && p[0].equals(transactionId)) {
                p[index] = newValue;
                newLines.add(String.join("|", p));
            } else {
                newLines.add(line);
            }
        }
        FileHandler.writeLines(TRANSACTIONS_FILE, newLines);
    }
}
