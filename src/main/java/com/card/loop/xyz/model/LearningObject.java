/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.model;

import java.util.List;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/* 
 * @author Vine Deiparine
 */

@Document(collection = "lo.meta.files")
public class LearningObject {
    /*
    *ObjectId of the Learning Object in mongoDB
    */    
    @Id
    private String id;  
    /*
    *Name of the Learning Object
    */
    private String title;
    /*
    *Subject of the Learning Object. e.g. (Math, English)
    */
    private String subject;
    /*
    *Description of the Learning Object.
    */
    private String description;
    /*
    *Number of downloads of the Learning Object.
    */
    private int downloads;
    /*
    *Date of the Learning Object is uploaded.
    */
    private String uploadDate;
    /*
    *Filepath of the Learning Object.
    */
    private String filePath;
    /*
    *Rating of the Learning Object.
    */
    private int rating;
    /*
    *Comments for the Learning Object.
    */
    private String comments;
    /*
    *Status of the Learning Object.
    *Can be one of the following: Reviewed, Being Reviewed, Not Yet Reviewed
    */
    private int status;
    /*
    *Name of the reviewer of the Learning Object.
    */
    private String rev;
    /*
    *Name of the uploader of the Learning Object.
    */
    private String uploadedBy;
    private String filename;
    private String contentType;
    private String type;
    private double price;

    private List<LearningElement[]> sequence;
    

    /**
     * Gets the title of the uploader of the Learning Object
     * @return String This returns the title of uploader.
     */
    public String getUploadedBy(){
        return this.uploadedBy;
    }
    
    /**
     * Gets the Id of the Learning Object in mongoDB
     * @return String This returns the id of Learning Object in mongoDB.
     */
    public String getId(){
        return this.id;
    }

    /**
     * Gets the status of the Learning Object
     * @return String This returns the status of Learning Object.
     */
    public int getStatus(){
        return this.status;
    }

    /**
     * Gets the title of the Learning Object.
     * @return String This returns the title of Learning Object.
     */
    public String getTitle(){
        return this.title;
    }

    /**
     * Gets the subject of the Learning Object.
     * @return String This returns the subject of Learning Object.
     */
    public String getSubject(){
        return this.subject;
    }

    /**
     * Gets the description of the Learning Object.
     * @return String This returns the description of Learning Object.
     */
    public String getDescription(){
        return this.description;
    }

    /**
     * Gets the number of downloads of the Learning Object.
     * @return int This returns the number of downloads of Learning Object.
     */
    public int getDownloads(){
        return this.downloads;
    }

    /**
     * Gets the uploaded date of the Learning Object.
     * @return String This returns the uploaded date of Learning Object.
     */
    public String getDateUpload(){
        return this.uploadDate;
    }

    /**
     * Gets the filePath of the Learning Object.
     * @return String This returns the filePath of Learning Object.
     */
    public String getFilePath(){
        return this.filePath;
    }

    /**
     * Gets the rating of the Learning Object.
     * @return double This returns the rating of Learning Object.
     */
    public int getRating(){
        return this.rating;
    }

    /**
     * Gets the comments of the Learning Object.
     * @return String This returns the comments of Learning Object.
     */
    public String getComments(){
        return this.comments;
    }

    /**
     * Gets the title of the reviewer of the Learning Object.
     * @return String This returns the reviewer of Learning Object.
     */
    public String getRev(){
        return this.rev;
    }
    
    /**
     * Sets the title of the reviewer of the Learning Object
     * @param rev String
     */
    public void setRev(String rev){
        this.rev = rev;
    }

    /**
     * Sets the id of the Learning Object in mongoDB
     * @param id String
     */
    public void setId(String id){
        this.id = id;
    }
    
    /**
     * Sets the status of the Learning Object to Reviewed, Being Reviewed, or
     * Not Yet Reviewed
     * @param status String
     */
    public void setStatus(int status){
        this.status = status;
    }

    /**
     * Sets the title of the Learning Object
     * @param title String
     */
    public void setTitle(String title){
        this.title = title;
    }

    /**
     * Sets the subject of the Learning Object
     * @param subject String
     */
    public void setSubject(String subject){
        this.subject= subject;
    }

    /**
     * Sets the description of the Learning Object
     * @param description String
     */
    public void setDescription(String description){
        this.description= description;
    }

    /**
     * Sets the number of downloads of the Learning Object
     * @param downloads int
     */
    public void setDownloads(int downloads){
        this.downloads =downloads;
    }

    /**
     * Sets the date that the Learning Object is uploaded
     * @param dateUploaded String
     */
    public void setDateUpload(String dateUploaded){
        this.uploadDate = dateUploaded;
    }

    /**
     * Sets the filePath of the Learning Object
     * @param filepath String
     */
    public void setFilePath(String filepath){
        this.filePath= filepath;
    }

    /**
     * Sets the rating of the Learning Object
     * @param rating String
     */
    public void setRating(int rating){
        this.rating = rating;
    }

    /**
     * Sets the comments of the Learning Object
     * @param comments String
     */
    public void setComments(String comments){
        this.comments = comments;
    }

    /**
     * Sets the title of the uploader of the Learning Object
     * @param uploadedBy String
     */
    public void setUploadedBy(String uploadedBy){
        this.uploadedBy = uploadedBy;
    }

    public List<LearningElement[]> getSequence() {
        return sequence;
    }

    public void setSequence(List<LearningElement[]> sequence) {
        this.sequence = sequence;
    }

    public String getFileName() {
        return filename;
    }

    public void setFileName(String fileName) {
        this.filename = fileName;
    }

    public String getFileType() {
        return contentType;
    }

    public void setFileType(String fileType) {
        this.contentType = fileType;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getUploadDate() {
        return uploadDate;
    }

    public void setUploadDate(String uploadDate) {
        this.uploadDate = uploadDate;
    }

    public double getPrice() {
        return price;
    }

    public void setPrice(double price) {
        this.price = price;
    }
    
}
