<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%
    String error = (String) request.getAttribute("error");
    String registered = request.getParameter("registered");
    String username = request.getParameter("username") != null ? request.getParameter("username") : "";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>AutoVault - Login</title>
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
            25% { transform: scale(1.08) rotate(4deg); }
            75% { transform: scale(1.08) rotate(-4deg); }
        }

        @keyframes formAppear {
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        @keyframes gradientFlow {
            0% { background-position: 0% 50%; }
            50% { background-position: 100% 50%; }
            100% { background-position: 0% 50%; }
        }

        .container {
            width: 100%;
            max-width: 540px;
            position: relative;
            z-index: 10;
        }

        .logo-container {
            text-align: center;
            margin-bottom: 28px;
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
        }

        .card-header-custom {
            background: linear-gradient(135deg, rgba(102, 126, 234, 0.3), rgba(118, 75, 162, 0.3));
            border-bottom: 1px solid rgba(255, 255, 255, 0.1);
            padding: 35px 25px;
            text-align: center;
        }

        .card-header-custom h2 {
            font-size: 28px;
            font-weight: 700;
            color: #ffffff;
            margin: 0;
        }

        .card-header-custom p {
            color: #cbd5e1;
            font-size: 14px;
            margin: 10px 0 0;
        }

        .card-body-custom {
            padding: 35px 30px;
        }

        .form-group {
            margin-bottom: 22px;
        }

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
        }

        .password-toggle:hover {
            color: #667eea;
        }

        .btn-login {
            width: 100%;
            padding: 16px;
            border: none;
            border-radius: 16px;
            background: linear-gradient(135deg, #11998e, #38ef7d);
            color: white;
            font-size: 17px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .btn-login:hover {
            transform: translateY(-3px);
            box-shadow: 0 15px 30px rgba(17, 153, 142, 0.35);
        }

        .alert-custom {
            border-radius: 14px;
            padding: 14px 16px;
            margin-bottom: 20px;
            font-weight: 500;
        }

        .alert-danger-custom {
            background: rgba(239, 68, 68, 0.15);
            border: 1px solid rgba(239, 68, 68, 0.3);
            color: #fca5a5;
        }

        .alert-success-custom {
            background: rgba(16, 185, 129, 0.15);
            border: 1px solid rgba(16, 185, 129, 0.3);
            color: #86efac;
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
            <h2>Welcome Back</h2>
            <p>Login to access your AutoVault account</p>
        </div>

        <div class="card-body-custom">
            <% if ("1".equals(registered)) { %>
            <div class="alert-custom alert-success-custom">
                Registration successful. Please log in.
            </div>
            <% } %>

            <% if (error != null) { %>
            <div class="alert-custom alert-danger-custom">
                <%= error %>
            </div>
            <% } %>

            <form action="${pageContext.request.contextPath}/user" method="post">
                <input type="hidden" name="action" value="login">

                <div class="form-group">
                    <label class="form-label">Username</label>
                    <input type="text" class="form-control" name="username" value="<%= username %>" placeholder="Enter your username" required>
                </div>

                <div class="form-group">
                    <label class="form-label">Password</label>
                    <div class="password-wrapper">
                        <input type="password" class="form-control" name="password" id="password" placeholder="Enter your password" required>
                        <button type="button" class="password-toggle" id="togglePassword">👁️</button>
                    </div>
                </div>

                <button type="submit" class="btn-login">Login</button>
            </form>

            <div class="bottom-links">
                <p style="margin-bottom: 8px;">
                    Don’t have an account?
                    <a href="${pageContext.request.contextPath}/user/register.jsp">Register here</a>
                </p>
                <a href="${pageContext.request.contextPath}/index.jsp">Back to Home</a>
            </div>
        </div>
    </div>
</div>

<script>
    const passwordInput = document.getElementById('password');
    const togglePassword = document.getElementById('togglePassword');

    togglePassword.addEventListener('click', function() {
        const type = passwordInput.type === 'password' ? 'text' : 'password';
        passwordInput.type = type;
        this.textContent = type === 'password' ? '👁️' : '🙈';
    });
</script>
</body>
</html>