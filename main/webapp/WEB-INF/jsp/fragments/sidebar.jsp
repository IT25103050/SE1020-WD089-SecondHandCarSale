<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>
<div class="sidebar-glass h-100 rounded-start">
    <div class="px-3 mb-4">
        <span class="text-uppercase fw-bold text-danger fs-6 tracking-wide">Transaction Hub</span>
    </div>
    <nav class="nav flex-column">
        <div class="px-3 mt-2 mb-2">
            <span class="text-uppercase fw-bold text-secondary fs-7">Operations</span>
        </div>
        <a class="nav-link d-flex align-items-center gap-2 ${currentUri == '/transactions' ? 'active' : ''}" href="${pageContext.request.contextPath}/transactions">
            <i class="bi bi-receipt"></i> Transaction History
        </a>
        <a class="nav-link d-flex align-items-center gap-2" href="${pageContext.request.contextPath}/manage-transactions">
            <i class="bi bi-cash-stack"></i> All Transactions
        </a>
    </nav>
</div>
