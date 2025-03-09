package com.datapackage.model;

import java.sql.Date;
import java.util.Objects;

public class Booking {
    private int bookingId;
    private Date bookingDate;
    private int customerId;
    private String vehicle;
    private String pickupLocation;
    private String dropoffLocation;
    
    // Default constructor
    public Booking() { }
    
    // Constructor without bookingId (auto-generated)
    public Booking(Date bookingDate, int customerId, String vehicle, String pickupLocation, String dropoffLocation) {
        this.bookingDate = bookingDate;
        this.customerId = customerId;
        this.vehicle = vehicle;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
    }
    
    // Full constructor (explicit bookingId)
    public Booking(int bookingId, Date bookingDate, int customerId, String vehicle, String pickupLocation, String dropoffLocation) {
        this.bookingId = bookingId;
        this.bookingDate = bookingDate;
        this.customerId = customerId;
        this.vehicle = vehicle;
        this.pickupLocation = pickupLocation;
        this.dropoffLocation = dropoffLocation;
    }
    
    // Getters and Setters
    public int getBookingId() {
        return bookingId;
    }
    public void setBookingId(int bookingId) {
        this.bookingId = bookingId;
    }
    
    public Date getBookingDate() {
        return bookingDate;
    }
    public void setBookingDate(Date bookingDate) {
        this.bookingDate = bookingDate;
    }
    
    public int getCustomerId() {
        return customerId;
    }
    public void setCustomerId(int customerId) {
        this.customerId = customerId;
    }
    
    public String getVehicle() {
        return vehicle;
    }
    public void setVehicle(String vehicle) {
        this.vehicle = vehicle;
    }
    
    public String getPickupLocation() {
        return pickupLocation;
    }
    public void setPickupLocation(String pickupLocation) {
        this.pickupLocation = pickupLocation;
    }
    
    public String getDropoffLocation() {
        return dropoffLocation;
    }
    public void setDropoffLocation(String dropoffLocation) {
        this.dropoffLocation = dropoffLocation;
    }
    
    // toString() for debugging
    @Override
    public String toString() {
        return "Booking{" +
                "bookingId=" + bookingId +
                ", bookingDate=" + bookingDate +
                ", customerId=" + customerId +
                ", vehicle='" + vehicle + '\'' +
                ", pickupLocation='" + pickupLocation + '\'' +
                ", dropoffLocation='" + dropoffLocation + '\'' +
                '}';
    }
    
    // Optional: equals() for comparing bookings
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (!(o instanceof Booking)) return false;
        Booking booking = (Booking) o;
        return bookingId == booking.bookingId &&
               customerId == booking.customerId &&
               Objects.equals(bookingDate, booking.bookingDate) &&
               Objects.equals(vehicle, booking.vehicle) &&
               Objects.equals(pickupLocation, booking.pickupLocation) &&
               Objects.equals(dropoffLocation, booking.dropoffLocation);
    }
    
    @Override
    public int hashCode() {
        return Objects.hash(bookingId, bookingDate, customerId, vehicle, pickupLocation, dropoffLocation);
    }
}
