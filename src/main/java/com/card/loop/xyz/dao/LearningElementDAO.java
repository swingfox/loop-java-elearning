/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.config.DatabaseManager;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.Date;
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
 * @author Julie Jane Alegre 
 * Date: September 21,2015 
 */
public class LearningElementDAO {
    
    public static List<LearningElement> getList() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findAll(LearningElement.class);
    }
    
    public static boolean exists(String id) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port), "loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        ok = mongoOps.exists(query, LearningElement.class);
        return ok;
    }
 
    public static boolean updateList(LearningElement object) throws UnknownHostException {
        try {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
            
         mongoOps.insert(object);
         return true;         
        } 
        catch (NullPointerException e) {
            System.out.println(e.getMessage());
            return false;
        }
    }
    
    public static void addLearningElement(LearningElement object) throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
         mongoOps.insert(object);
    }
    
    public static void addLearningElement(List<LearningElement> objects) throws UnknownHostException {
         MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
         mongoOps.insert(objects);
    }
    
    public static void deleteLearningElement(LearningElement objects) throws UnknownHostException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        mongoOps.remove(objects);
    
    }
    
    public static List<LearningElement> getAllLearningElementByDateUpload(Date date) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("uploadDate").is(date)), LearningElement.class);
    }
    
     public static LearningElement getSpecificLearningElement(String le) throws UnknownHostException {
       //MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       //mongoOps.find(query(where("rating").is(5)), LearningObject.class);
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        //Query query= new Query();
        //query.addCriteria(where("name").is(lo));
        //mongoOps.findo
        return mongoOps.findOne(query(where("name").is(le)), LearningElement.class);
        //MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        //LearningObject p = null;
        //p = mongoOps.findOne(query(where("name").is(lo)), LearningObject.class);
       // System.out.println("USER DAO: " +p);
        //return p;
    }
      public static List<LearningElement> getAllDownloadableLE() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").is(5)), LearningElement.class);
    }
    public static boolean nameAvailability(String name, String subject) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       mongoOps.find(query(where("rating").is(5)), LearningElement.class);
       Query query= new Query();
       query.addCriteria(where("name").is(name).andOperator(where("subject").is(subject)));
        return DatabaseManager.getMongoOpsInstance("loop").exists(query, LearningElement.class);
    }
    
    public static List<LearningElement> getAllLE() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.findAll(LearningElement.class);
    }
    
    public static List<LearningElement> getAllLEDev(String username) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("uploadedBy").is(username)), LearningElement.class);
    }
    
    public static List<LearningElement> getAllLERev() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("rev").is(""))), LearningElement.class);
    }
    
    public static List<LearningElement> getAllLERevLater(String user) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("status").is(2)).andOperator(where("rev").is(user))), LearningElement.class);
    }
    
    public static void main(String[] args) throws Exception {
        LearningElement le = new LearningElement();
        
        
        le.setName("jjjj");
        le.setSubject("jjjjjjj");
        le.setDateUploaded("September 25, 2015");
        le.setDescription("test lng");
        LearningElementDAO.addLearningElement(le);
        
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
        JOptionPane.showMessageDialog(null,LearningElementDAO.getList());
        //System.out.println(LearningObjectDAO.getMostLikedList());
    }
    
    
}
