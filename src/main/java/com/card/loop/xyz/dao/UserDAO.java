/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.config.DatabaseManager;
import com.card.loop.xyz.model.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
/**
 *
 * @author Vine Deiparine
 * @date   09/21/2015
 */
public class UserDAO {
    
    
    public static User getUser(User user) throws UnknownHostException{ 
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        User p = null;
        p = mongoOps.findOne(query(where("username").is(user.getUsername())), User.class);
        return p;
    }
    public static boolean addUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host),"loop");
        boolean ok = false;
        mongoOps.insert(user);
        ok = true;
        return ok;
    }
    public static boolean editUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(user.getUsername()));
        Update update = new Update();
        update.addToSet("password", user.getPassword());
        //update.addToSet("firstName",user.getFirstName());
    mongoOps.updateFirst(query,update,User.class);
        ok = true;
        return ok;
    }
    public static boolean saveUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        mongoOps.save(user);
        return ok;
    }
    public static boolean deleteUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        mongoOps.remove(user);
        ok = true;
        return ok;
    }
    public static void main(String []args){
        try {
            User user = new User();
            user.setUserName("admin");
            user = UserDAO.getUser(user);
            user.setPassword("admin");
            //user.generateToken();
            System.out.println(UserDAO.saveUser(user));
            //System.out.println(UserDAO.deleteUser(user));
            //System.out.println(UserDAO.addUser(user));
            //System.out.println(UserDAO.exists("osiastedian"));
            //user = UserDAO.getUser(user);
            //UserDAO.deleteUser(user);
            // EXIST//
            
        } catch (UnknownHostException ex) {
            ex.printStackTrace();
        }
    }
    public static boolean exists(String username) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username));
        ok = mongoOps.exists(query, User.class);
        return ok;
    }
    public static User getUser(String username,String password) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("username").is(username).andOperator(where("password").is(password)));
        return DatabaseManager.getMongoOpsInstance("loop").findOne(query, User.class);
    }
    public static List<User> getAllUserOfType(String type){return null;}
}
