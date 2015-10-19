/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.file.meta;

import com.mongodb.BasicDBObject;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author David
 */

@Document(collection = "le.meta.files")
public class LearningElementMeta{
    /*
    *id of learning element
    */
    @Id
    private String id;
    /*
    *name of learning element
    */
    private String name;
    /*
    *subject of learning element
    */
    private String subject;
    /*
    *description of learning element
    */
    private String description;
    /*
    *number of downloads of learning element
    */
    private int downloads;
    /*
    *dateUploaded of learning element
    */
    private String dateUploaded;
    /*
    *filepath of learning element
    */
    private String filepath;
    /*
    *rating of learning element
    */
    private double rating;
    /*
    *comments of learning element
    */
    private String comments;
    /*
    *status of learning element
    */
    private String status;
    /*
    *reviewer of learning element
    */
    private String rev;
    /*
    *uploaded the learning element
    */
    private String uploadedBy;
    /*
    *Type of the Learning Object.
    *Example: music, video, text, etc.
    */
    private String fileType;
    
    private String fileExtension;
    private String fileName;

    public String getId() {
        return id;
    }

    public void setId(String id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSubject() {
        return subject;
    }

    public void setSubject(String subject) {
        this.subject = subject;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public int getDownloads() {
        return downloads;
    }

    public void setDownloads(int downloads) {
        this.downloads = downloads;
    }

    public String getDateUploaded() {
        return dateUploaded;
    }

    public void setDateUploaded(String dateUploaded) {
        this.dateUploaded = dateUploaded;
    }

    public String getFilepath() {
        return filepath;
    }

    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    public double getRating() {
        return rating;
    }

    public void setRating(double rating) {
        this.rating = rating;
    }

    public String getComments() {
        return comments;
    }

    public void setComments(String comments) {
        this.comments = comments;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status;
    }

    public String getRev() {
        return rev;
    }

    public void setRev(String rev) {
        this.rev = rev;
    }

    public String getUploadedBy() {
        return uploadedBy;
    }

    public void setUploadedBy(String uploadedBy) {
        this.uploadedBy = uploadedBy;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }

    public String getFileExtension() {
        return fileExtension;
    }

    public void setFileExtension(String fileExtension) {
        this.fileExtension = fileExtension;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

}
