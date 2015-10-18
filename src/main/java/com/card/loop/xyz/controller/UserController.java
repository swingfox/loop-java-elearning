/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.service.UserService;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Vine Deiparine
 * @date   09/21/2015
 */
@RestController
@RequestMapping("/user")
public class UserController {
    @Autowired UserService service;

    @RequestMapping("/signup")
    @ResponseBody
    public UserDto signup(@RequestBody UserDto user) throws UnknownHostException
    {
        try{
        boolean ok = service.register(user);
            if(ok==false){
                System.out.println("HAHA");
            }
        }catch(Exception e){
            e.printStackTrace();
        }
        return user;
    }
    
    
    @RequestMapping("/login")
    @ResponseBody
    public UserDto login(@RequestBody UserDto user) throws UnknownHostException
    {
        UserDto result = null;
        try{
            result = service.login(user);
            if(result==null)
                user.getErrorList().add("Username or password is invalid.");
        }catch(Exception e){
            System.out.println(e.toString());
        }
        return result;
    }
    
    @RequestMapping("/newAccountRequests")
    public List<UserDto>  accountRequests(){
        List<UserDto> result = null;
        try{
            result = service.getAllNewAccount();
            if(result==null)
                return null;
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    @RequestMapping("/developer")
    public List<UserDto>  accountDeveloper(){
        List<UserDto> result = null;
        try{
            result = service.getAllDeveloper();
            if(result==null)
               return null;
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    @RequestMapping("/validate")
    public boolean validate(UserDto user){return false;}
    
    @RequestMapping("/edit")
    public boolean edit(UserDto user){return false;}
    
    @RequestMapping("/approve")
    public boolean approve(UserDto user) throws UnknownHostException, Exception{
        return service.acceptUser(user);
    }
    
    @RequestMapping("/promote")
    public boolean promote(UserDto user){return false;}
    
    @RequestMapping("/demote")
    public boolean demote(UserDto user){return false;}
    
    @RequestMapping("/block")
    public List<UserDto> getAllBlockedUsers(){
     List<UserDto> result = null;
        try{
            result = service.getBlockedUsers();
            if(result==null);
             //   user.getErrorList().add("NULLL!");
        }catch(Exception e){
            //user.getErrorList().add(e.toString());
            System.out.println(e.toString());
        }
        return result;
    }
    
   /* @RequestMapping("/blockUser/{id}")
    @ResponseBody
    public boolean blockUser(@RequestBody UserDto user) throws UnknownHostException{
        UserService service = new UserService();
        return service.blockUser(user);
    }*/
   
    @RequestMapping("/blockUser/{username}")
    @ResponseBody
    public boolean blockUser(@PathVariable String username) throws UnknownHostException, Exception{
        UserDto ud = new UserDto();
        ud.setUsername(username);
        return service.block(ud);
    }
    
    @RequestMapping("/unblockUser/{username}")
    @ResponseBody
    public boolean unblockUser(@PathVariable String username) throws UnknownHostException, Exception{
        UserDto ud = new UserDto();
        ud.setUsername(username);
        return service.unblock(ud);
    }
    
    @RequestMapping("/reviewer")
    public List<UserDto> reviewerUser(){
     List<UserDto> result = null;
        try{
            result = service.getAllReviewer();
            if(result==null)
                return null;
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    @RequestMapping("/inactive")
    public List<UserDto> inactiveUser(){
     List<UserDto> result = null;
        try{
            result = service.inactive();
            if(result==null)
                return null;
        }catch(Exception e){
            e.printStackTrace();
        }
        return result;
    }
    
    @RequestMapping("/unblock")
    public boolean unblock(UserDto user){return false;}
    
    @RequestMapping("/admins")
    public List<UserDto> admins(UserDto user){return null;}
    
    @RequestMapping("/commonUsers")
    public List<UserDto> commonUsers(UserDto user){return null;}
}
