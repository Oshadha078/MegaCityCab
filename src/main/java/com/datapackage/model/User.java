package com.datapackage.model;

public class User {
    private int id;
    private String name;
    private String usertype;
    private String nic;
    private String address;
    private String contact;
    private String password;

    // ✅ Constructor used for login (id, name, usertype)
    public User(int id, String name, String usertype) {
        this.id = id;
        this.name = name;
        this.usertype = usertype;
    }

    // ✅ Default constructor
    public User() {}

    // ✅ Constructor for registration (all fields)
    public User(String nic, String name, String address, String contact, String password, String usertype) {
        this.nic = nic;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.password = password;
        this.usertype = usertype;
    }

    // ✅ Getters and Setters
    public int getId() { return id; }
    public String getName() { return name; }
    public String getUsertype() { return usertype; }
    public String getNic() { return nic; }
    public String getAddress() { return address; }
    public String getContact() { return contact; }
    public String getPassword() { return password; }

    public void setId(int id) { this.id = id; }
    public void setName(String name) { this.name = name; }
    public void setUsertype(String usertype) { this.usertype = usertype; }
    public void setNic(String nic) { this.nic = nic; }
    public void setAddress(String address) { this.address = address; }
    public void setContact(String contact) { this.contact = contact; }
    public void setPassword(String password) { this.password = password; }
}
