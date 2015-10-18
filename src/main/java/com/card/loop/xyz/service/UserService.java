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
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Vine Joy Deiparine
 */

@Service
public class UserService {
    @Autowired UserDAO dao;
    
    public boolean verify(UserDto user){return false;}
    
    public UserDto login(UserDto user) throws UnknownHostException{
        User userModel = dao.getUser(user.getUsername(), user.getPassword(),user.getUsertype());
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
        if(!dao.exists(user.getUsername(),user.getPassword())){
            User model = new User();
            model.setUserName(user.getUsername());
            model.setPassword(user.getPassword());
            model.setEmail(user.getEmail());
            model.setUserType(user.getUsertype());
            model.setEmail(user.getEmail());
            model.setBlocked(false);
            model.setAccepted(false);
            model.setLastLogin(new Date().toString());
            dao.saveUser(model);
            ok = true;
        }
        return ok;
    }
    public boolean blockUser(UserDto user) throws UnknownHostException{
        User obj = new User();
        if(!UserDAO.exists(user.getUsername())){
            obj.setBlocked(true);
            obj.setEmail(user.getEmail());
            obj.setLastDownload(user.getLastDownload());
            obj.setLastLogin(user.getLastLogin());
            obj.setUserName(user.getUsername());
            obj.setUserType(user.getUsertype());
            obj.setPassword(user.getPassword());
        }
        return dao.blockUser(obj); 
    }
    
    public boolean edit(UserDto user) throws UnknownHostException{
        User obj = new User();
        if(!UserDAO.exists(user.getUsername())){
            obj.setBlocked(user.getBlocked());
            obj.setEmail(user.getEmail());
            obj.setLastDownload(user.getLastDownload());
            obj.setLastLogin(user.getLastLogin());
            obj.setUserName(user.getUsername());
            obj.setUserType(user.getUsertype());
            obj.setPassword(user.getPassword());
        }
        return dao.editUser(obj);
    }
    
    public boolean acceptUser(UserDto user) throws UnknownHostException, Exception{
        /*User obj = new User();
        if(!UserDAO.exists(user.getUsername())){
            obj.setBlocked(user.getBlocked());
            obj.setEmail(user.getEmail());
            obj.setLastDownload(user.getLastDownload());
            obj.setLastLogin(user.getLastLogin());
            obj.setUserName(user.getUsername());
            obj.setUserType(user.getUsertype());
            obj.setPassword(user.getPassword());
            obj.setAccepted(false);
        }
        return UserDAO.blockUser(obj); */
        boolean ok = false;
        User model = dao.getUser(user.getId());
        if(model!= null){
            model.setBlocked(true);
            model.setUserName("hehehhe");
            dao.blockUser(model);
            System.out.println("ID??"+model.getId());
            
            System.out.println("Username??"+model.getUsername());
            System.out.println("Is blocked??"+model.getBlocked());
            ok = true;
        }
        else
            throw new Exception("User does not exist. ");
        return ok;
        
    }    
    
    public boolean block(UserDto user) throws UnknownHostException, Exception{
       //console.log("USERSERVICE NI");
        
        boolean ok = false;
        User model = dao.getUser(user.getId());
        if(model!= null){
            model.setBlocked(true);
            dao.blockUser(model);
            System.out.println("ID??"+model.getId());
            
            System.out.println("Username??"+model.getUsername());
            System.out.println("Is blocked??"+model.getBlocked());
            ok = true;
        }
        else
            throw new Exception("User does not exist. ");
        return ok;
    }
    
    public static void main(String args[]) throws Exception{
        UserDto u= new UserDto();
        u.setId("56045d3995840640f703d356");
        
        //System.out.println(block(u));
    }

   
    
    public List<UserDto> getBlockedUsers() throws UnknownHostException{
         List<UserDto> objects = new ArrayList<>();
         List<User> userList = dao.getBlockedUsers();
         for(User model: userList){
            UserDto dto = new UserDto();
            dto.setLastLogin(model.getLastLogin());
            dto.setUsertype(model.getUserType());
            dto.setUsername(model.getUsername());
            objects.add(dto);
         }
        return objects;
    }
    public List<UserDto> inactive() throws UnknownHostException{
         List<UserDto> objects = new ArrayList<>();
         List<User> userList = dao.getInactiveUsers();
         for(User model: userList){
            UserDto dto = new UserDto();
            dto.setLastLogin(model.getLastLogin());
            dto.setUsertype(model.getUserType());
            dto.setUsername(model.getUsername());
            objects.add(dto);
         }
         return objects;
     }
     
     public List<UserDto> getAllReviewer() throws UnknownHostException{
         List<UserDto> objects = new ArrayList<>();
         List<User> userList = dao.getReviewer();
         for(User model: userList){
            UserDto dto = new UserDto();
            dto.setLastDownload(model.getLastDownload());
            dto.setLastLogin(model.getLastLogin());
            dto.setUsername(model.getUsername());
            objects.add(dto);
         }
         return objects;
     }
    public boolean unblock(UserDto user) throws UnknownHostException{return false;}
    public UserDto promote(String username) throws UnknownHostException{return null;}
    public UserDto demote(String username) throws UnknownHostException{return null;}
    public UserDto getUserInfo(UserDto user) throws UnknownHostException{return null;}
    public List<UserDto> getAllUsers(UserDto user) throws UnknownHostException{
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getAllUser();
         for(User model: userList){
            UserDto dto = new UserDto();
            dto.setLastUpload(model.getLastDownload());
            dto.setLastLogin(model.getLastLogin());
            dto.setUsername(model.getUsername());
            objects.add(dto);
         }
         return objects;
    }
    public List<UserDto> getAllDeveloper() throws UnknownHostException{
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getDeveloper();
         for(User model: userList){
            UserDto dto = new UserDto();
            dto.setLastUpload(model.getLastDownload());
            dto.setLastLogin(model.getLastLogin());
            dto.setUsername(model.getUsername());
            objects.add(dto);
         }
         return objects;
    }
    
    public List<UserDto> getAllNewAccount() throws UnknownHostException{
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getNewAccount();
         for(User model: userList){
            UserDto dto = new UserDto();
            dto.setUsertype(model.getUserType());
            dto.setEmail(model.getEmail());
            dto.setUsername(model.getUsername());
            dto.setId(model.getId());
            objects.add(dto);
         }
         return objects;
    }
    public List<UserDto> getAllNewUsers(UserDto user) throws UnknownHostException{return null;}
    public boolean appoveUserRegistration(UserDto user) throws UnknownHostException{return false;}
}
