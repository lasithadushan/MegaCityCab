<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login</title>
    <link rel="stylesheet" href="../css/login.css">
</head>
<body>

    <div class="container" style="
    width: 1000px;
    height: 500px;
">
        <div class="login-section">
            <h2>Sign In</h2>
            <form action="/MegaCityCab/Loginservlet" method="post">
                <label>Username</label>
                <input type="text" name="username" placeholder="Username" required>
                
                <label>Password</label>
                <input type="password" name="password" placeholder="Password" required>

                <div class="options">
                    <div>
                        <input type="checkbox" id="remember">
                        <label for="remember">Remember Me</label>
                    </div>
                    <a href="#">Forgot Password?</a>
                </div>

                <button type="submit">Sign In</button>

                <% if (request.getParameter("error") != null) { %>
                    <p class="error">${param.error}</p>
                <% } %>
            </form>
        </div>

        <div class="welcome-section">
            <h2>Welcome to Login</h2>
            <p>Don't have an account?</p>
            <a href="register.jsp" class="sign-up">Sign Up</a>
        </div>
    </div>
</body>
</html>
