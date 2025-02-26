package model;

public class DashboardStats {
    private int totalCustomers;
    private int totalBookings;
    private int totalDrivers;
    private int availableCars;
    private double totalEarnings;

    public int getTotalCustomers() { return totalCustomers; }
    public void setTotalCustomers(int totalCustomers) { this.totalCustomers = totalCustomers; }

    public int getTotalBookings() { return totalBookings; }
    public void setTotalBookings(int totalBookings) { this.totalBookings = totalBookings; }

    public int getTotalDrivers() { return totalDrivers; }
    public void setTotalDrivers(int totalDrivers) { this.totalDrivers = totalDrivers; }

    public int getAvailableCars() { return availableCars; }
    public void setAvailableCars(int availableCars) { this.availableCars = availableCars; }

    public double getTotalEarnings() { return totalEarnings; }
    public void setTotalEarnings(double totalEarnings) { this.totalEarnings = totalEarnings; }
}
