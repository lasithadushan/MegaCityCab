<%@ page import="model.Bill, dao.BillingDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>View Bill</title>
    <link rel="stylesheet" href="../css/view_bill.css">
</head>
<body>
    <h2>Bill Details</h2>
    <%
        String bookingIdStr = request.getParameter("bookingId");
        if (bookingIdStr != null) {
            int bookingId = Integer.parseInt(bookingIdStr);
            BillingDAO billingDAO = new BillingDAO();
            Bill bill = billingDAO.getBillByBookingId(bookingId);
            
            if (bill != null) {
    %>
        <table border="1">
            <tr><th>Bill ID</th><td><%= bill.getBillId() %></td></tr>
            <tr><th>Booking ID</th><td><%= bill.getBookingId() %></td></tr>
            <tr><th>Total Fare</th><td>Rs. <%= bill.getTotalFare() %></td></tr>
            <tr><th>Discount</th><td>Rs. <%= bill.getDiscount() %></td></tr>
            <tr><th>Final Amount</th><td>Rs. <%= bill.getFinalAmount() %></td></tr>
            <tr><th>Generated At</th><td><%= bill.getGeneratedAt() %></td></tr>
        </table>
        <br>
        <a href="download_bill.jsp?bookingId=<%= bookingId %>">Download Bill</a>
    <% } else { %>
        <p>No bill found for this booking.</p>
    <% } } else { %>
        <p>Invalid request.</p>
    <% } %>
</body>
</html>
