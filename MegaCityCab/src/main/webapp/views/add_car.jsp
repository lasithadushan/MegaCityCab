<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add New Car</title>
    <link rel="stylesheet" href="../css/add_car.css">
</head>
<body>
    <div class="container">
  
      
        <div class="card animate">
            <h2>Add New Car</h2>
            <form action="/MegaCityCab/AddCarServlet" method="post">
                <div class="input-group">
                    <label for="carModel">Car Model</label>
                    <input type="text" id="carModel" name="carModel" placeholder="Enter Car Model" required>
                </div>
                <div class="input-group">
                    <label for="carNumber">Car Number</label>
                    <input type="text" id="carNumber" name="carNumber" placeholder="Enter Car Number" required>
                </div>
                <div class="input-group">
                    <label for="carType">Car Type</label>
                    <select id="carType" name="carType">
                        <option value="Sedan">Sedan</option>
                        <option value="SUV">SUV</option>
                        <option value="Mini">Mini</option>
                    </select>
                </div>
                <div class="input-group">
                    <label for="capacity">Capacity</label>
                    <input type="number" id="capacity" name="capacity" placeholder="Enter Capacity" required>
                </div>
                <button type="submit" class="save-btn">Save Car</button>
                <button type="button" class="back-btn" onclick="window.location.href='managerdashboard.jsp'">Back</button>
            </form>
            <% if(request.getParameter("error") != null) { %>
                <p class="error-msg"><%= request.getParameter("error") %></p>
            <% } %>
        </div>
    </div>
</body>
</html>
