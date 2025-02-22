package com.datapackage.model;

import com.google.gson.annotations.SerializedName; // Optional: Uncomment if you need custom JSON keys

/**
 * Represents a user (or customer) with registration and login details.
 */
public class User {
    // Fields (JSON keys will match field names by default)
    // @SerializedName("id") // Uncomment and update if needed
    private int id;
    
    // @SerializedName("nic")
    private String nic;
    
    // @SerializedName("name")
    private String name;
    
    // @SerializedName("address")
    private String address;
    
    // @SerializedName("contact")
    private String contact;
    
    // @SerializedName("password")
    private String password;
    
    // @SerializedName("usertype")
    private String usertype;

    /**
     * Full constructor for registration.
     * 
     * @param id        the user id
     * @param nic       the NIC (National Identity Card) number
     * @param name      the user's name
     * @param address   the user's address
     * @param contact   the user's contact information
     * @param password  the user's password
     * @param usertype  the type of user (admin, user, employee, etc.)
     */
    public User(int id, String nic, String name, String address, String contact, String password, String usertype) {
        this.id = id;
        this.nic = nic;
        this.name = name;
        this.address = address;
        this.contact = contact;
        this.password = password;
        this.usertype = usertype;
    }
    
    /**
     * Default constructor.
     */
    public User() {}

    /**
     * Overloaded constructor for login (minimal fields).
     * 
     * @param id       the user id
     * @param name     the user's name
     * @param usertype the type of user
     */
    public User(int id, String name, String usertype) {
        this.id = id;
        this.name = name;
        this.usertype = usertype;
    }
    
    // Getters and setters for all fields
    
    public int getId() {
        return id;
    }
    
    public void setId(int id) {
        this.id = id;
    }
    
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
    
    public String getPassword() {
        return password;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }
    
    public String getUsertype() {
        return usertype;
    }
    
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }
    
    /**
     * Overridden toString() method for debugging purposes.
     */
    @Override
    public String toString() {
        return "User [id=" + id + ", nic=" + nic + ", name=" + name + ", address=" + address 
                + ", contact=" + contact + ", usertype=" + usertype + "]";
    }
}
