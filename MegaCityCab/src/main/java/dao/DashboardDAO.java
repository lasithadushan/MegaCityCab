package dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.DashboardStats;
import Util.DBConnection;

public class DashboardDAO {
    public DashboardStats getDashboardStats() {
        DashboardStats stats = new DashboardStats();
        String query = "SELECT " +
                "(SELECT COUNT(*) FROM Customer) AS total_customers, " +
                "(SELECT COUNT(*) FROM Booking WHERE status = 'Completed') AS total_bookings, " +
                "(SELECT COUNT(*) FROM Driver) AS total_drivers, " +
                "(SELECT COUNT(*) FROM Car WHERE status = 'Available') AS available_cars, " +
                "(SELECT IFNULL(SUM(fare), 0) FROM Booking WHERE status = 'Completed') AS total_earnings";

        try (Connection con = DBConnection.getConnection();
             PreparedStatement ps = con.prepareStatement(query);
             ResultSet rs = ps.executeQuery()) {

            if (rs.next()) {
                stats.setTotalCustomers(rs.getInt("total_customers"));
                stats.setTotalBookings(rs.getInt("total_bookings"));
                stats.setTotalDrivers(rs.getInt("total_drivers"));
                stats.setAvailableCars(rs.getInt("available_cars"));
                stats.setTotalEarnings(rs.getDouble("total_earnings"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return stats;
    }
}
