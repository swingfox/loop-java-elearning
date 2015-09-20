/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;
/* Author: Jomelyn Aldave
 * Date: Sept, 2014
 * Description: this class contains the functions that interacts with the database  
 * 				which is implemented using MongoDB (CRUD functionalities)
 * */
import com.card.loop.xyz.model.LearningElement;
import com.mongodb.BasicDBList;
import com.mongodb.BasicDBObject;
import com.mongodb.DB;
import com.mongodb.DBCollection;
import com.mongodb.DBCursor;
import com.mongodb.DBObject;
import com.mongodb.Mongo;
import com.mongodb.MongoClient;
import com.mongodb.gridfs.GridFS;
import com.mongodb.gridfs.GridFSDBFile;
import com.mongodb.gridfs.GridFSInputFile;

import java.io.File;
import java.io.IOException;

import static java.lang.System.out;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.ListIterator;
import java.util.logging.Level;
import java.util.logging.Logger;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Jomelyn
 */
public class LEDatabaseController {
    private MongoClient mongo;
    private DB db;
    private DBCollection collection;
    
    public LEDatabaseController(){
        try {
            mongo = new MongoClient("localhost", 27017);
            db = mongo.getDB("LEI_DB");
            collection = db.getCollection("learning_elements");
        } catch (UnknownHostException ex) {
            Logger.getLogger(LEDatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        } 
    }
    
    public void createLE(String name, String subject,  String description, int downloads,  
                           String dateUploaded, String filePath, double rating, 
                           String comments, String status, String rev, String uploadedBy){
        LearningElement le = new LearningElement(name, subject, description, downloads, dateUploaded, filePath, rating, comments, status, rev, uploadedBy);
        try {
            addLE(le);
        } catch (IOException ex) {
            Logger.getLogger(LEDatabaseController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    public void addLE(LearningElement le) throws IOException {
        File le_file = new File(le.getFilePath());
        GridFS le_gfs = new GridFS(db, "zip");
        GridFSInputFile gfsFile = le_gfs.createFile(le_file);
        gfsFile.setFilename(le.getName());        
        gfsFile.put("comment", le.getComments());
        gfsFile.put("dateUploaded", le.getDateUploaded());
        gfsFile.put("description", le.getDescription());
        gfsFile.put("downloads", le.getDownloads());
        gfsFile.put("filePath", le.getFilePath());
        gfsFile.put("name", le.getName());
        gfsFile.put("rating", le.getRating());
        gfsFile.put("rev", le.getRev());
        gfsFile.put("status", le.getStatus());
        gfsFile.put("subject", le.getSubject());
        gfsFile.put("uploadedBy", le.getUploadedBy());
        gfsFile.save();
        if(search(gfsFile.getMD5(), "zip") > 1){            
            deleteLE(le.getName(),"zip");
        }
    }    
    
    //for testing purposes
    public void addLE(String fn, String nf, String type) throws IOException {
        File le_file = new File(fn);
        GridFS le_gfs = new GridFS(db, type);
        GridFSInputFile gfsFile = le_gfs.createFile(le_file);
        gfsFile.setFilename(nf);
        gfsFile.save();    
        if(search(gfsFile.getMD5(), type) > 1){            
            deleteLE(nf,type);
        }
    } 
    
    private int search(String md5, String type){
        ArrayList<DBObject> list = listAll(type);
        int count = 0;
        for(int i = 0; i< list.size(); i++){
           if(list.get(i).get("md5").equals(md5)){
                count++;
                if(count == 2) break;
           }
        }
        return count;
    }
    public GridFSDBFile getSingleLE(String md5, String type) {
        GridFS le_gfs = new GridFS(db, type);
        GridFSDBFile le_output = le_gfs.findOne(new BasicDBObject("md5", md5));
        //System.out.println(le_output);
        return le_output;
    }
    
    public ArrayList<String> getKeywords(String md5, String type){
        ArrayList<String> list = new ArrayList<>();
        GridFS le_gfs = new GridFS(db, type);
        GridFSDBFile le_output = le_gfs.findOne(new BasicDBObject("md5", md5));
        ListIterator<Object> trustedList = ((BasicDBList) le_output.get("keywords")).listIterator();

        while(trustedList.hasNext()){
            Object nextItem = trustedList.next();
            list.add(nextItem.toString());
        }        
       return list;
    }
    
    public ArrayList<DBObject> listAll(String type) {
        ArrayList<DBObject> list = new ArrayList<DBObject>();
        //int i = 0;
        
        GridFS le_gfs = new GridFS(db, type);
        DBCursor cursor = le_gfs.getFileList();
        while (cursor.hasNext()) {
            list.add(cursor.next());  
            //System.out.println(list.get(i).toString());
            //i++;            
        }
        return list;
    }
    
    public void deleteLE(String newFName, String type) {
        GridFS le_gfs = new GridFS(db, type);
        le_gfs.remove(le_gfs.findOne(newFName));
    }
    
    public void getAllImages(){
        ArrayList<DBObject> list = listAll("photo");
        out.println("<html>");
        out.println("<head>");
        out.println("<title>LEI's Audio</title>");
        out.println("</head>");
        out.println("<body>");
        out.println("<table border=\"1\">");
        out.println("<tr>");
        for (int i = 0; i < list.size(); i++) {
            out.println("<td>" + list.get(i).toString() + "</td>");

            if (i>0 && i%4==0) {
                out.println("</tr><tr>");

            }

        }
        out.println("</tr>");
        out.println("</table>");
        out.println("</body>");
        out.println("</html>"); 
    }
    
}
