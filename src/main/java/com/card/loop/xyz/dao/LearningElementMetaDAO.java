/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.file.meta.LearningElementMeta;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.WriteConcern;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.ListIterator;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author David
 */
@Repository
public class LearningElementMetaDAO{

    public boolean addFile(LearningElementMeta le) throws UnknownHostException, IOException{
        MongoOperations mongoOps = new MongoTemplate(new Mongo(AppConfig.mongodb_host, AppConfig.mongodb_port),"loop");
        File file = new File(le.getFilePath() + le.getFileName());
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loopFilesStorage");

        GridFS gf = new GridFS(db,"le.meta");
        GridFSInputFile gfsFile = gf.createFile(file);
	gfsFile.setFilename(le.getFileName());
        gfsFile.setContentType(le.getFileType());
        gfsFile.put("title",le.getTitle());
        gfsFile.put("filePath",le.getFilePath());
	gfsFile.save();

        // Let's store our document to MongoDB
        
        if(search(gfsFile.getMD5(), "le.meta") > 1){            
            deleteLE(le.getTitle(),"le.meta");
        }
        //
//	collection.insert(info, WriteConcern.SAFE);
        return true;
    }
    
    public void deleteLE(String newFName, String type) throws UnknownHostException {
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loopFilesStorage");
        GridFS le_gfs = new GridFS(db, type);
        le_gfs.remove(le_gfs.findOne(newFName));
    }
    
    public ArrayList<DBObject> listAll(String collection) throws UnknownHostException {
        ArrayList<DBObject> list = new ArrayList<DBObject>();
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loopFilesStorage");
        GridFS le_gfs = new GridFS(db, collection);
        DBCursor cursor = le_gfs.getFileList();
         System.out.println(le_gfs.getFileList()+"");
        while (cursor.hasNext()) {
            list.add(cursor.next());             
        }
        return list;
    }
    
    public GridFSDBFile getSingleLE(String md5, String collection) throws UnknownHostException {
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loopFilesStorage");
        GridFS le_gfs = new GridFS(db, collection);
        GridFSDBFile le_output = le_gfs.findOne(new BasicDBObject("md5", md5));
        return le_output;
    }
    
    public ArrayList<String> getKeywords(String md5, String collection) throws UnknownHostException{
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loopFilesStorage");
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
         getSingleLE(md5,"le.meta").writeTo("C:\\Users\\David\\Desktop\\" + fileName);
    }
    
    public static void main(String[] args) throws IOException{
        LearningElementMetaDAO dao = new LearningElementMetaDAO();
        LearningElementMeta le = new LearningElementMeta();
        le.setFileName("TestLEUpload2.zip");
        le.setTitle("test");
        le.setFilePath("C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LE\\");
        le.setFileType(".zip");
        
        dao.addFile(le);
        System.out.println(dao.search("676f65e8970d856682dde3a34f2390f9","le.meta"));
     //   OutputStream output = new FileOutputStream("c:\\data\\");

       // dao.getSingleLE("676f65e8970d856682dde3a34f2390f9","le.meta").writeTo("C:\\Users\\David\\Desktop\\haha.zip");
       // output.close();
     //   dao.deleteLE("TestLEUpload2.zip", "le.meta");
    }
}
