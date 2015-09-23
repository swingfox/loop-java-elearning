/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.User;
import com.mongodb.Mongo;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
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
}
