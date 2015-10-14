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
import org.springframework.data.mongodb.core.query.Criteria;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
/**
 *
 * @author Vine Deiparine
 */
public class UserDAO {

    public static User getUser(User user) throws UnknownHostException{ 
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        User p = null;
        if(exists(user.getUsername(),user.getPassword()))
        p = mongoOps.findOne(query(where("username").is(user.getUsername())), User.class);
        return p;
    }
    
    public static User getDeveloperUser(User user) throws UnknownHostException{ 
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findOne(query(where("username").is(user.getUsername()).and("userType").is("developer")),User.class);
    }
    
    public static List<User> getAllUser() throws UnknownHostException{ 
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findAll(User.class);
    }
    
    public static User getReviewerUser(User user) throws UnknownHostException{ 
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        User p = null;
        if(exists(user.getUsername(),user.getPassword()))
        p = mongoOps.findOne(query(where("username").is(user.getUsername()).and("userType").is("reviewer")), User.class);
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
    
    public static boolean blockUser(User user) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(user.getUsername()));
        Update update = new Update();
        update.addToSet("blocked", true);
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
            User user = new User();
           // user.setId(new Long(1));
            user.setEmail("admin@gmail.com");
            user.setBlocked(false);
            user.setUserName("admin");
      //      user = UserDAO.getUser(user);
            user.setPassword("admin");
            //user.generateToken();
            System.out.println("successfully pushed");
         //   System.out.println(UserDAO.getUser(user.getUsername(), user.getPassword())+ "get user");
            //System.out.println(UserDAO.deleteUser(user));
            //System.out.println(UserDAO.addUser(user));
            //System.out.println(UserDAO.exists("osiastedian"));
            //user = UserDAO.getUser(user);
            //UserDAO.deleteUser(user);
            // EXIST//

    }
    public static boolean exists(String username, String password,String type) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username).and("password").is(password).and("userType").is(type));
        ok = mongoOps.exists(query, User.class);
        return ok;
    }
    
    public static boolean exists(String username, String password) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username).and("password").is(password));
        ok = mongoOps.exists(query, User.class);
        return ok;
    }
    public static User getUser(String username,String password,String type) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username).and("password").is(password).and("userType").is(type));   
        User p = null;
        if(exists(username,password,type))
           p = DatabaseManager.getMongoOpsInstance("loop").findOne(query, User.class);
        return p;
    }
    public static List<User> getAllUserOfType(String type){return null;}
    public static List<User> getBlockedUsers() throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("blocked").is(true)), User.class);
    }

    public static List<User> getInactiveUsers() throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("inactive").is(true)), User.class);
    }

    public static List<User> getReviewer() throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("userType").is("reviewer")), User.class);
    }
    
    public static List<User> getDeveloper() throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("userType").is("developer")), User.class);
    }
    
    public static List<User> getNewAccount() throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("newAccount").is(true)), User.class);
    }

    public static boolean exists(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
