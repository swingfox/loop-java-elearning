/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.file.meta.LearningObjectMeta;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
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
import java.util.ListIterator;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.MongoTemplate;
import org.springframework.stereotype.Repository;

/**
 *
 * @author David
 */
@Repository
public class LearningObjectMetaDAO {
     public boolean addFile(LearningObjectMeta lo) throws UnknownHostException, IOException{
        File file = new File(lo.getFilePath() + lo.getFileName());
        Mongo mongo = new Mongo("localhost", 27017);
        DB db = mongo.getDB("loopFilesStorage");

        GridFS gf = new GridFS(db,"lo.meta");
        GridFSInputFile gfsFile = gf.createFile(file);
	gfsFile.setFilename(lo.getFileName());
        gfsFile.setContentType(lo.getFileType());
        gfsFile.put("title",lo.getTitle());
        gfsFile.put("filePath",lo.getFilePath());
	gfsFile.save();

        // Let's store our document to MongoDB
        
        if(search(gfsFile.getMD5(), "lo.meta") > 1){            
            deleteLO(lo.getTitle(),"lo.meta");
        }
        //
//	collection.insert(info, WriteConcern.SAFE);
        return true;
    }
    
    public void deleteLO(String newFName, String type) throws UnknownHostException {
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
    
    public GridFSDBFile getSingleLO(String md5, String collection) throws UnknownHostException {
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
         getSingleLO(md5,"lo.meta").writeTo("C:\\Users\\David\\Desktop\\" + fileName);
    }
    
    public static void main(String[] args) throws IOException{
        LearningObjectMetaDAO dao = new LearningObjectMetaDAO();
        LearningObjectMeta lo = new LearningObjectMeta();
        lo.setFileName("hahah.json");
        lo.setTitle("test");
        lo.setFilePath("C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LO\\");
        lo.setFileType(".json");
        
        dao.addFile(lo);
      //  System.out.println(dao.search("676f65e8970d856682dde3a34f2390f9","lo.meta"));
     //   OutputStream output = new FileOutputStream("c:\\data\\");

       // dao.getSingleLE("676f65e8970d856682dde3a34f2390f9","lo.meta").writeTo("C:\\Users\\David\\Desktop\\haha.zip");
       // output.close();
     //   dao.deleteLE("TestLEUpload2.zip", "lo.meta");
    }
}
