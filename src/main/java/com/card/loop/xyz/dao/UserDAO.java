/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.config.DatabaseManager;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.Criteria;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;
/**
 *
 * @author Vine Deiparine
 */
@Repository
public class UserDAO {
    @Autowired MongoOperations user;

    public User getUser(String username) throws UnknownHostException{ 
        User p = null;
        p = user.findOne(query(where("username").is(username)), User.class);
        return p;
    }
    /*public static User getUser(User user) throws UnknownHostException{ 
        MongoOperations user = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        User p = null;
        if(exists(user.getUsername(),user.getPassword()))
        p = user.findOne(query(where("username").is(user.getUsername())), User.class);
        return p;
    }*/
    
    public User getDeveloperUser(User user) throws UnknownHostException{ 
        return this.user.findOne(query(where("username").is(user.getUsername()).and("userType").is("developer")),User.class);
    }
    
    public List<User> getAllUser() throws UnknownHostException{ 
        return user.findAll(User.class);
    }
    
    public User getReviewerUser(User user) throws UnknownHostException{ 
        User p = null;
        if(exists(user.getUsername(),user.getPassword()))
        p = this.user.findOne(query(where("username").is(user.getUsername()).and("userType").is("reviewer")), User.class);
        return p;
    }
    public boolean addUser(User user) throws UnknownHostException{
        boolean ok = false;
        this.user.insert(user);
        ok = true;
        return ok;
    }
    public boolean editUser(User user) throws UnknownHostException{
        boolean ok = false;
        if(user!=null) {
        Update userUpdate = new Update();
        if(user.getPassword()!=null)
        userUpdate.set("password", user.getPassword());
        if(user.getEmail()!=null)
        userUpdate.set("email", user.getEmail());
        this.user.findAndModify(query(where("username").is(user.getUsername())), userUpdate, User.class);
        ok = true;
        }
        return ok;
    }
    
    public boolean blockUser(User user) throws UnknownHostException{
         boolean ok=false;
        Query query = new Query();
        query.addCriteria(where("_id").is(user.getId()));
        User obj = this.user.findOne(query, User.class);
        obj.setId(user.getId());
        obj.setBlocked(true);
        this.user.save(obj);
        return ok;
    }
    
    public boolean unblockUser(User user) throws UnknownHostException{
         boolean ok=false;
        Query query = new Query();
        query.addCriteria(where("_id").is(user.getId()));
        User obj = this.user.findOne(query, User.class);
        obj.setId(user.getId());
        obj.setBlocked(false);
        this.user.save(obj);
        return ok;
    }
    
    public boolean acceptUser(User user) throws UnknownHostException{
        boolean ok = false;        
        Query query = new Query();
        query.addCriteria(where("_id").is(user.getId()));
        User obj = this.user.findOne(query, User.class);
        obj.setId(user.getId());
        obj.setNewAccount(false);
        this.user.save(obj);
        return ok;
    }
    

    
    public boolean saveUser(User user) throws UnknownHostException{
        boolean ok = false;
        this.user.save(user);
        return ok;
    }
    
    public boolean deleteUser(User user) throws UnknownHostException{
        boolean ok = false;
        this.user.remove(user);
        ok = true;
        return ok;
    }
    
     
     
     
    
    public static void main(String []args) throws UnknownHostException{
            User user = new User();
           // user.setId(new Long(1));
            /**user.setEmail("admin@gmail.com");
            user.setBlocked(false);
            user.setUserName("admin");
      //      user = UserDAO.getUser(user);
            user.setPassword("admin");
            //user.generateToken();
            System.out.println("successfully pushed");*/
         //  System.out.println(UserDAO.getUser(user.getUsername(), user.getPassword())+ "get user");
            //System.out.println(UserDAO.deleteUser(user));
            //System.out.println(UserDAO.addUser(user));
            //System.out.println(UserDAO.exists("osiastedian"));
            //user = UserDAO.getUser(user);
            //UserDAO.deleteUser(user);
            // EXIST//
            
           //
            
            user.setUserName("dev1");
         //   UserDAO.acceptUser(user);

    }
    public boolean exists(String username, String password,String type) throws UnknownHostException{
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username).and("password").is(password).and("userType").is(type));
        ok = user.exists(query, User.class);
        return ok;
    }
    
    public boolean exists(String username, String userType) throws UnknownHostException{
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("username").is(username).andOperator(where("userType").is(userType)));
        ok = user.exists(query, User.class);
        return ok;
    }
    
    public boolean emailExists(String username,String email) throws UnknownHostException {
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("email").is(email).andOperator(where("username").is(username).not()));
        ok = user.exists(query, User.class);
        return ok;
    }
    
    public User getUser(String username,String password,String type) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username).and("password").is(password).and("userType").is(type));   
        User p = null;
        p = user.findOne(query, User.class);
        return p;
    }
    
    public User getUser(String username,String type) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(Criteria.where("username").is(username).and("userType").is(type));   
        User p = null;
        p = user.findOne(query, User.class);
        return p;
    }
    
    public List<User> getAllUserOfType(String type){return null;}
    public List<User> getBlockedUsers() throws UnknownHostException{
        return user.find(query(where("blocked").is(true)), User.class);
    }

    public List<User> getInactiveUsers() throws UnknownHostException {
        return user.find(query(where("inactive").is(true)), User.class);
    }

    public List<User> getReviewer() throws UnknownHostException {
        return user.find(query(where("userType").is("reviewer").andOperator((where("newAccount").is(false)).andOperator(where("blocked").is(false)))), User.class);
    }
    
    public List<User> getDeveloper() throws UnknownHostException {
        return user.find(query(where("userType").is("developer").andOperator((where("newAccount").is(false)).andOperator(where("blocked").is(false)))), User.class);
    }
    
    public List<User> getNewAccount() throws UnknownHostException {
        return user.find(query(where("newAccount").is(true)), User.class);
    }

    public static boolean exists(String username) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
}
