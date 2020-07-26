/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/*
 * @author Julie Jane Alegre
 */

@Document(collection = "user")
public class User {
    /*
     *Assign id number
     */
    @Id
    private String id;
    /*
     *Assign username
     */
    private String username;
    /*
     *Assign password
     */
    private String password;
    /*
     *Date of last log in
     */
    private String lastLogin;
    /*
     *Date of last download
     */
    private String lastDownload;
    /*
     *1-not blocked, 0-blocked
     */
    private boolean blocked;
    /*
     *Sign your email address
     */
    private String email;
    /*
     *Sign your user type
     *reviewer or developer
     */
    private String userType;
    private boolean newAccount;
    /*
     ** token
     */
    private String token;

    /**
     * Get the id of the user
     *
     * @return id:Long
     */
    public String getId() {
        return this.id;
    }

    /**
     * Set the id of the user
     *
     * @param String id
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * Get the username of the user
     *
     * @return username:String
     */
    public String getUsername() {
        return this.username;
    }

    /**
     * Get the date the user log in
     *
     * @return lastLogin:String
     */
    public String getLastLogin() {
        return this.lastLogin;
    }

    /**
     * Set the date the user last login
     *
     * @param String lastLogin
     */
    public void setLastLogin(String lastLogin) {
        this.lastLogin = lastLogin;

    }

    /**
     * Get the date the user download
     *
     * @return lastDownload:String
     */
    public String getLastDownload() {
        return this.lastDownload;
    }

    /**
     * Set the date the user last downloaded
     *
     * @param String lastDownload
     */
    public void setLastDownload(String lastDownload) {
        this.lastDownload = lastDownload;
    }

    /**
     * Get the status of the user (blocked or unblocked)
     *
     * @return blocked:boolean
     */
    public boolean getBlocked() {
        return this.blocked;
    }

    /**
     * Set the user if he's blocked or not
     *
     * @param blocked boolean
     */
    public void setBlocked(boolean blocked) {
        this.blocked = blocked;
    }

    /**
     * Get the email of the user
     *
     * @return email:String
     */
    public String getEmail() {
        return this.email;
    }

    /**
     * Set the email of the user
     *
     * @param String email
     */
    public void setEmail(String email) {
        this.email = email;
    }

    /**
     * Get the usertype
     *
     * @return usertype:String
     */
    public String getUserType() {
        return this.userType;
    }

    /**
     * Set the usertype
     *
     * @param String usertype
     */
    public void setUserType(String usertype) {
        this.userType = usertype;
    }

    /**
     * Set the username of the user
     *
     * @param String username
     */
    public void setUserName(String username) {
        this.username = username;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public void generateToken() {
        this.token = java.util.UUID.randomUUID().toString();
    }

    public String getToken() {
        return token;
    }

    public void setToken(String token) {
        this.token = token;
    }

    public boolean isNewAccount() {
        return newAccount;
    }


    public void setNewAccount(boolean newAccount) {
        this.newAccount = newAccount;
    }

    public boolean getAccepted() {
        return newAccount;
    }

}
