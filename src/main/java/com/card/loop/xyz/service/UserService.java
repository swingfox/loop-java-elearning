/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.UserDAO;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.User;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;

/**
 *
 * @author Vine Joy Deiparine
 * @date   09/21/2015s
 */
public class UserService {
    
    public boolean verify(UserDto user){return false;}
    public UserDto login(UserDto user) throws UnknownHostException{
        User userModel = UserDAO.getUser(user.getUsername(), user.getPassword());
        System.out.println("USER SERVICE CONTROLLER");
        if(userModel != null){
           if(userModel.getUsername().equals(user.getUsername()) && userModel.getPassword().equals(user.getPassword())){
           System.out.println("USER FOUND!!!");
           
            user.setId(userModel.getId());
            user.setEmail(userModel.getEmail());
            userModel.generateToken();
            user.setToken(userModel.getToken());
            user.setUsertype(userModel.getUserType());
            user.setLastActivity(userModel.getLastLogin());
            user.setLastDownload(userModel.getLastDownload());
            user.setLastLogin(new Date().toString());
            user.setBlocked(userModel.getBlocked());   
            user.setUsername(userModel.getUsername());
           }
        }
        return user;
    }
    public boolean register(UserDto user) throws UnknownHostException{
        boolean ok = false;
        if(!UserDAO.exists(user.getUsername(),user.getPassword())){
            User model = new User();
            model.setUserName(user.getUsername());
            model.setPassword(user.getPassword());
            //model.setFirstName(user.getFirstName());
            //model.setLastName(user.getLasstName());
            model.setEmail(user.getEmail());
            model.setUserType(user.getUsertype());
            model.setEmail(user.getEmail());
            model.setUserType(user.getUsertype());
            UserDAO.saveUser(model);
            ok = true;
        }
        return ok;
    }
    public boolean edit(UserDto user) throws UnknownHostException{return false;}
    public boolean block(UserDto user) throws UnknownHostException{return false;}
    public boolean unblock(UserDto user) throws UnknownHostException{return false;}
    public UserDto promote(String username) throws UnknownHostException{return null;}
    public UserDto demote(String username) throws UnknownHostException{return null;}
    public UserDto getUserInfo(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllUsers(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllDeveloper(UserDto user) throws UnknownHostException{
        return null;
    }
    public List<UserDto> getAllCommonUsers(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllPendingUsers(UserDto user) throws UnknownHostException{return null;}
    public boolean appoveUserRegistration(UserDto user) throws UnknownHostException{return false;}
    
    
    
}
