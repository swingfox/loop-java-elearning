/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dto;

import java.util.List;

/**
 *
 * @author Julie Jane A. Alegre
 */
public class UserDto {
    /*
    *id number of the user
    */
    private Long id;
    /*
    *username of the user
    */
    private String username;
     /*
    *passsword of the user
    */
    private String password;
     /*
    *email of the user
    */
    private String email;
     /*
    *usertype of the user
    */
    private String usertype;
     /*
    *blocked or unblocked the user
    */
    private boolean blocked;
     /*
    *date of the last log in
    */
    private String lastLogin;
    /*
    *Date of last download
    */
    private String lastDownload;    
     /*
    *date of the last activity
    */
    private String lastActivity;
     /*
    *accepted the user
    */
    private boolean accepted;
     /*
    *error list
    */
    private List<String> errorList;

    
    /**
     * 
     * @return Long - Get the Id number of the user
     */
    public Long getId() {
        return id;
    }
     /**
     * This sets the id of the user
     * @param id Long
     */
    public void setId(Long id) {
        this.id = id;
    }
    
     /**
     * 
     * @return String - Get the username of the user
     */
    public String getUsername() {
        return username;
    }

    /**
     * This sets the username of the user
     * @param username String
     */
    public void setUsername(String username) {
        this.username = username;
    }
     /**
     * 
     * @return String - Get the password of the user
     */
    public String getPassword() {
        return password;
    }

    /**
     * This sets the password of the user
     * @param password String
     */
    public void setPassword(String password) {
        this.password = password;
    }

     /**
     * 
     * @return String - Get the email of the user
     */
    public String getEmail() {
        return email;
    }

    /**
     * This sets the email of the user
     * @param email String
     */
    public void setEmail(String email) {
        this.email = email;
    }

     /**
     * 
     * @return String - Get the type of the user
     */
    public String getUsertype() {
        return usertype;
    }

    /**
     * This sets the type of the user
     * 
     * @param usertype String
     */
    public void setUsertype(String usertype) {
        this.usertype = usertype;
    }

     /**
     * 
     * @return boolean - Get the status of the user (blocked or unblocked)
     */
    public boolean getBlocked() {
        return blocked;
    }

    /**
     * This sets the status of the user (blocked or unblocked)
     * @param blocked boolean
     */
    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

     /**
     * 
     * @return String - Get the last date the user log in
     */
    public String getLastLogin() {
        return lastLogin;
    }

    /**
     * This sets the date the user last log in
     * @param lastLogin String 
     */
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;
    }

     /**
     * 
     * @return String - Get the date of the last activity of the user
     */
    public String getLastActivity() {
        return lastActivity;
    }

    /**
     * This sets the date of the last activity of the user
     * @param rating String lastActivity
     */
    public void setLastActivity(String lastActivity) {
        this.lastActivity = lastActivity;
    }

     /**
     * 
     * @return boolean - Get the status of the user (accepted or unaccepted )
     */
    public boolean isAccepted() {
        return accepted;
    }

    /**
     * This sets the status of user (accepted or unaccepted)
     * @param accepted boolean
     */
    public void setAccepted(boolean accepted) {
        this.accepted = accepted;
    }
    
    /**
     * 
     * @return List<String> This returns the list of errors in the learning element
     */
    public List<String> getErrorList() {
        return errorList;
    }
    /**
    * Sets the list of errors of the learning element
    * @param errorList List<String>
    */
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }

    public String getLastDownload() {
        return lastDownload;
    }

    public void setLastDownload(String lastDownload) {
        this.lastDownload = lastDownload;
    }
    
}
