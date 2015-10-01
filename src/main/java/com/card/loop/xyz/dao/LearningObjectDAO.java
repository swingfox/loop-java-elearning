/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.config.DatabaseManager;
import com.card.loop.xyz.model.LearningObject;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.List;
import javax.swing.JOptionPane;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 *
 * @author David
 * 
 * @version 1.2 - 09/21/15
 * @author  Aislinn
 */
public class LearningObjectDAO {
    public static List<LearningObject> getList() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findAll(LearningObject.class);
    }
    
    /*
    * Get details of specific learning object
    */
    public static LearningObject getSpecificLearningObject(String lo) throws UnknownHostException {
       //MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       //mongoOps.find(query(where("rating").is(5)), LearningObject.class);
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        //Query query= new Query();
        //query.addCriteria(where("name").is(lo));
        //mongoOps.findo
        return mongoOps.findOne(query(where("name").is(lo)), LearningObject.class);
        //MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        //LearningObject p = null;
        //p = mongoOps.findOne(query(where("name").is(lo)), LearningObject.class);
       // System.out.println("USER DAO: " +p);
        //return p;
    }
    
    public static void addLearningObject(LearningObject object) throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
         mongoOps.insert(object);
    }
    
    public static List<LearningObject> getAllDownloadableLO() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return (mongoOps.find(query(where("rating").is(5)), LearningObject.class));
    }
    
    public static boolean nameAvailability(String name, String subject) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       mongoOps.find(query(where("rating").is(5)), LearningObject.class);
       Query query= new Query();
       query.addCriteria(where("name").is(name).andOperator(where("subject").is(subject)));
        return DatabaseManager.getMongoOpsInstance("loop").exists(query, LearningObject.class);
    }
    
    public static List<LearningObject> getAllLO() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.findAll(LearningObject.class);
    }
    
    public static List<LearningObject> getAllLODev(String username) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("uploadedBy").is(username)), LearningObject.class);
    }
    
    public static List<LearningObject> getAllLORev() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("rev").is(""))), LearningObject.class);
    }
    
    public static List<LearningObject> getAllLORevLater(String user) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("status").is(2)).andOperator(where("rev").is(user))), LearningObject.class);
    }
    
    /*public static boolean deleteLO(User user) throws UnknownHostException{
        MongoOperations mongoOps =DatabaseManager.getMongoOpsInstance("database");
        boolean ok = false;
        mongoOps.remove(user);
        ok = true;
        return ok;
    }*/    
    
    public static boolean exists(String id) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port), "database");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        ok = mongoOps.exists(query, LearningObject.class);
        return ok;
    }
    
    public static void main(String[] args) throws Exception {
        LearningObject lo = new LearningObject();
        
        
        lo.setName("HTML58");
        lo.setSubject("Web Programming");
        lo.setDateUploaded("September 25, 2015");
        lo.setDescription("test lng");
        lo.setRating(5);
        LearningObjectDAO.addLearningObject(lo);
        
        /**lo2.setLikes(20);
        lo2.setDownloads(153);
        lo2.setTitle("Biboaf");
        LearningObjectDAO.addLearningObject(lo2);
        
        lo3.setLikes(9);
        lo3.setDownloads(15);
        lo3.setTitle("Jjjownjii");
        LearningObjectDAO.addLearningObject(lo3);
        
        lo4.setLikes(50);
        lo4.setDownloads(73);
        lo4.setTitle("walksPerSecond");
        LearningObjectDAO.addLearningObject(lo4);*/
        
        //JOptionPane.showMessageDialog(null, LearningObjectDAO.getMostLikedList().toString());
        JOptionPane.showMessageDialog(null,LearningObjectDAO.getAllDownloadableLO());
        //System.out.println(LearningObjectDAO.getMostLikedList());
    }
}
