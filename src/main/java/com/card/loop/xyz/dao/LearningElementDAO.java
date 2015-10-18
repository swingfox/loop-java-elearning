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
 * @author Julie Jane Alegre 
 */
@Repository
public class LearningElementDAO {
    @Autowired MongoOperations mongoOps;

    public List<LearningElement> getList() throws UnknownHostException {
        return mongoOps.findAll(LearningElement.class);
    }
    
    public boolean exists(String id) throws UnknownHostException {
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("id").is(id));
        ok = mongoOps.exists(query, LearningElement.class);
        return ok;
    }
 
    public boolean updateList(LearningElement object) throws UnknownHostException {
        boolean ok = false;
        try {
            mongoOps.insert(object);
            ok = true;       
        } 
        catch (NullPointerException e) {
            e.printStackTrace();
        }
        return ok;
    }
    
    public void addLearningElement(LearningElement object) throws UnknownHostException {
       mongoOps.insert(object);
    }
    
    public void addLearningElement(List<LearningElement> objects) throws UnknownHostException {
       mongoOps.insert(objects);
    }
    
    public void deleteLearningElement(LearningElement objects) throws UnknownHostException{
       mongoOps.remove(objects);
    }
    
    public List<LearningElement> getAllLearningElementByDateUpload(Date date) throws UnknownHostException {
       return mongoOps.find(query(where("uploadDate").is(date)), LearningElement.class);
    }
    
    public LearningElement getSpecificLearningElement(String le) throws UnknownHostException {
       return mongoOps.findOne(query(where("id").is(le)), LearningElement.class);
    }
    public List<LearningElement> getAllDownloadableLE() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").is(5)), LearningElement.class);
    }
    public boolean nameAvailability(String name, String subject) throws UnknownHostException {
       mongoOps.find(query(where("rating").is(5)), LearningElement.class);
       Query query= new Query();
       query.addCriteria(where("name").is(name).andOperator(where("subject").is(subject)));
       return DatabaseManager.getMongoOpsInstance("loop").exists(query, LearningElement.class);
    }
    
    public List<LearningElement> getAllLE() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.findAll(LearningElement.class);
    }
    
    public List<LearningElement> getAllLEDev(String username) throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("uploadedBy").is(username)), LearningElement.class);
    }
    
    public List<LearningElement> getAllLERev() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").lt(4).andOperator(where("rating").gt(0)).andOperator(where("rev").is(""))), LearningElement.class);
    }
    
    public List<LearningElement> getAllLERevLater(String user) throws UnknownHostException {
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
       // LearningElementDAO.addLearningElement(le);
        
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
     //   JOptionPane.showMessageDialog(null,LearningElementDAO.getList());
        //System.out.println(LearningObjectDAO.getMostLikedList());
    }

    public LearningElement getSpecificLearningElementById(String elementID) throws UnknownHostException {
        return mongoOps.findOne(query(where("_id").is(elementID)), LearningElement.class);
    }
}
