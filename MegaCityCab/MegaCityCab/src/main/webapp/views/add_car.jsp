<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Add Car</title>
    <link rel="stylesheet" href="../css/add_car.css">
</head>
<body>
    <form action="/MegaCityCab/AddCarServlet" method="post" style="
    border-right-width: 60px;
    padding-right: 60px;
    padding-left: 60px;
">
    <h2>Add New Car</h2>
        <div>
            <label for="carModel">Car Model:</label>
            <input type="text" id="carModel" name="carModel" required />
        </div>
        <div>
            <label for="carNumber">Car Number:</label>
            <input type="text" id="carNumber" name="carNumber" required="" style="
    padding-right: 40px;
    padding-left: 40px;
">
        </div>
        <div>
            <label for="carType">Car Type:</label>
            <select id="carType" name="carType">
                <option value="Sedan">Sedan</option>
                <option value="SUV">SUV</option>
                <option value="Mini">Mini</option>
            </select>
        </div>
        <div>
            <label for="capacity">Capacity:</label>
            <input type="number" id="capacity" name="capacity" required />
        </div>
        <div>
            <button type="submit">Add Car</button>
        </div>
        <div>
        <button type="button" onclick="window.location.href='managerdashboard.jsp'">Back</button>
        </div>
    </form>

    <% if(request.getParameter("error") != null) { %>
        <p style="color: red;"><%= request.getParameter("error") %></p>
    <% } %>
</body>
</html>
