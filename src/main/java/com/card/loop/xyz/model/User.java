/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.model;

import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author Julie Jane Alegre
 * [September 09, 2015] - Julie Jane Alegre  -   Initial Codes 
 * [September 22, 2015] - David Ramirez      -   Added annotations
 */

@Document(collection = "user")
public class User {
    /*
    *Assign id number
    */
    @Id
    private Long id;
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
    private String usertype;

/**
 * Get the id of the user
 * @return id:Long
 */		
public Long getID(){
        return this.id;
}
/**
 * Get the username of the user
 * @return username:String
 */	
public String getUserName(){
        return this.username;
}
/**
 * Get the date the user log in
 * @return lastLogin:String
 */	
public String getLastLogin(){
        return this.lastLogin;
}
/**
 * Get the date the user download
 * @return lastDownload:String
 */	
public String getLastDownload(){
        return this.lastDownload;
}
/**
 * Get the status of the user (blocked or unblocked)
 * @return blocked:boolean
 */
public boolean getBlocked(){
        return this.blocked;
}
/**
 * Get the email of the user
 * @return email:String
 */
public  String getEmail(){
        return this.email;
}
/**
 * Get the usertype
 * @return usertype:String
 */
public String getUserType(){
        return this.usertype;
}
/**
 * Set the usertype
 * @param String usertype
 */
public void setUserType(String usertype){
        this.usertype = usertype;
}
/**
 * Set the email of the user
 * @param String email
 */
public void setEmail(String email){
        this.email = email;
}

/**
 * Set the id of the user
 * @param Long id
 */
public void setID(Long id){
        this.id = id;
}
/**
 * Set the username of the user
 * @param String username
 */
public void setUserName(String username){
        this.username = username;
}
/**
 * Set the date the user last login
 * @param String lastLogin
 */
public void setLastLogin(String lastLogin){
         this.lastLogin= lastLogin;
        
}
/**
 * Set the date the user last downloaded
 * @param String lastDownload
 */
public void setLastDownload(String lastDownload){
         this.lastDownload= lastDownload;
}
/**
 * Set the user if he's blocked or not
 * @param boolean block
 */
public void setBlocked(boolean blocked){
         this.blocked = blocked;
}

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
}
