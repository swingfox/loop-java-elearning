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
        if(userModel != null){
            user.setId(userModel.getID());
            user.setEmail(userModel.getEmail());
            //user.setFirstName(userModel.getFirstName());
<<<<<<< HEAD
            //user.setLastName(userModel.getLastName());
            user.setLastDownload(userModel.getLastDownload());
            //user.setLastDownloadId(userModel.getLastDownloadId());
            user.setLastLogin(new Date().toString());
            //userModel.generateToken();
            //user.setApproved(userModel.isApproved());
            user.setBlocked(userModel.getBlocked());
            //user.setFunctionType(userModel.getFunctionType());
            user.setUsertype(userModel.getUserType());
=======
            //.setLastName(userModel.getLastName());
            user.setLastDownload(userModel.getLastDownload());
            //user.setLastDownloadId(userModel.getLastDownloadId());
            user.setLastLogin(new Date());
            //userModel.generateToken();
            //user.setApproved(userModel.isApproved());
            user.setBlocked(userModel.isBlocked());
            //user.setFunctionType(userModel.getFunctionType());
            user.setUserType(userModel.getUserType());
>>>>>>> 725d69648ace8fbf6b9be269958253fa7959fbb8
            //user.setToken(userModel.getToken());            
        }
        return user;
    }
    public boolean register(UserDto user) throws UnknownHostException{
        boolean ok = false;
        if(!UserDAO.exists(user.getUsername())){
            User model = new User();
            model.setUserName(user.getUsername());
            model.setPassword(user.getPassword());
<<<<<<< HEAD
            //model.setFirstName(user.getFirstName());
            //model.setLastName(user.getLastName());
            model.setEmail(user.getEmail());
            model.setUserType(user.getUsertype());
=======
            model.setEmail(user.getEmail);
            model.setUserType(user.getUserType());
>>>>>>> 725d69648ace8fbf6b9be269958253fa7959fbb8
            UserDAO.addUser(model);
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
    public List<UserDto> getAllAdmin(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllCommonUsers(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllPendingUsers(UserDto user) throws UnknownHostException{return null;}
    public boolean appoveUserRegistration(UserDto user) throws UnknownHostException{return false;}
    
    
    
}
