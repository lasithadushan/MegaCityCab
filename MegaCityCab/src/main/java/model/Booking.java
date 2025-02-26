package model;

import java.sql.Date;
import java.sql.Time;

public class Booking {
    private int bookingId;
    private int userId;
    private int vehicleId;
    private String pickupLocation;
    private String dropoffLocation;
    private Date rideDate;
    private Time rideTime;
    private String status;

    // Constructor
    public Booking(int userId, int vehicleId, String pickupLocation, String dropoffLocation, Date rideDate, Time rideTime, String status) {
        this.userId = userId;
        this.vehicleId = vehicleId;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
        this.rideDate = rideDate;
        this.rideTime = rideTime;
        this.status = status;
    }

    // Getters and Setters
    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }
    public int getUserId() { return userId; }
    public void setUserId(int userId) { this.userId = userId; }
    public int getVehicleId() { return vehicleId; }
    public void setVehicleId(int vehicleId) { this.vehicleId = vehicleId; }
    public String getPickupLocation() { return pickupLocation; }
    public void setPickupLocation(String pickupLocation) { this.pickupLocation = pickupLocation; }
    public String getDropoffLocation() { return dropoffLocation; }
    public void setDropoffLocation(String dropoffLocation) { this.dropoffLocation = dropoffLocation; }
    public Date getRideDate() { return rideDate; }
    public void setRideDate(Date rideDate) { this.rideDate = rideDate; }
    public Time getRideTime() { return rideTime; }
    public void setRideTime(Time rideTime) { this.rideTime = rideTime; }
    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }
}
