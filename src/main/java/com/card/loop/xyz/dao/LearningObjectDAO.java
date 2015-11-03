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
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import java.io.File;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.ListIterator;
import javax.swing.JOptionPane;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

/**
 *
 * @author David
 * 
 */
@Repository
public class LearningObjectDAO {
    @Autowired MongoOperations mongoOps;
    
    public LearningObject getLO(String id) throws UnknownHostException{ 
        LearningObject p = null;
        p = mongoOps.findOne(query(where("_id").is(id)), LearningObject.class);
        return p;
    }
    
    public boolean saveLO(LearningObject lo){      
        this.mongoOps.save(lo);
        return true;
    }
    
    public boolean acceptLO(LearningObject lo) throws UnknownHostException{
        boolean ok = false;        
        Query query = new Query();
        query.addCriteria(where("_id").is(lo.getId()));
        LearningObject obj = this.mongoOps.findOne(query, LearningObject.class);
        obj.setId(lo.getId());        
        obj.setStatus(1);
        this.mongoOps.save(obj);
        return ok;
    }
    
    public boolean demoteLO(LearningObject lo) throws UnknownHostException{
        boolean ok = false;        
        Query query = new Query();
        query.addCriteria(where("_id").is(lo.getId()));
        LearningObject obj = this.mongoOps.findOne(query, LearningObject.class);
        obj.setId(lo.getId()); 
            obj.setStatus(0);
       
        this.mongoOps.save(obj);
        return ok;
    }
    
     public boolean assignReviewer(String id, String reviewer) throws UnknownHostException {
        boolean ok = false;
        Update assigner = new Update();
        assigner.set("rev", reviewer);
        mongoOps.findAndModify(query(where("id").is(id)), assigner, LearningObject.class);
        ok = true;
        
        return ok;
    }
    
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
    
    
    public List<LearningObject> getAllDownloadableLO() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return (mongoOps.find(query(where("status").is(1)), LearningObject.class));
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
        Query query = new Query();
        query.addCriteria(where("name").is(lo.getTitle()));
        boolean ok = mongoOps.exists(query, LearningObject.class);

        if(ok)
            mongoOps.remove(lo);
        return ok;
    }   
    
    public void updateLO(LearningObjectDto lo) throws UnknownHostException{
        Query query = new Query();
        query.addCriteria(where("_id").is(lo.getId()));
        LearningObject obj = mongoOps.findOne(query, LearningObject.class);
        obj.setId(lo.getId());
        obj.setUploadDate(lo.getUploadDate());
        obj.setDownloads(lo.getDownloads());
        obj.setStatus(lo.getStatus());
        obj.setSubject(lo.getSubject());
        obj.setDescription(lo.getDescription());
        obj.setUploadedBy(lo.getUploadedBy());
        obj.setRating(lo.getRating());
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
    
    public LearningObject getSpecificLearningObjectById(String elementID) throws UnknownHostException {
        return mongoOps.findOne(query(where("_id").is(elementID)), LearningObject.class);
    }
    
   
    public void writePhysicalFile(String md5,String fileName) throws UnknownHostException, IOException{
        try {
                File fil = new File(AppConfig.DOWNLOAD_BASE_PATH + fileName);
                
                if (!fil.getParentFile().exists()){
                    fil.getParentFile().mkdirs();
                }
                
             //   getSingleLO(md5,"lo.meta").writeTo(AppConfig.DOWNLOAD_BASE_PATH + fileName);
        }
        
        catch (Exception e) {
                System.err.println(e.toString());
        }
    }
    
    public static void main(String[] args) throws IOException{
      
    }
}
