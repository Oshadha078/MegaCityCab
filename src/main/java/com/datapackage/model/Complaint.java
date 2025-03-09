package com.datapackage.model;

import java.sql.Date;

public class Complaint {
    private int complaintId;
    private String userId;
    private String userName;
    private String subject;
    private String description;
    private String status;
    private Date dateFiled;
    private String adminReply;

    public Complaint() {}

    public Complaint(int complaintId, String userId, String userName, String subject,
                     String description, String status, Date dateFiled, String adminReply) {
        this.complaintId = complaintId;
        this.userId = userId;
        this.userName = userName;
        this.subject = subject;
        this.description = description;
        this.status = status;
        this.dateFiled = dateFiled;
        this.adminReply = adminReply;
    }

    // Getters and Setters

    public int getComplaintId() {
        return complaintId;
    }
    public void setComplaintId(int complaintId) {
        this.complaintId = complaintId;
    }

    public String getUserId() {
        return userId;
    }
    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }
    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getSubject() {
        return subject;
    }
    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }
    public void setDescription(String description) {
        this.description = description;
    }

    public String getStatus() {
        return status;
    }
    public void setStatus(String status) {
        this.status = status;
    }

    public Date getDateFiled() {
        return dateFiled;
    }
    public void setDateFiled(Date dateFiled) {
        this.dateFiled = dateFiled;
    }

    public String getAdminReply() {
        return adminReply;
    }
    public void setAdminReply(String adminReply) {
        this.adminReply = adminReply;
    }
    
}
