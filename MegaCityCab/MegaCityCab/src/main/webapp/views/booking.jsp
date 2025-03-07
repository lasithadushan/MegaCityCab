<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.List" %>
<%@ page import="dao.LocationDAO" %>
<html>
<head>
    <title>Book a Ride</title>
    <link rel="stylesheet" href="../css/booking.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script>
        function calculateFare() {
            var pickup = document.getElementById("pickup").value;
            var destination = document.getElementById("destination").value;

            if (pickup && destination) {
                // Send the pickup and destination locations to the backend
                $.ajax({
                    url: '/MegaCityCab/CalculateFareServlet',
                    method: 'GET',
                    data: { pickup: pickup, destination: destination },
                    success: function(response) {
                        // Log the response to ensure the fare is correctly received
                        console.log("Response from server:", response);

                        if(response && response.fare) {
                            // Update the fare input field
                            document.getElementById("fare").value = response.fare.toFixed(2);
                        } else {
                            alert('Fare calculation failed. Please try again.');
                        }
                    },
                    error: function(xhr, status, error) {
                        console.log("Error:", error);
                        alert('Error calculating fare: ' + error);
                    }
                });
            }
        }

        // Prevent form submission if the fare is not calculated
        function validateForm() {
            var fare = document.getElementById("fare").value;
            if (!fare || fare === "") {
                alert("Please calculate the fare before booking.");
                return false; // Prevent form submission
            }
            return true; // Allow form submission
        }
    </script>
</head>
<body>
 
    <form action="/MegaCityCab/BookingServlet" method="post" onsubmit="return validateForm()">
       <h2>Book a Ride</h2>
        <label for="pickup">Pickup Location:</label>
        <select id="pickup" name="pickup" onchange="calculateFare()" required>
            <%
                LocationDAO locationDAO = new LocationDAO();
                List<String> locations = locationDAO.getLocationNames();
                for (String location : locations) {
            %>
            <option value="<%= location %>"><%= location %></option>
            <% } %>
        </select>

        <label for="destination">Destination:</label>
        <select id="destination" name="destination" onchange="calculateFare()" required>
            <%
                for (String location : locations) {
            %>
            <option value="<%= location %>"><%= location %></option>
            <% } %>
        </select>

        <label for="fare">Estimated Fare (Rs):</label>
        <input type="text" id="fare" name="fare" readonly>

        <button type="submit">Book Now</button>
    </form>
</body>
</html>
