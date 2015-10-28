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
    
    public void addLearningObject(LearningObject object) throws UnknownHostException, IOException {
       // mongoOps.insert(object);
        this.addFile(object);
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
        boolean ok = false;
        Query query = new Query();
        query.addCriteria(where("name").is(lo.getTitle()));
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
        obj.setUploadDate(lo.getUploadDate());
        obj.setDownloads(lo.getDownloads());
        obj.setStatus(lo.getStatus());
        obj.setSubject(lo.getSubject());
        obj.setDescription(lo.getDescription());
        obj.setUploadedBy(lo.getUploadedBy());
        obj.setRating(lo.getRating());
        obj.setFilePath(lo.getFilePath());
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
    
    public boolean addFile(LearningObject lo) throws UnknownHostException, IOException{
        System.out.println(lo.getFilePath() + lo.getFileName());
        File file = new File(lo.getFilePath() + lo.getFileName());
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loop");

        GridFS gf = new GridFS(db,"lo.meta");
        GridFSInputFile gfsFile = gf.createFile(file);
	gfsFile.setFilename(lo.getFileName());
        gfsFile.setContentType(lo.getFileType());
        gfsFile.put("_class","com.card.loop.xyz.model.LearningObject");
        gfsFile.put("name",lo.getTitle());
        gfsFile.put("filePath",lo.getFilePath());
        gfsFile.put("subject",lo.getSubject());
        gfsFile.put("description", lo.getDescription());
        gfsFile.put("downloads",lo.getDownloads());
        gfsFile.put("rating",lo.getRating());
        gfsFile.put("comments",lo.getComments());
        gfsFile.put("uploadedBy",lo.getUploadedBy());
        gfsFile.put("status", lo.getStatus());
        gfsFile.put("rev", lo.getRev());
        gfsFile.put("type", lo.getType());
        gfsFile.put("sequence", lo.getSequence());
	gfsFile.save();
        System.out.println(gfsFile.getMD5());
        // Let's store our document to MongoDB
        
        if(search(gfsFile.getMD5(), "lo.meta") > 1){            
            deleteLO(lo.getFileName(),"lo.meta");
        }

        return true;
    }
    
    public void deleteLO(String newFName, String type) throws UnknownHostException {
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loop");
        GridFS le_gfs = new GridFS(db, type);
        le_gfs.remove(le_gfs.findOne(newFName));
    }
    
    public ArrayList<DBObject> listAll(String collection) throws UnknownHostException {
        ArrayList<DBObject> list = new ArrayList<DBObject>();
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loop");
        GridFS le_gfs = new GridFS(db, collection);
        DBCursor cursor = le_gfs.getFileList();
         System.out.println(le_gfs.getFileList()+"");
        while (cursor.hasNext()) {
            list.add(cursor.next());             
        }
        return list;
    }
    
    public GridFSDBFile getSingleLO(String id, String collection) throws UnknownHostException {
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loop");
        GridFS le_gfs = new GridFS(db, collection);
        GridFSDBFile le_output = le_gfs.findOne(new ObjectId(id));
        return le_output;
    }
    
    public GridFSDBFile getSingleLOByName(String name, String collection) throws UnknownHostException {
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loop");
        GridFS le_gfs = new GridFS(db, collection);
        GridFSDBFile le_output = le_gfs.findOne(new BasicDBObject(name,collection));
        return le_output;
    }
    
    public ArrayList<String> getKeywords(String md5, String collection) throws UnknownHostException{
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loop");
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
                
                getSingleLO(md5,"lo.meta").writeTo(AppConfig.DOWNLOAD_BASE_PATH + fileName);
        }
        
        catch (Exception e) {
                System.err.println(e.toString());
        }
    }
    
    public static void main(String[] args) throws IOException{
        LearningObjectDAO dao = new LearningObjectDAO();
        LearningObject lo = new LearningObject();
        ArrayList<DBObject> db = dao.listAll("lo.meta");
        for(DBObject o: db)
        {
            try{
           GridFSDBFile grid = dao.getSingleLOByName((String)o.get("filename"), "lo.meta");
           System.out.println(grid);
            }
            catch(Exception e){e.printStackTrace();}
         //  System.out.println(grid.toString());
        }
        System.out.println();

       /* System.out.println(lo);
        lo.setFileName("testing8.json");
        lo.setName("testhahah");
        lo.setFilePath("C:\\Users\\David\\Desktop\\");
        lo.setFileType(".json");
        lo.setSubject("spring");
        lo.setDescription("ok");
        lo.setDownloads(0);
        lo.setRating(5);
        lo.setComments("promotion");
        lo.setUploadedBy("dev1");
        lo.setStatus("1");
        lo.setRev("rev1");
        lo.setType("LO");*/
    //    lo.setSequence(null);
//        dao.addLearningObject(lo);
   //     dao.addFile(lo);
      //  System.out.println(dao.search("676f65e8970d856682dde3a34f2390f9","lo.meta"));
     //   OutputStream output = new FileOutputStream("c:\\data\\");

       // dao.getSingleLE("676f65e8970d856682dde3a34f2390f9","lo.meta").writeTo("C:\\Users\\David\\Desktop\\haha.zip");
       // output.close();
     //   dao.deleteLE("TestLEUpload2.zip", "lo.meta");
    }
}
