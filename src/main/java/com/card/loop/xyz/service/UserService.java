/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.UserDAO;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.User;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * @author Vine Joy Deiparine
 */

@Service
public class UserService {
    @Autowired
    UserDAO dao;

    public boolean verify(UserDto user) {
        return false;
    }

    public UserDto login(UserDto user) throws UnknownHostException {
        User userModel = dao.getUser(user.getUsername(), user.getPassword(), user.getUsertype());
        if (userModel != null) {
            if (userModel.getUsername().equals(user.getUsername()) && userModel.getPassword().equals(user.getPassword())) {
                System.out.println("USER FOUND!!!");

                user.setId(userModel.getId());
                user.setEmail(userModel.getEmail());
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

    public boolean register(UserDto user) throws UnknownHostException {
        boolean ok = false;
        if (!dao.exists(user.getUsername(), user.getUsertype())) {
            User model = new User();
            model.setUserName(user.getUsername());
            model.setPassword(user.getPassword());
            model.setEmail(user.getEmail());
            model.setUserType(user.getUsertype());
            model.setEmail(user.getEmail());
            model.setBlocked(false);
            model.setNewAccount(true);
            model.setLastLogin(new Date().toString());
            dao.saveUser(model);
            ok = true;
        }
        return ok;
    }

    public boolean blockUser(UserDto user) throws UnknownHostException {
        User obj = new User();
        if (!dao.exists(user.getUsername())) {
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

    public boolean editPassword(UserDto user) throws UnknownHostException {
        User obj = dao.getUser(user.getUsername(), user.getUsertype());
        if (obj != null) {
            obj.setPassword(user.getPassword());
        } else
            return false;
        return dao.editUser(obj);
    }

    public boolean editEmail(UserDto user) throws UnknownHostException {
        User obj = dao.getUser(user.getUsername(), user.getUsertype());
        if (obj != null) {
            if (!dao.emailExists(user.getUsername(), user.getEmail()))
                obj.setEmail(user.getEmail());
        } else
            return false;
        return dao.editUser(obj);
    }

    public boolean accept(UserDto user) throws Exception {
        boolean ok = false;
        User model = dao.getUser(user.getUsername());
        if (model != null) {
            model.setNewAccount(false);
            dao.acceptUser(model);
            ok = true;
        } else
            throw new Exception("User does not exist. ");
        return ok;

    }

    public boolean block(UserDto user) throws Exception {
        boolean ok = false;

        User model = dao.getUser(user.getUsername());
        if (model != null) {
            model.setBlocked(true);
            dao.blockUser(model);
            ok = true;
        } else
            throw new Exception("User does not exist. ");
        return ok;
    }

    public boolean unblock(UserDto user) throws Exception {
        boolean ok = false;

        User model = dao.getUser(user.getUsername());
        if (model != null) {
            model.setBlocked(false);
            dao.unblockUser(model);
            ok = true;
        } else
            throw new Exception("User does not exist. ");
        return ok;
    }

    public List<UserDto> getBlockedUsers() throws UnknownHostException {
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getBlockedUsers();
        for (User model : userList) {
            UserDto dto = new UserDto();
            dto.setLastLogin(model.getLastLogin());
            dto.setUsertype(model.getUserType());
            dto.setUsername(model.getUsername());
            objects.add(dto);
        }
        return objects;
    }

    public List<UserDto> inactive() throws UnknownHostException {
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getInactiveUsers();
        for (User model : userList) {
            UserDto dto = new UserDto();
            dto.setLastLogin(model.getLastLogin());
            dto.setUsertype(model.getUserType());
            dto.setUsername(model.getUsername());
            objects.add(dto);
        }
        return objects;
    }

    public List<UserDto> getAllReviewer() throws UnknownHostException {
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getReviewer();
        for (User model : userList) {
            UserDto dto = new UserDto();
            dto.setLastDownload(model.getLastDownload());
            dto.setLastLogin(model.getLastLogin());
            dto.setUsername(model.getUsername());
            objects.add(dto);
        }
        return objects;
    }

    public UserDto getUserInfo(String user, String usertype) throws UnknownHostException {
        User userinfo = dao.getUser(user, usertype);
        UserDto newUser = new UserDto();
        if (userinfo != null) {
            newUser.setVariables(userinfo);
        }
        return newUser;
    }

    public List<UserDto> getAllUsers(UserDto user) throws UnknownHostException {
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getAllUser();
        for (User model : userList) {
            UserDto dto = new UserDto();
            dto.setLastUpload(model.getLastDownload());
            dto.setLastLogin(model.getLastLogin());
            dto.setUsername(model.getUsername());
            objects.add(dto);
        }
        return objects;
    }

    public List<UserDto> getAllDeveloper() throws UnknownHostException {
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getDeveloper();
        for (User model : userList) {
            UserDto dto = new UserDto();
            dto.setLastUpload(model.getLastDownload());
            dto.setLastLogin(model.getLastLogin());
            dto.setUsername(model.getUsername());
            objects.add(dto);
        }
        return objects;
    }

    public List<UserDto> getAllNewAccount() throws UnknownHostException {
        List<UserDto> objects = new ArrayList<>();
        List<User> userList = dao.getNewAccount();
        for (User model : userList) {
            UserDto dto = new UserDto();
            dto.setUsertype(model.getUserType());
            dto.setEmail(model.getEmail());
            dto.setUsername(model.getUsername());
            dto.setId(model.getId());
            objects.add(dto);
        }
        return objects;
    }
}
