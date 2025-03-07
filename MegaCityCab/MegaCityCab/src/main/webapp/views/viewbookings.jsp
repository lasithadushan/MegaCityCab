<%@ page import="jakarta.servlet.http.HttpSession" %>
<%@ page import="dao.BookingDAO" %>
<%@ page import="java.util.List" %>
<%@ page import="model.Booking" %>

<html>
<head>
    <title>View Bookings</title>
    <link rel="stylesheet" href="../css/ViewBookings.css">
</head>
<body>

    <h2>Customer Bookings</h2>
    
    <!-- Back Button Container (Positioned in the upper-right corner) -->
    <div class="back-button-container">
        <button type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
    </div>

    <%
        // Retrieve all bookings
        BookingDAO bookingDAO = new BookingDAO();
        List<Booking> bookings = bookingDAO.getAllBookings();

        // Check if there are no bookings
        if (bookings.isEmpty()) {
    %>
        <p>No bookings found.</p>
    <%
        } else {
    %>
    <table>
        <thead>
            <tr>
                <th>Booking ID</th>
                <th>Customer Name</th>
                <th>Pickup Location</th>
                <th>Destination</th>
                <th>Fare</th>
                <th>Status</th>
                <th>Actions</th>
            </tr>
        </thead>
        <tbody>
            <% for (Booking b : bookings) { %>
            <tr>
                <td><%= b.getBookingId() %></td>
                <td><%= b.getCustomerName() %></td>
                <td><%= b.getPickupLocation() %></td>
                <td><%= b.getDestination() %></td>
                <td><%= b.getFare() %></td>
                <td><%= b.getStatus() %></td>
                <td>
                    <% if ("Pending".equals(b.getStatus())) { %>
                        <a href="UpdateBookingServlet?bookingId=<%= b.getBookingId() %>&status=Completed">Mark as Completed</a> |
                        <a href="CancelBookingServlet?bookingId=<%= b.getBookingId() %>">Cancel</a>
                    <% } else { %>
                        No Actions
                    <% } %>
                </td>
            </tr>
            <% } %>
        </tbody>
    </table>
    <% } %>

</body>
</html>
