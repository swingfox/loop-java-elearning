/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.config.DatabaseManager;
import com.card.loop.xyz.dto.LearningObjectDto;
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
 */
public class LearningObjectDAO {
    public static List<LearningObject> getList() throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findAll(LearningObject.class);
    }
    
    public static List<LearningObject> getReviewerLOList(String rev) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.find(query(where("uploadedBy").is(rev)), LearningObject.class);        
    }
    /*
    * Get details of specific learning object
    */
    public static LearningObject getLearningObject(String id) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findOne(query(where("_id").is(id)), LearningObject.class);
    }
    
     public static LearningObject getLearningObjectByName(String name) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findOne(query(where("name").is(name)), LearningObject.class);
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
    
    public static List<LearningObject> getOldLO(String name) throws UnknownHostException {
       MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return (mongoOps.find(query(where("status").is(0)), LearningObject.class));
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
    
    public static boolean deleteLO(LearningObjectDto lo) throws UnknownHostException{
        MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("name").is(lo.getName()));
        ok = mongoOps.exists(query, LearningObject.class);
        if(ok)
            mongoOps.remove(lo);
        return ok;
    }   
    
    public static void updateLO(LearningObjectDto lo) throws UnknownHostException{
        MongoOperations mongoOps = DatabaseManager.getMongoOpsInstance("loop");
        Query query = new Query();
        query.addCriteria(where("_id").is(lo.getId()));
        LearningObject obj = mongoOps.findOne(query, LearningObject.class);
        obj.setId(lo.getId());
        obj.setDateUploaded(lo.getDateUploaded());
        obj.setDownloads(lo.getDownloads());
        obj.setStatus(lo.getStatus());
        obj.setSubject(lo.getSubject());
        obj.setDescription(lo.getDescription());
        obj.setUploadedBy(lo.getUploadedBy());
        obj.setRating(lo.getRating());
        obj.setFilepath(lo.getFilepath());
        obj.setComments(lo.getComments());
        mongoOps.save(obj);
    }   
    
    public static boolean exists(String id) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port), "loop");
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        
        ok = mongoOps.exists(query, LearningObject.class);
        return ok;
    }
    
    public static void main(String[] args) throws Exception {
        LearningObjectDto lo = new LearningObjectDto();
        
        
       // lo.setId("55e3c12a9016761fa486fbd1");
        lo.setName("testing3");
        lo.setRating(1);
      //  System.out.println(LearningObjectDAO.deleteLO(lo));
       // LearningObjectDAO.addLearningObject(lo);
        System.out.println(lo.getName());
        JOptionPane.showMessageDialog(null,LearningObjectDAO.getAllDownloadableLO());
        
    }
    
    public static LearningObject getSpecificLearningObjectById(String elementID) throws UnknownHostException {
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        return mongoOps.findOne(query(where("_id").is(elementID)), LearningObject.class);
    }
    
    
}
