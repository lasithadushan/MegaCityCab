<%@ page import="model.Bill" %>
<%@ page contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html>
<head>
    <title>Booking Confirmation</title>
    <link rel="stylesheet" href="../css/booking_confirmation.css">
    <style type="text/css">
    @charset "UTF-8";

/* General Styles */
body {
    font-family: Arial, sans-serif;
    background-color: #FFF2DB; /* Soft light background */
    color: #003092; /* Dark blue text */
    margin: 0;
    padding: 0;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    text-align: center;
}

/* Container */
.content {
    max-width: 600px;
    padding: 30px;
    background-color: #FFFFFF; /* White background */
    border-radius: 10px;
    box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
}

/* Heading */
h2 {
    font-size: 32px;
    color: #003092; /* Dark blue */
}

h3 {
    color: #00879E; /* Teal */
    font-size: 22px;
    margin-top: 20px;
}

/* Paragraphs */
p {
    color: #333; /* Darker text for readability */
    font-size: 18px;
    margin-bottom: 10px;
}

/* Button Styling */
button {
    background-color: #003092; /* Dark blue */
    color: #FFF2DB; /* Light text */
    padding: 12px 20px;
    font-size: 16px;
    border: none;
    border-radius: 6px;
    cursor: pointer;
    margin-top: 20px;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #FFAB5B; /* Warm orange */
}

/* Link styling */
a {
    text-decoration: none;
}

.error-message {
    color: red;
    font-size: 16px;
    margin-top: 10px;
}
    
    </style>
</head>
<body>
    <div class="content">
        <h2>Booking Confirmation</h2>
        <p>Thank you for booking with MegaCity Cab.</p>

        <h3>Booking Details:</h3>
        <% 
            Bill bill = (Bill) request.getAttribute("bill");
            if (bill != null) {
        %>
            <p><strong>Booking ID:</strong> <%= bill.getBookingId() %></p>
            <p><strong>Total Amount:</strong> Rs <%= bill.getTotalAmount() %></p>
            <p><strong>Bill Time:</strong> <%= bill.getBillTime() %></p>

            <!-- Button to download the bill as PDF -->
            <a href="generated_pdfs/bill_<%= bill.getBillId() %>.pdf" download>
                <button>Download Bill as PDF</button>
            </a>
        <% 
            } else {
        %>
            <p class="error-message">Bill not found. Please try again later.</p>
        <% 
            }
        %>
    </div>
    <div>
        
</body>

        </div>
</html>
