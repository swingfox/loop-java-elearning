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
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.stereotype.Repository;

/**
 *
 * @author David
 * 
 */
@Repository
public class LearningObjectDAO {
    @Autowired MongoOperations mongoOps;

    public List<LearningObject> getList() throws UnknownHostException {
        return mongoOps.findAll(LearningObject.class);
    }
    
    public List<LearningObject> getReviewerLOList(String rev) throws UnknownHostException {
        return mongoOps.find(query(where("uploadedBy").is(rev)), LearningObject.class);        
    }
    /*
    * Get details of specific learning object
    */
    public LearningObject getLearningObject(String id) throws UnknownHostException {
        return mongoOps.findOne(query(where("_id").is(id)), LearningObject.class);
    }
    
    public LearningObject getLearningObjectByName(String name) throws UnknownHostException {
        return mongoOps.findOne(query(where("name").is(name)), LearningObject.class);
    }
    
    public void addLearningObject(LearningObject object) throws UnknownHostException {
        mongoOps.insert(object);
    }
    
    public List<LearningObject> getAllDownloadableLO() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return (mongoOps.find(query(where("rating").is(5)), LearningObject.class));
    }
    
    public List<LearningObject> getOldLO(String name) throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return (mongoOps.find(query(where("status").is(0)), LearningObject.class));
    }
    
    public boolean nameAvailability(String name, String subject) throws UnknownHostException {
       mongoOps.find(query(where("rating").is(5)), LearningObject.class);
       Query query= new Query();
       query.addCriteria(where("name").is(name).andOperator(where("subject").is(subject)));
       return DatabaseManager.getMongoOpsInstance("loop").exists(query, LearningObject.class);
    }
    
    public List<LearningObject> getAllLO() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.findAll(LearningObject.class);
    }
    
    public List<LearningObject> getAllLODev(String username) throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("uploadedBy").is(username)), LearningObject.class);
    }
    
    public List<LearningObject> getAllLORev() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("rev").is(""))), LearningObject.class);
    }
    
    public List<LearningObject> getAllLORevLater(String user) throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("status").is(2)).andOperator(where("rev").is(user))), LearningObject.class);
    }
    
    public boolean deleteLO(LearningObjectDto lo) throws UnknownHostException{
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("name").is(lo.getName()));
        ok = mongoOps.exists(query, LearningObject.class);
        if(ok)
            mongoOps.remove(lo);
        return ok;
    }   
    
    public void updateLO(LearningObjectDto lo) throws UnknownHostException{
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
    
    public boolean exists(String id) throws UnknownHostException {
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
     //   JOptionPane.showMessageDialog(null,LearningObjectDAO.getAllDownloadableLO());
        
    }
    public LearningObject getSpecificLearningObjectById(String elementID) throws UnknownHostException {
        return mongoOps.findOne(query(where("_id").is(elementID)), LearningObject.class);
    }
}
