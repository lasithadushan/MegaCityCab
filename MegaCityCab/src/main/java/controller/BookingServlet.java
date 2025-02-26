package controller;

import dao.BookingDAO;
import model.Booking;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.sql.Connection;
import java.sql.Date;
import java.sql.Time;
import Util.DatabaseConnection;

@WebServlet("/BookingServlet")
public class BookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        HttpSession session = request.getSession(false);

        if (session == null || session.getAttribute("user_id") == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        int userId = (int) session.getAttribute("user_id");
        int vehicleId = Integer.parseInt(request.getParameter("vehicleId"));
        String pickupLocation = request.getParameter("pickupLocation");
        String dropoffLocation = request.getParameter("dropoffLocation");
        Date rideDate = Date.valueOf(request.getParameter("rideDate"));
        Time rideTime = Time.valueOf(request.getParameter("rideTime"));

        Booking booking = new Booking(userId, vehicleId, pickupLocation, dropoffLocation, rideDate, rideTime, "Pending");

        try (Connection connection = DatabaseConnection.getConnection()) {
            BookingDAO bookingDAO = new BookingDAO(connection);
            boolean success = bookingDAO.addBooking(booking);

            if (success) {
                response.sendRedirect("dashboard.jsp?success=Booking Successful");
            } else {
                response.sendRedirect("dashboard.jsp?error=Booking Failed");
            }
        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("dashboard.jsp?error=Server Error");
        }
    }
}
