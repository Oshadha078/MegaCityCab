package com.datapackage.model;

public class Vehicleprice {

    private int id;
    private String vehicleNo;
    private double price;
    private String vehicleName;
    
    // Default constructor
    public Vehicleprice() { }
    
    // Parameterized constructor
    public Vehicleprice(int id, String vehicleNo, double price, String vehicleName) {
        this.id = id;
        this.vehicleNo = vehicleNo;
        this.price = price;
        this.vehicleName = vehicleName;
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
    
    public double getPrice() {
        return price;
    }
    
    public void setPrice(double price) {
        this.price = price;
    }
    
    public String getVehicleName() {
        return vehicleName;
    }
    
    public void setVehicleName(String vehicleName) {
        this.vehicleName = vehicleName;
    }
}
