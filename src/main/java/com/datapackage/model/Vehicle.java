package com.datapackage.model;

public class Vehicle {
    private int id;
    private String vehicleNo;
    private String vehicleName;
    private double price;
    
    public Vehicle() {}
    
    public Vehicle(int id, String vehicleNo, String vehicleName, double price) {
        this.id = id;
        this.vehicleNo = vehicleNo;
        this.vehicleName = vehicleName;
        this.price = price;
    }
    
    // Getters and Setters
    public int getId() {
        return id;
    }
    public void setId(int id) {
        this.id = id;
    }
    
    public String getVehicleNo() {
        return vehicleNo;
    }
    public void setVehicleNo(String vehicleNo) {
        this.vehicleNo = vehicleNo;
    }
    
    public String getVehicleName() {
        return vehicleName;
    }
    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }
    
    public double getPrice() {
        return price;
    }
    public void setPrice(double price) {
        this.price = price;
    }
}
