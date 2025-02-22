package com.datapackage.model;

public class Customer {
    private String nic;
    private String name;
    private String address;
    private String contact;
    private String usertype;
    private String password; // Used only during creation

    public Customer() {}

    // Constructor used in registration (creation)
    public Customer(String nic, String name, String address, String contact, String usertype, String password) {
        this.nic = nic;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.usertype = usertype;
        this.password = password;
    }

    // Constructor used for updates or queries (password not required)
    public Customer(String nic, String name, String address, String contact, String usertype) {
        this.nic = nic;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.usertype = usertype;
    }

    // Getters and setters
    public String getNic() {
        return nic;
    }
    public void setNic(String nic) {
        this.nic = nic;
    }
    
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    
    public String getAddress() {
        return address;
    }
    public void setAddress(String address) {
        this.address = address;
    }
    
    public String getContact() {
        return contact;
    }
    public void setContact(String contact) {
        this.contact = contact;
    }
    
    public String getUsertype() {
        return usertype;
    }
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
    public String getPassword() {
        return password;
    }
    public void setPassword(String password) {
        this.password = password;
    }
}
