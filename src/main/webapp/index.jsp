<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoVault - Premium Second Hand Car Marketplace</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700;800&display=swap" rel="stylesheet">
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #0f0c29, #302b63, #24243e);
            min-height: 100vh;
            color: #e5e7eb;
            overflow-x: hidden;
            position: relative;
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
            0% {
                transform: translateY(0) rotate(0deg);
                opacity: 1;
                border-radius: 50%;
            }
            100% {
                transform: translateY(-1000px) rotate(720deg);
                opacity: 0;
                border-radius: 50%;
            }
        }

        .container {
            max-width: 850px;
            padding: 60px 20px;
            position: relative;
            z-index: 1;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 40px;
            animation: zoomIn 1s ease;
        }

        .logo {
            font-size: 64px;
            margin-bottom: 10px;
            animation: bounce 2s ease infinite;
        }

        .brand-name {
            font-size: 48px;
            font-weight: 800;
            background: linear-gradient(135deg, #667eea, #764ba2, #f093fb);
            background-size: 200% 200%;
            -webkit-background-clip: text;
            -webkit-text-fill-color: transparent;
            background-clip: text;
            animation: gradient 3s ease infinite;
            letter-spacing: -1px;
        }

        .tagline {
            font-size: 16px;
            color: #9ca3af;
            font-weight: 300;
            letter-spacing: 4px;
            text-transform: uppercase;
        }

        @keyframes gradient {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        @keyframes zoomIn {
            0% { transform: scale(0.5); opacity: 0; }
            100% { transform: scale(1); opacity: 1; }
        }

        @keyframes bounce {
            0%, 20%, 50%, 80%, 100% { transform: translateY(0); }
            40% { transform: translateY(-15px); }
            60% { transform: translateY(-8px); }
        }

        .glass-card {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.1);
            border-radius: 30px;
            box-shadow:
                    0 25px 50px rgba(0, 0, 0, 0.4),
                    inset 0 0 80px rgba(255, 255, 255, 0.02);
            backdrop-filter: blur(20px);
            overflow: hidden;
            animation: slideUp 1s ease;
        }

        .hero-header {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.3), rgba(118, 75, 162, 0.3));
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 50px 30px;
            text-align: center;
            position: relative;
            overflow: hidden;
        }

        .hero-header::before {
            content: '';
            position: absolute;
            top: -50%;
            left: -50%;
            width: 200%;
            height: 200%;
            background: radial-gradient(circle, rgba(102, 126, 234, 0.1) 0%, transparent 50%);
            animation: pulse 4s ease-in-out infinite;
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); opacity: 0.5; }
            50% { transform: scale(1.2); opacity: 0.8; }
        }

        .hero-header h1 {
            font-weight: 700;
            margin-bottom: 8px;
            position: relative;
            animation: fadeInDown 0.8s ease;
        }

        .hero-header p {
            margin: 0;
            opacity: 0.8;
            font-weight: 300;
            position: relative;
            animation: fadeInUp 1s ease;
        }

        .card-body {
            padding: 50px 40px;
        }

        .action-btn {
            display: flex;
            align-items: center;
            justify-content: center;
            gap: 15px;
            width: 100%;
            padding: 20px 30px;
            font-size: 18px;
            font-weight: 600;
            border-radius: 18px;
            border: none;
            cursor: pointer;
            transition: all 0.4s cubic-bezier(0.175, 0.885, 0.32, 1.275);
            text-decoration: none;
            position: relative;
            overflow: hidden;
        }

        .action-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
            transition: left 0.5s ease;
        }

        .action-btn:hover::before {
            left: 100%;
        }

        .action-btn + .action-btn {
            margin-top: 16px;
        }

        .action-btn span {
            font-size: 24px;
        }

        .btn-register {
            background: linear-gradient(135deg, #667eea, #764ba2);
            color: white;
            animation: slideUp 0.8s ease;
        }

        .btn-register:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 20px 40px rgba(102, 126, 234, 0.4);
        }

        .btn-login {
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            animation: slideUp 0.9s ease;
        }

        .btn-login:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 20px 40px rgba(17, 153, 142, 0.4);
        }

        .btn-users {
            background: linear-gradient(135deg, #434343, #000000);
            color: white;
            animation: slideUp 1s ease;
        }

        .btn-users:hover {
            transform: translateY(-5px) scale(1.02);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.5);
        }

        .feature-grid {
            display: grid;
            grid-template-columns: repeat(3, 1fr);
            gap: 20px;
            margin-top: 40px;
        }

        .feature-box {
            background: rgba(255, 255, 255, 0.03);
            border: 1px solid rgba(255, 255, 255, 0.08);
            border-radius: 20px;
            padding: 30px 20px;
            text-align: center;
            transition: all 0.4s ease;
            position: relative;
            overflow: hidden;
        }

        .feature-box::before {
            content: '';
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 3px;
            background: linear-gradient(90deg, #667eea, #764ba2);
            transform: scaleX(0);
            transition: transform 0.4s ease;
        }

        .feature-box:hover::before {
            transform: scaleX(1);
        }

        .feature-box:hover {
            transform: translateY(-10px);
            box-shadow: 0 20px 40px rgba(0, 0, 0, 0.3);
            background: rgba(255, 255, 255, 0.08);
        }

        .feature-icon {
            font-size: 48px;
            margin-bottom: 15px;
            animation: floatIcon 3s ease-in-out infinite;
        }

        .feature-box:nth-child(2) .feature-icon { animation-delay: 0.5s; }
        .feature-box:nth-child(3) .feature-icon { animation-delay: 1s; }

        @keyframes floatIcon {
            0%, 100% { transform: translateY(0); }
            50% { transform: translateY(-8px); }
        }

        .feature-box h5 {
            color: #ffffff;
            font-weight: 700;
            font-size: 18px;
            margin-bottom: 8px;
        }

        .feature-box p {
            color: #9ca3af;
            font-size: 14px;
            margin: 0;
            line-height: 1.6;
        }

        .status-msg {
            font-weight: 600;
            animation: shake 0.5s ease;
        }

        .alert-success {
            background: linear-gradient(135deg, rgba(16, 185, 129, 0.2), rgba(16, 185, 129, 0.1));
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #34d399;
            padding: 18px;
            border-radius: 14px;
            margin-bottom: 24px;
            text-align: center;
        }

        .alert-danger {
            background: linear-gradient(135deg, rgba(239, 68, 68, 0.2), rgba(239, 68, 68, 0.1));
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #f87171;
            padding: 18px;
            border-radius: 14px;
            margin-bottom: 24px;
            text-align: center;
        }

        @keyframes shake {
            0%, 100% { transform: translateX(0); }
            25% { transform: translateX(-5px); }
            75% { transform: translateX(5px); }
        }

        .footer-text {
            text-align: center;
            margin-top: 40px;
            color: #64748b;
            font-size: 14px;
            animation: fadeIn 1.5s ease;
        }

        .footer-text strong {
            color: #667eea;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 30px 0;
            animation: fadeIn 1.2s ease;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: linear-gradient(90deg, transparent, rgba(255,255,255,0.2), transparent);
        }

        .divider span {
            padding: 0 15px;
            color: #64748b;
            font-size: 12px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(40px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInDown {
            from {
                opacity: 0;
                transform: translateY(-30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeInUp {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes fadeIn {
            from { opacity: 0; }
            to { opacity: 1; }
        }

        .glow-text {
            animation: glow 2s ease-in-out infinite alternate;
        }

        @keyframes glow {
            from {
                text-shadow: 0 0 20px rgba(102, 126, 234, 0.5);
            }
            to {
                text-shadow: 0 0 30px rgba(118, 75, 162, 0.8), 0 0 40px rgba(102, 126, 234, 0.4);
            }
        }

        @media (max-width: 768px) {
            .feature-grid {
                grid-template-columns: 1fr;
            }

            .card-body {
                padding: 30px 20px;
            }

            .brand-name {
                font-size: 36px;
            }

            .logo {
                font-size: 48px;
            }

            .action-btn {
                padding: 16px 20px;
                font-size: 16px;
            }
        }
    </style>
</head>
<body>

<div class="bg-animation">
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
    <span></span>
</div>

<div class="container">
    <div class="logo-container">
        <div class="logo">🚘</div>
        <div class="brand-name glow-text">AutoVault</div>
        <div class="tagline">Premium Second Hand Car Marketplace</div>
    </div>

    <div class="glass-card">
        <div class="hero-header">
            <h1>👤 User Management Module</h1>
            <p>Secure access to your automotive marketplace</p>
        </div>

        <div class="card-body">
            <%
                String deleted = request.getParameter("deleted");
                if ("1".equals(deleted)) {
            %>
            <div class="alert-success">
                ✅ User account deleted successfully.
            </div>
            <%
            } else if ("0".equals(deleted)) {
            %>
            <div class="alert-danger">
                ❌ User account deletion failed.
            </div>
            <%
                }
            %>

            <a class="action-btn btn-register" href="${pageContext.request.contextPath}/user/register.jsp">
                <span>📝</span>
                <span>Register New User</span>
            </a>

            <a class="action-btn btn-login" href="${pageContext.request.contextPath}/user/login.jsp">
                <span>🔐</span>
                <span>User Login</span>
            </a>

            <a class="action-btn btn-users" href="${pageContext.request.contextPath}/user?action=list">
                <span>👥</span>
                <span>View All Users</span>
            </a>

            <div class="divider">
                <span>Features</span>
            </div>

            <div class="feature-grid">
                <div class="feature-box">
                    <div class="feature-icon">✨</div>
                    <h5>Quick Register</h5>
                    <p>Create buyer, seller, dealer, or admin accounts in seconds.</p>
                </div>

                <div class="feature-box">
                    <div class="feature-icon">🔒</div>
                    <h5>Secure Login</h5>
                    <p>Access your account safely with encrypted authentication.</p>
                </div>

                <div class="feature-box">
                    <div class="feature-icon">⚡</div>
                    <h5>Full Control</h5>
                    <p>View, search, update, and delete user records instantly.</p>
                </div>
            </div>
        </div>
    </div>

    <p class="footer-text">
        Powered by <strong>AutoVault</strong> • WD089 - User Management UI
    </p>
</div>

</body>
</html>