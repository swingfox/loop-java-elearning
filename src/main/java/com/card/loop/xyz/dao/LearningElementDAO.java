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
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import javax.swing.JOptionPane;
import org.bson.types.ObjectId;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.data.mongodb.core.query.BasicQuery;
import org.springframework.data.mongodb.core.query.Criteria;
import static org.springframework.data.mongodb.core.query.Criteria.where;
import org.springframework.data.mongodb.core.query.Query;
import static org.springframework.data.mongodb.core.query.Query.query;
import org.springframework.data.mongodb.core.query.Update;
import org.springframework.stereotype.Repository;

/**
 *
 * @author Julie Jane Alegre 
 */
@Repository
public class LearningElementDAO {
    @Autowired MongoOperations mongoOps;
    
    public LearningElement getLE(String id) throws UnknownHostException{ 
        return mongoOps.findOne(query(where("_id").is(id)), LearningElement.class);
    }
    
    public boolean acceptLE(LearningElement le) throws UnknownHostException{
        boolean ok = false;        
        Query query = new Query();
        query.addCriteria(where("_id").is(le.getId()));
        LearningElement obj = this.mongoOps.findOne(query, LearningElement.class);
        obj.setId(le.getId());        
        obj.setStatus(2);
        this.mongoOps.save(obj);
        return ok;
    }
    
    public boolean demoteLE(LearningElement le) throws UnknownHostException{
        boolean ok = false;        
        Query query = new Query();
        query.addCriteria(where("_id").is(le.getId()));
        LearningElement obj = this.mongoOps.findOne(query, LearningElement.class);
        obj.setId(le.getId());
        if(obj.getRev()==null)
            obj.setStatus(0);
        else 
            obj.setStatus(1);
        this.mongoOps.save(obj);
        return ok;
    }
    public List<LearningElement> getList() throws UnknownHostException {
        return mongoOps.findAll(LearningElement.class);
    }
    
    public List<LearningElement> searchLE(String keyword) {
        //return mongoOps.findAll(LearningElement.class);
        //Query query = new Query();
        BasicQuery query = new BasicQuery("{\"title\": {$regex : '/" + keyword + "/'} }");
         //       System.out.println(query+"HAHA");
        query.limit(10);
        //query.addCriteria(where("title").is(keyword).orOperator(where("subject").is(keyword)).orOperator(where("description").is(keyword)));
        //query.addCriteria(Criteria.where("title").regex(keyword));
        System.out.println(query);
        //return mongoOps.find(query(where("title").regex(keyword)), LearningElement.class);
        return mongoOps.find(query(where("status").is(1)), LearningElement.class);
    }
    
    public boolean exists(String id) throws UnknownHostException {
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("_id").is(id));
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
    
    public void addLearningElement(LearningElement object) throws UnknownHostException, IOException {
       this.addFile(object);
    }
    
    public void addLearningElement(List<LearningElement> objects) throws UnknownHostException {
       mongoOps.insert(objects);
    }
    
   /* public void deleteLearningElement(LearningElement objects) throws UnknownHostException{
       mongoOps.remove(objects);
    }*/
    
    public boolean deleteLE(LearningElement le) throws UnknownHostException{
        boolean ok = false;
        try{
            mongoOps.findAndRemove(query(where("_id").is(le.getId())), LearningElement.class);
            ok = true;
        }
        catch (Exception e){
            System.out.println("FAILED TO DELETE " + e);
        }
        return ok;
    }   
    
    public List<LearningElement> getAllLearningElementByDateUpload(Date date) throws UnknownHostException {
       return mongoOps.find(query(where("uploadDate").is(date)), LearningElement.class);
    }
    
    public LearningElement getSpecificLearningElement(String le) throws UnknownHostException {
       return mongoOps.findOne(query(where("_id").is(le)), LearningElement.class);
    }
    public List<LearningElement> getAllDownloadableLE() throws UnknownHostException {
       Query query = new Query();
       query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
       return mongoOps.find(query(where("rating").is(5)), LearningElement.class);
    }
    public boolean nameAvailability(String title, String subject) throws UnknownHostException {
       mongoOps.find(query(where("rating").is(5)), LearningElement.class);
       Query query= new Query();
       query.addCriteria(where("title").is(title).andOperator(where("subject").is(subject)));
       return DatabaseManager.getMongoOpsInstance(AppConfig.DATABASE_LOOP).exists(query, LearningElement.class);
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
 
    public LearningElement getSpecificLearningElementById(String elementID) throws UnknownHostException {
        return mongoOps.findOne(query(where("_id").is(elementID)), LearningElement.class);
    }
    
    
    public boolean addFile(LearningElement le) throws UnknownHostException, IOException{
        File file = new File(AppConfig.USER_VARIABLE + le.getFilePath() + le.getFilename());
        Mongo mongo = new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
        DB db = mongo.getDB(AppConfig.DATABASE_LOOP);

        GridFS gf = new GridFS(db,"le.meta");
        GridFSInputFile gfsFile = gf.createFile(file);
	gfsFile.setFilename(le.getFilename());
        gfsFile.setContentType(le.getContentType());
        gfsFile.put("_class","com.card.loop.xyz.model.LearningElement");
        gfsFile.put("title",le.getTitle());
        gfsFile.put("filePath",le.getFilePath());
        gfsFile.put("subject",le.getSubject());
        gfsFile.put("description", le.getDescription());
        gfsFile.put("downloads",le.getDownloads());
        gfsFile.put("rating",le.getRating());
        gfsFile.put("comments",le.getComments());
        gfsFile.put("uploadedBy",le.getUploadedBy());
        gfsFile.put("status", le.getStatus());
        gfsFile.put("rev", le.getRev());
        gfsFile.put("type", le.getType());
	gfsFile.save();

        // Let's store our document to MongoDB
     /*   System.out.println("SEARCH: " + search(gfsFile.getMD5(), "le.meta"));
        if(search(gfsFile.getMD5(), "le.meta") > 1){            
            deleteLE(le.getFileName(),"le.meta");
        }*/
        //
//	collection.insert(info, WriteConcern.SAFE);
        return true;
    }
    
    public boolean addFile(LearningElement le, File file) throws UnknownHostException, IOException{
        Mongo mongo = new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
        DB db = mongo.getDB(AppConfig.DATABASE_LOOP);

        GridFS gf = new GridFS(db,"le.meta");
        GridFSInputFile gfsFile = gf.createFile(file);
	gfsFile.setFilename(le.getFilename());
        gfsFile.setContentType(le.getContentType());
        gfsFile.put("_class","com.card.loop.xyz.model.LearningElement");
        gfsFile.put("title",le.getTitle());
        gfsFile.put("filePath",le.getFilePath());
        gfsFile.put("subject",le.getSubject());
        gfsFile.put("description", le.getDescription());
        gfsFile.put("downloads",le.getDownloads());
        gfsFile.put("rating",le.getRating());
        gfsFile.put("comments",le.getComments());
        gfsFile.put("uploadedBy",le.getUploadedBy());
        gfsFile.put("status", le.getStatus());
        gfsFile.put("rev", le.getRev());
        gfsFile.put("type", le.getType());
	gfsFile.save();

        // Let's store our document to MongoDB
     /*   System.out.println("SEARCH: " + search(gfsFile.getMD5(), "le.meta"));
        if(search(gfsFile.getMD5(), "le.meta") > 1){            
            deleteLE(le.getFileName(),"le.meta");
        }*/
        //
//	collection.insert(info, WriteConcern.SAFE);
        return true;
    }
    
    /*public void deleteLE(String newFName, String type) throws UnknownHostException {
        Mongo mongo = new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
        DB db = mongo.getDB(AppConfig.DATABASE_LOOP);
        GridFS le_gfs = new GridFS(db, type);
        le_gfs.remove(le_gfs.findOne(newFName));
    }*/
    
    public ArrayList<DBObject> listAll(String collection) throws UnknownHostException {
        ArrayList<DBObject> list = new ArrayList<DBObject>();
        Mongo mongo = new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
        DB db = mongo.getDB(AppConfig.DATABASE_LOOP);
        GridFS le_gfs = new GridFS(db, collection);
        DBCursor cursor = le_gfs.getFileList();
         System.out.println(le_gfs.getFileList()+"");
        while (cursor.hasNext()) {
            list.add(cursor.next());             
        }
        return list;
    }
    
    public GridFSDBFile getSingleLE(String id, String collection) throws UnknownHostException {
        Mongo mongo = new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
        DB db = mongo.getDB(AppConfig.DATABASE_LOOP);
        GridFS le_gfs = new GridFS(db, collection);
       // GridFSDBFile le_output = le_gfs.findOne(new ObjectId(id));
        GridFSDBFile le_output = le_gfs.findOne(new ObjectId(id));
        System.out.println(le_output);
        return le_output;
    }
    
    public ArrayList<String> getKeywords(String md5, String collection) throws UnknownHostException{
        Mongo mongo = new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port);
        DB db = mongo.getDB(AppConfig.DATABASE_LOOP);
        ArrayList<String> list = new ArrayList<>();
        GridFS le_gfs = new GridFS(db, collection);
        GridFSDBFile le_output = le_gfs.findOne(new BasicDBObject("md5", md5));
        ListIterator<Object> trustedList = ((BasicDBList) le_output.get("keywords")).listIterator();

        while(trustedList.hasNext()){
            Object nextItem = trustedList.next();
            list.add(nextItem.toString());
        }        
       return list;
    }
    
    private int search(String md5, String collection) throws UnknownHostException{
        ArrayList<DBObject> list = listAll(collection);
        int count = 0;
         System.out.println(list.size());
        for(int i = 0; i< list.size(); i++){
           if(list.get(i).get("md5").equals(md5)){
                count++;
                if(count == 2) break;
           }
        }
        return count;
    }
    
    public void writePhysicalFile(String md5,String fileName) throws UnknownHostException, IOException{
                    try {
                        File fil = new File(AppConfig.DOWNLOAD_BASE_PATH + fileName);
                
                        if (!fil.getParentFile().exists()){
                             fil.getParentFile().mkdirs();
                        }
                        getSingleLE(md5,"le.meta").writeTo(AppConfig.DOWNLOAD_BASE_PATH + fileName);
                    }
                 catch (Exception e) {
                    System.err.println(e.toString());
                }
           
    }
    
    public boolean assignReviewer(String id, String reviewer) throws UnknownHostException {
        boolean ok = false;
        Update assigner = new Update();
        assigner.set("rev", reviewer);
        mongoOps.findAndModify(query(where("id").is(id)), assigner, LearningElement.class);
        ok = true;
        
        return ok;
    }

    
    public static void main(String[] args) throws IOException, Exception{
        /**
        LearningElementDAO dao = new LearningElementDAO();
        List<LearningElement> le;
        le = dao.searchLE("Test");
        System.out.println(le);
        
<<<<<<< HEAD
        MongoOperations mongoOps = new MongoTemplate(AppConfig.mongod(),AppConfig.DATABASE_LOOP);
        JOptionPane.showMessageDialog(null,mongoOps.find(query(where("name").is("hahah")), LearningElement.class));
        * 
        **/
       /** le.setFileName("TestLEUpload2.zip");
=======
        /** le.setFileName("TestLEUpload2.zip");
>>>>>>> 4b2be59ee4c471ba1bfb4b07c281b254d3671894
        le.setName("TestLEUpload2");
        le.setFilePath("C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LE\\");
        le.setFileExtension(".zip");
        le.setSubject("recon");
        le.setDescription("test");
        le.setDownloads(0);
        le.setRating(5);
        le.setComments("promotion");
        le.setUploadedBy("dev1");
        le.setStatus("1");
        le.setRev("rev1");
        le.setType("LE");
        
        **/
      //  dao.addFile(le);
     //  System.out.println(dao.getSingleLE("676f65e8970d856682dde3a34f2390f9", "le.meta"));
        
     //           System.out.println(dao.getSingleLE("5623d83c456450da612f72d6", "le.meta"));
     //   OutputStream output = new FileOutputStream("c:\\data\\");

       // dao.getSingleLE("676f65e8970d856682dde3a34f2390f9","le.meta").writeTo("C:\\Users\\David\\Desktop\\haha.zip");
       // output.close();
     //   dao.deleteLE("TestLEUpload2.zip", "le.meta");
    }

    public boolean saveLE(LearningElement obj) {     
        this.mongoOps.save(obj);
        return true;
    }
}
