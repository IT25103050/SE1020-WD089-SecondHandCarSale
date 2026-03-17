<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = (String) request.getAttribute("error");

    String userCode = request.getParameter("userCode") != null ? request.getParameter("userCode") : "";
    String firstName = request.getParameter("firstName") != null ? request.getParameter("firstName") : "";
    String lastName = request.getParameter("lastName") != null ? request.getParameter("lastName") : "";
    String username = request.getParameter("username") != null ? request.getParameter("username") : "";
    String email = request.getParameter("email") != null ? request.getParameter("email") : "";
    String phone = request.getParameter("phone") != null ? request.getParameter("phone") : "";
    String selectedRole = request.getParameter("role") != null ? request.getParameter("role") : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoVault - Register</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            color: #e5e7eb;
            overflow-x: hidden;
            position: relative;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }

        .bg-animation {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            overflow: hidden;
            z-index: 0;
        }

        .bg-animation span {
            position: absolute;
            display: block;
            width: 20px;
            height: 20px;
            background: rgba(255, 255, 255, 0.05);
            animation: float 25s linear infinite;
            bottom: -150px;
            border-radius: 50%;
        }

        .bg-animation span:nth-child(1) { left: 25%; width: 80px; height: 80px; animation-delay: 0s; }
        .bg-animation span:nth-child(2) { left: 10%; width: 20px; height: 20px; animation-delay: 2s; animation-duration: 12s; }
        .bg-animation span:nth-child(3) { left: 70%; width: 20px; height: 20px; animation-delay: 4s; }
        .bg-animation span:nth-child(4) { left: 40%; width: 60px; height: 60px; animation-delay: 0s; animation-duration: 18s; }
        .bg-animation span:nth-child(5) { left: 65%; width: 20px; height: 20px; animation-delay: 0s; }
        .bg-animation span:nth-child(6) { left: 75%; width: 110px; height: 110px; animation-delay: 3s; }
        .bg-animation span:nth-child(7) { left: 35%; width: 150px; height: 150px; animation-delay: 7s; }
        .bg-animation span:nth-child(8) { left: 50%; width: 25px; height: 25px; animation-delay: 15s; animation-duration: 45s; }
        .bg-animation span:nth-child(9) { left: 20%; width: 15px; height: 15px; animation-delay: 2s; animation-duration: 35s; }
        .bg-animation span:nth-child(10) { left: 85%; width: 150px; height: 150px; animation-delay: 0s; animation-duration: 11s; }

        @keyframes float {
            0% { transform: translateY(0) rotate(0deg); opacity: 1; border-radius: 50%; }
            100% { transform: translateY(-1000px) rotate(720deg); opacity: 0; border-radius: 50%; }
        }

        @keyframes logoBounce {
            0%, 100% { transform: scale(1) rotate(0deg); }
            25% { transform: scale(1.1) rotate(5deg); }
            75% { transform: scale(1.1) rotate(-5deg); }
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        @keyframes glowPulse {
            0%, 100% { box-shadow: 0 0 20px rgba(102, 126, 234, 0.4); }
            50% { box-shadow: 0 0 40px rgba(102, 126, 234, 0.7); }
        }

        @keyframes iconBounce {
            0%, 100% { transform: scale(1) rotate(0deg); }
            25% { transform: scale(1.2) rotate(-10deg); }
            75% { transform: scale(1.2) rotate(10deg); }
        }

        @keyframes orb1 {
            0% { transform: rotate(0deg) translateX(30px) rotate(0deg); }
            100% { transform: rotate(360deg) translateX(30px) rotate(-360deg); }
        }

        @keyframes orb2 {
            0% { transform: rotate(120deg) translateX(30px) rotate(-120deg); }
            100% { transform: rotate(480deg) translateX(30px) rotate(-480deg); }
        }

        @keyframes orb3 {
            0% { transform: rotate(240deg) translateX(30px) rotate(-240deg); }
            100% { transform: rotate(600deg) translateX(30px) rotate(-600deg); }
        }

        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            width: 100%;
            max-width: 700px;
            position: relative;
            z-index: 10;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 30px;
        }

        .logo {
            font-size: 60px;
            margin-bottom: 10px;
            animation: logoBounce 2s ease-in-out infinite;
        }

        .brand-name {
            font-size: 42px;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2, #f093fb);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            letter-spacing: -1px;
            animation: gradientFlow 3s ease infinite;
        }

        .tagline {
            font-size: 14px;
            color: #9ca3af;
            font-weight: 300;
            letter-spacing: 3px;
            text-transform: uppercase;
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.4), inset 0 0 80px rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(20px);
            overflow: hidden;
            opacity: 0;
            transform: translateY(30px);
            animation: formAppear 0.8s ease forwards;
            animation-delay: 100ms;
        }

        @keyframes formAppear {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        .card-header-custom {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.3), rgba(118, 75, 162, 0.3));
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 35px 25px;
            text-align: center;
            position: relative;
        }

        .card-header-custom::before {
            content: '';
            position: absolute;
            inset: 0;
            background-image: url("data:image/svg+xml,%3Csvg width='100' height='100' viewBox='0 0 100 100' xmlns='http://www.w3.org/2000/svg'%3E%3Cpath d='M11 18c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm48 25c3.866 0 7-3.134 7-7s-3.134-7-7-7-7 3.134-7 7 3.134 7 7 7zm-43-7c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm63 31c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM34 90c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zm56-76c1.657 0 3-1.343 3-3s-1.343-3-3-3-3 1.343-3 3 1.343 3 3 3zM12 86c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm28-65c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm23-11c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-6 60c2.21 0 4-1.79 4-4s-1.79-4-4-4-4 1.79-4 4 1.79 4 4 4zm29 22c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zM32 63c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm57-13c2.76 0 5-2.24 5-5s-2.24-5-5-5-5 2.24-5 5 2.24 5 5 5zm-9-21c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM60 91c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM35 41c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2zM12 60c1.105 0 2-.895 2-2s-.895-2-2-2-2 .895-2 2 .895 2 2 2z' fill='%23ffffff' fill-opacity='0.05' fill-rule='evenodd'/%3E%3C/svg%3E");
            animation: glowPulse 4s ease-in-out infinite;
            opacity: 0.5;
        }

        .card-header-custom h2 {
            position: relative;
            font-size: 28px;
            font-weight: 700;
            color: #ffffff;
            margin: 0;
        }

        .card-header-custom p {
            position: relative;
            color: #cbd5e1;
            font-size: 14px;
            margin: 10px 0 0;
        }

        .card-body-custom {
            padding: 35px 30px;
        }

        .form-group {
            margin-bottom: 24px;
            opacity: 0;
            transform: translateY(20px);
            animation: formAppear 0.6s ease forwards;
        }

        .form-group:nth-child(1) { animation-delay: 200ms; }
        .form-group:nth-child(2) { animation-delay: 300ms; }
        .form-group:nth-child(3) { animation-delay: 400ms; }
        .form-group:nth-child(4) { animation-delay: 500ms; }
        .form-group:nth-child(5) { animation-delay: 600ms; }
        .form-group:nth-child(6) { animation-delay: 700ms; }
        .form-group:nth-child(7) { animation-delay: 800ms; }
        .form-group:nth-child(8) { animation-delay: 900ms; }

        .form-label {
            display: block;
            color: #e5e7eb;
            font-weight: 600;
            margin-bottom: 8px;
            font-size: 14px;
        }

        .form-control {
            width: 100%;
            background: rgba(255, 255, 255, 0.06);
            border: 1px solid rgba(255, 255, 255, 0.12);
            color: #ffffff;
            border-radius: 14px;
            padding: 13px 15px;
            font-size: 16px;
            transition: all 0.3s ease;
        }

        .form-control:focus {
            background: rgba(255, 255, 255, 0.08);
            border-color: #667eea;
            box-shadow: 0 0 0 0.2rem rgba(102, 126, 234, 0.25);
            outline: none;
        }

        .form-control::placeholder {
            color: #94a3b8;
        }

        .password-wrapper {
            position: relative;
        }

        .password-toggle {
            position: absolute;
            right: 15px;
            top: 50%;
            transform: translateY(-50%);
            background: none;
            border: none;
            color: #94a3b8;
            cursor: pointer;
            font-size: 18px;
            transition: color 0.3s;
        }

        .password-toggle:hover {
            color: #667eea;
        }

        .role-selector {
            display: grid;
            grid-template-columns: repeat(2, 1fr);
            gap: 16px;
            margin-bottom: 24px;
        }

        @media (min-width: 768px) {
            .role-selector {
                grid-template-columns: repeat(4, 1fr);
            }
        }

        .role-card {
            position: relative;
            cursor: pointer;
            border-radius: 16px;
            padding: 20px 10px;
            text-align: center;
            transition: all 0.3s ease;
            background: rgba(255, 255, 255, 0.05);
            border: 2px solid rgba(255, 255, 255, 0.1);
        }

        .role-card:hover {
            transform: translateY(-5px);
            border-color: rgba(102, 126, 234, 0.5);
            background: rgba(255, 255, 255, 0.08);
        }

        .role-card.selected {
            transform: scale(1.05);
            border-color: transparent;
        }

        .role-card.selected.buyer {
            background: linear-gradient(135deg, rgba(34, 211, 238, 0.1), rgba(59, 130, 246, 0.1));
        }

        .role-card.selected.seller {
            background: linear-gradient(135deg, rgba(16, 185, 129, 0.1), rgba(34, 197, 94, 0.1));
        }

        .role-card.selected.dealer {
            background: linear-gradient(135deg, rgba(245, 158, 11, 0.1), rgba(251, 146, 60, 0.1));
        }

        .role-card.selected.admin {
            background: linear-gradient(135deg, rgba(139, 92, 246, 0.1), rgba(168, 85, 247, 0.1));
        }

        .role-glow {
            position: absolute;
            inset: 0;
            border-radius: 16px;
            opacity: 0;
            transition: opacity 0.3s;
            pointer-events: none;
            filter: blur(10px);
        }

        .role-card.selected .role-glow {
            opacity: 0.7;
        }

        .role-card.buyer.selected .role-glow {
            background: linear-gradient(135deg, #22d3ee, #3b82f6);
            box-shadow: 0 0 30px rgba(59, 130, 246, 0.5);
        }

        .role-card.seller.selected .role-glow {
            background: linear-gradient(135deg, #10b981, #22c55e);
            box-shadow: 0 0 30px rgba(34, 197, 94, 0.5);
        }

        .role-card.dealer.selected .role-glow {
            background: linear-gradient(135deg, #f59e0b, #fb923c);
            box-shadow: 0 0 30px rgba(251, 146, 60, 0.5);
        }

        .role-card.admin.selected .role-glow {
            background: linear-gradient(135deg, #8b5cf6, #a855f7);
            box-shadow: 0 0 30px rgba(168, 85, 247, 0.5);
        }

        .role-orb {
            position: absolute;
            width: 8px;
            height: 8px;
            border-radius: 50%;
            opacity: 0;
        }

        .role-card.selected .role-orb {
            opacity: 1;
        }

        .role-orb1 {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation: orb1 3s linear infinite;
        }

        .role-orb2 {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation: orb2 4s linear infinite;
        }

        .role-orb3 {
            top: 50%;
            left: 50%;
            transform: translate(-50%, -50%);
            animation: orb3 5s linear infinite;
        }

        .role-card.buyer .role-orb { background: #3b82f6; }
        .role-card.seller .role-orb { background: #22c55e; }
        .role-card.dealer .role-orb { background: #fb923c; }
        .role-card.admin .role-orb { background: #a855f7; }

        .role-icon {
            font-size: 32px;
            margin-bottom: 8px;
            display: block;
        }

        .role-card.selected .role-icon {
            animation: iconBounce 1.5s ease-in-out infinite;
            filter: drop-shadow(0 0 10px rgba(255, 255, 255, 0.5));
        }

        .role-name {
            font-weight: 600;
            color: white;
            margin-bottom: 4px;
        }

        .role-description {
            font-size: 12px;
            color: #9ca3af;
        }

        .role-checkmark {
            position: absolute;
            top: -8px;
            right: -8px;
            width: 24px;
            height: 24px;
            background: #667eea;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            color: white;
            font-size: 12px;
            opacity: 0;
            transition: opacity 0.3s;
            box-shadow: 0 2px 8px rgba(0, 0, 0, 0.3);
        }

        .role-card.selected .role-checkmark {
            opacity: 1;
        }

        .btn-register {
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 16px;
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-register:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(102, 126, 234, 0.4);
        }

        .alert-custom {
            border-radius: 14px;
            padding: 14px 16px;
            margin-bottom: 20px;
            font-weight: 500;
            animation: shake 0.5s ease-in-out;
        }

        .alert-danger-custom {
            background: rgba(239, 68, 68, 0.15);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #fca5a5;
        }

        .bottom-links {
            margin-top: 20px;
            text-align: center;
        }

        .bottom-links a {
            color: #93c5fd;
            text-decoration: none;
            font-weight: 500;
        }

        .bottom-links a:hover {
            text-decoration: underline;
        }

        @media (max-width: 768px) {
            .brand-name {
                font-size: 32px;
            }

            .card-body-custom {
                padding: 25px 20px;
            }

            .role-icon {
                font-size: 24px;
            }

            .role-name {
                font-size: 14px;
            }

            .role-description {
                font-size: 10px;
            }

            .two-col {
                grid-template-columns: 1fr !important;
            }
        }
    </style>
</head>
<body>
<div class="bg-animation">
    <span></span><span></span><span></span><span></span><span></span>
    <span></span><span></span><span></span><span></span><span></span>
</div>

<div class="container">
    <div class="logo-container">
        <div class="logo">🚘</div>
        <div class="brand-name">AutoVault</div>
        <div class="tagline">Premium Second Hand Car Marketplace</div>
    </div>

    <div class="glass-card">
        <div class="card-header-custom">
            <h2>Create Your Account</h2>
            <p>Register as a buyer, seller, dealer, or admin</p>
        </div>

        <div class="card-body-custom">
            <div id="errorAlert" class="alert-custom alert-danger-custom" style="<%= error != null ? "" : "display:none;" %>;">
                <%= error != null ? error : "Please select a role" %>
            </div>

            <form id="registerForm" action="${pageContext.request.contextPath}/user" method="post">
                <input type="hidden" name="action" value="register">
                <input type="hidden" name="role" id="selectedRole" value="<%= selectedRole %>" required>

                <div class="form-group">
                    <label class="form-label">User Code</label>
                    <input type="text" class="form-control" name="userCode" placeholder="Example: U001" value="<%= userCode %>" required>
                </div>

                <div class="two-col" style="display:grid; grid-template-columns: 1fr 1fr; gap: 16px;">
                    <div class="form-group">
                        <label class="form-label">First Name</label>
                        <input type="text" class="form-control" name="firstName" value="<%= firstName %>" required>
                    </div>
                    <div class="form-group">
                        <label class="form-label">Last Name</label>
                        <input type="text" class="form-control" name="lastName" value="<%= lastName %>" required>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" value="<%= username %>" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Email Address</label>
                    <input type="email" class="form-control" name="email" value="<%= email %>" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Phone Number</label>
                    <input type="text" class="form-control" name="phone" value="<%= phone %>" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Password</label>
                    <div class="password-wrapper">
                        <input type="password" class="form-control" name="password" id="password" required>
                        <button type="button" class="password-toggle" id="togglePassword">👁️</button>
                    </div>
                </div>

                <div class="form-group">
                    <label class="form-label">Role</label>
                    <div class="role-selector" id="roleSelector">
                        <div class="role-card buyer" data-role="Buyer">
                            <div class="role-glow"></div>
                            <div class="role-orb role-orb1"></div>
                            <div class="role-orb role-orb2"></div>
                            <div class="role-orb role-orb3"></div>
                            <span class="role-icon">🛒</span>
                            <div class="role-name">Buyer</div>
                            <div class="role-description">Browse & Buy</div>
                            <div class="role-checkmark">✓</div>
                        </div>

                        <div class="role-card seller" data-role="Seller">
                            <div class="role-glow"></div>
                            <div class="role-orb role-orb1"></div>
                            <div class="role-orb role-orb2"></div>
                            <div class="role-orb role-orb3"></div>
                            <span class="role-icon">💰</span>
                            <div class="role-name">Seller</div>
                            <div class="role-description">List & Sell</div>
                            <div class="role-checkmark">✓</div>
                        </div>

                        <div class="role-card dealer" data-role="Dealer">
                            <div class="role-glow"></div>
                            <div class="role-orb role-orb1"></div>
                            <div class="role-orb role-orb2"></div>
                            <div class="role-orb role-orb3"></div>
                            <span class="role-icon">🏢</span>
                            <div class="role-name">Dealer</div>
                            <div class="role-description">Bulk Trade</div>
                            <div class="role-checkmark">✓</div>
                        </div>

                        <div class="role-card admin" data-role="Admin">
                            <div class="role-glow"></div>
                            <div class="role-orb role-orb1"></div>
                            <div class="role-orb role-orb2"></div>
                            <div class="role-orb role-orb3"></div>
                            <span class="role-icon">🛡️</span>
                            <div class="role-name">Admin</div>
                            <div class="role-description">Manage All</div>
                            <div class="role-checkmark">✓</div>
                        </div>
                    </div>
                </div>

                <button type="submit" class="btn-register">Register Account</button>
            </form>

            <div class="bottom-links">
                <p class="mb-2">
                    Already have an account?
                    <a href="${pageContext.request.contextPath}/user/login.jsp">Login here</a>
                </p>
                <a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
            </div>
        </div>
    </div>
</div>

<script>
    const roleCards = document.querySelectorAll('.role-card');
    const selectedRoleInput = document.getElementById('selectedRole');
    const registerForm = document.getElementById('registerForm');
    const errorAlert = document.getElementById('errorAlert');
    const passwordInput = document.getElementById('password');
    const togglePassword = document.getElementById('togglePassword');

    function selectRole(role) {
        roleCards.forEach(card => {
            card.classList.remove('selected');
            if (card.dataset.role === role) {
                card.classList.add('selected');
            }
        });
        selectedRoleInput.value = role;
        errorAlert.style.display = 'none';
    }

    roleCards.forEach(card => {
        card.addEventListener('click', function() {
            selectRole(this.dataset.role);
        });
    });

    togglePassword.addEventListener('click', function() {
        const type = passwordInput.type === 'password' ? 'text' : 'password';
        passwordInput.type = type;
        this.textContent = type === 'password' ? '👁️' : '🙈';
    });

    registerForm.addEventListener('submit', function(e) {
        if (!selectedRoleInput.value) {
            e.preventDefault();
            errorAlert.textContent = 'Please select a role';
            errorAlert.style.display = 'block';
        }
    });

    window.addEventListener('DOMContentLoaded', function() {
        const currentRole = "<%= selectedRole %>";
        if (currentRole) {
            selectRole(currentRole);
        }
    });
</script>
</body>
</html>