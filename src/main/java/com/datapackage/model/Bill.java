package com.datapackage.model;

import java.sql.Date;

public class Bill {
    private int id;
    private String employeeName;
    private int employeeId;
    private int bookingId;
    private int customerId;
    private String vehicle;
    private double kilometers;
    private double perKmRate;
    private double amount;
    private Date billDate;

    public Bill() {
    }

    public Bill(int id, String employeeName, int employeeId, int bookingId, int customerId,
                String vehicle, double kilometers, double perKmRate, double amount, Date billDate) {
        this.id = id;
        this.employeeName = employeeName;
        this.employeeId = employeeId;
        this.bookingId = bookingId;
        this.customerId = customerId;
        this.vehicle = vehicle;
        this.kilometers = kilometers;
        this.perKmRate = perKmRate;
        this.amount = amount;
        this.billDate = billDate;
    }

    // Getters and Setters
    public int getId() { return id; }
    public void setId(int id) { this.id = id; }

    public String getEmployeeName() { return employeeName; }
    public void setEmployeeName(String employeeName) { this.employeeName = employeeName; }

    public int getEmployeeId() { return employeeId; }
    public void setEmployeeId(int employeeId) { this.employeeId = employeeId; }

    public int getBookingId() { return bookingId; }
    public void setBookingId(int bookingId) { this.bookingId = bookingId; }

    public int getCustomerId() { return customerId; }
    public void setCustomerId(int customerId) { this.customerId = customerId; }

    public String getVehicle() { return vehicle; }
    public void setVehicle(String vehicle) { this.vehicle = vehicle; }

    public double getKilometers() { return kilometers; }
    public void setKilometers(double kilometers) { this.kilometers = kilometers; }

    public double getPerKmRate() { return perKmRate; }
    public void setPerKmRate(double perKmRate) { this.perKmRate = perKmRate; }

    public double getAmount() { return amount; }
    public void setAmount(double amount) { this.amount = amount; }

    public Date getBillDate() { return billDate; }
    public void setBillDate(Date billDate) { this.billDate = billDate; }
}
