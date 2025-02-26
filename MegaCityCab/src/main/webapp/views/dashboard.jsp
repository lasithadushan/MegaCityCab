<%@ page import="model.User" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page pageEncoding="UTF-8" %>

<%
    // Retrieve the user object from the session (no need to redefine session)
    User user = (session != null) ? (User) session.getAttribute("user") : null;
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard - MegaCityCab</title>
    <link rel="stylesheet" href="../css/styles.css">
</head>
<body>
    <header>
        <h1>MegaCityCab Dashboard</h1>
        <nav>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#book-ride">Book a Ride</a></li>
                <li><a href="logout.jsp">Logout</a></li>
            </ul>
        </nav>
    </header>

    <section id="welcome">
        <% if (user == null) { %>
            <h2>Login</h2>
            <form action="/MegaCityCab/LoginServlet" method="post">
                <label>Username:</label>
                <input type="text" name="username" required>
                
                <label>Password:</label>
                <input type="password" name="password" required>
                
                <button type="submit">Login</button>
            </form>
        <% } else { %>
            <h2>Welcome, <%= user.getUsername() %></h2>
            <p>Logged in successfully. Access your dashboard below:</p>
        <% } %>
    </section>

    <% if (user != null) { %>
        <section id="book-ride">
            <h2>Book a Ride</h2>
            <form action="/MegaCityCab/BookRideServlet" method="post">
                <label>Pickup Location:</label>
                <input type="text" name="pickupLocation" required>
                
                <label>Drop-off Location:</label>
                <input type="text" name="dropoffLocation" required>
                
                <label>Vehicle Type:</label>
                <select name="vehicleType">
                    <option value="Sedan">Sedan</option>
                    <option value="SUV">SUV</option>
                    <option value="Minivan">Minivan</option>
                </select>
                
                <label>Ride Date & Time:</label>
                <input type="datetime-local" name="rideDateTime" required>
                
                <button type="submit">Book Now</button>
            </form>
        </section>
    <% } %>

<% if (user != null) { %>
    <section id="book-cab">
        <h2>Book a Cab</h2>
        <form action="BookingServlet" method="post">
            <label>Pickup Location:</label>
            <input type="text" name="pickupLocation" required>

            <label>Dropoff Location:</label>
            <input type="text" name="dropoffLocation" required>

            <label>Ride Date:</label>
            <input type="date" name="rideDate" required>

            <label>Ride Time:</label>
            <input type="time" name="rideTime" required>

            <label>Vehicle Type:</label>
            <select name="vehicleId">
                <option value="1">Sedan</option>
                <option value="2">SUV</option>
                <option value="3">Minivan</option>
            </select>

            <button type="submit">Book Now</button>
        </form>
    </section>
<% } %>


    <footer>
        <p>&copy; 2025 MegaCityCab. All rights reserved.</p>
    </footer>
</body>
</html>
