package com.carplatform.servlet;

import com.carplatform.dao.AdminTransactionDAO;
import com.carplatform.model.AdminTransactionRecord;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet("/manage-transactions")
public class ManageTransactionsServlet extends HttpServlet {
    private AdminTransactionDAO adminTransactionDAO;

    @Override
    public void init() throws ServletException {
        String basePath = getServletContext().getRealPath("/WEB-INF/data");
        adminTransactionDAO = new AdminTransactionDAO(basePath);
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<AdminTransactionRecord> transactions = adminTransactionDAO.getAllTransactions();
        request.setAttribute("transactions", transactions);
        request.getRequestDispatcher("/manage-transactions.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String action = request.getParameter("action");
        String transactionId = request.getParameter("transactionId");

        if (action != null && transactionId != null) {
            if ("updateStatus".equals(action)) {
                String status = request.getParameter("transactionStatus");
                if (status != null && !status.isEmpty()) {
                    adminTransactionDAO.updateTransactionStatus(transactionId, status);
                }
            } else if ("updatePayment".equals(action)) {
                String paymentStatus = request.getParameter("paymentStatus");
                if (paymentStatus != null && !paymentStatus.isEmpty()) {
                    adminTransactionDAO.updatePaymentStatus(transactionId, paymentStatus);
                }
            }
        }
        response.sendRedirect(request.getContextPath() + "/manage-transactions");
    }
}
