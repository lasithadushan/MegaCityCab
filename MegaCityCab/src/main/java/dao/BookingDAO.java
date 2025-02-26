package dao;

import model.Booking;
import java.sql.*;

public class BookingDAO {
    private Connection connection;

    public BookingDAO(Connection connection) {
        this.connection = connection;
    }

    // Method to insert a booking
    public boolean addBooking(Booking booking) {
        String sql = "INSERT INTO bookings (user_id, vehicle_id, pickup_location, dropoff_location, ride_date, ride_time, status) VALUES (?, ?, ?, ?, ?, ?, ?)";

        try (PreparedStatement stmt = connection.prepareStatement(sql)) {
            stmt.setInt(1, booking.getUserId());
            stmt.setInt(2, booking.getVehicleId());
            stmt.setString(3, booking.getPickupLocation());
            stmt.setString(4, booking.getDropoffLocation());
            stmt.setDate(5, booking.getRideDate());
            stmt.setTime(6, booking.getRideTime());
            stmt.setString(7, booking.getStatus());

            int rowsInserted = stmt.executeUpdate();
            return rowsInserted > 0;
        } catch (SQLException e) {
            e.printStackTrace();
            return false;
        }
    }
}
