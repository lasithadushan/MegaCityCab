<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Driver</title>
    <link rel="stylesheet" href="../css/add_driver.css">
</head>
<body>
    <div class="container">
        <div class="card animate">
            <h2>Add New Driver</h2>
            <form action="/MegaCityCab/AddDriverServlet" method="post">
                <div class="input-group">
                    <label for="driverName">Driver Name</label>
                    <input type="text" id="driverName" name="driverName" placeholder="Enter Driver Name" required>
                </div>
                <div class="input-group">
                    <label for="licenseNumber">License Number</label>
                    <input type="text" id="licenseNumber" name="licenseNumber" placeholder="Enter License Number" required>
                </div>
                <div class="input-group">
                    <label for="phone">Phone Number</label>
                    <input type="text" id="phone" name="phone" placeholder="Enter Phone Number" required>
                </div>
                <div class="button-group">
                    <button type="submit" class="save-btn">Add Driver</button>
                    <button type="button" class="back-btn" onclick="window.location.href='managerdashboard.jsp'">Back</button>
                </div>
            </form>
            <% if(request.getParameter("error") != null) { %>
                <p class="error-msg"><%= request.getParameter("error") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
