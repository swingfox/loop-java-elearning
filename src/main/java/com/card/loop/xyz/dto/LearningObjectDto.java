/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.o
 */
package com.card.loop.xyz.dto;

import com.card.loop.xyz.model.LearningElement;

import java.util.Date;
import java.util.List;

/**
 * REVISION HISTORY
 * <p>
 * [2015/09/09]     -   Vine Deiparine  -   Initial Codes
 */
public class LearningObjectDto {

    /*
     *number of downloads of the Learning Object
     */
    private int downloads;
    /*
     *Rating of the Learning Object
     */
    private int rating;
    /*
     * Id of the Learning Object   in mongoDB
     */
    private String id;

    /*
     *Name of the Learning Object
     */
    private String title;
    /*
     *Subject of the Learning Object
     */
    private String subject;
    /*
     *Description of the Learning Object
     */
    private String description;
    /*
     *Date that the Learning Object is uploaded
     */
    private Date uploadDate;

    /*
     *Comments of the Learning Object
     */
    private String comments;
    /*
     *Status of the Learning Object
     */
    private int status;
    /*
     *Name of the reviewer of the Learning Object
     */


    private String rev;
    /*
     *Name of the uploader of the Learning Object
     */
    private String uploadedBy;
    /*
     *List of errors
     */
    private List<String> errorList;
    private List<LearningElement[]> sequence;


    private String filename;
    private String contentType;
    private String type;
    private int price;
    private String objective;
    private String fileExtension;

    public String getObjective() {
        return objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }

    /**
     * @return int Number of downloads of the LO
     */
    public int getDownloads() {
        return downloads;
    }

    /**
     * This sets the number of downloads of the LO
     *
     * @param downloads int
     */
    public void setDownloads(int downloads) {
        this.downloads = downloads;
    }

    /**
     * @return double This returns the rating of the LO
     */
    public int getRating() {
        return rating;
    }

    /**
     * This sets the rating of the LO
     *
     * @param rating double
     */
    public void setRating(int rating) {
        this.rating = rating;
    }

    /**
     * @return String This returns the id of the LO in mongoDB
     */
    public String getId() {
        return id;
    }

    /**
     * This sets the id of the LO  in mongoDB
     *
     * @param id String
     */
    public void setId(String id) {
        this.id = id;
    }

    /**
     * @return String This returns the title of the LO
     */
    public String getTitle() {
        return title;
    }

    /**
     * This sets the title of the LO
     *
     * @param title String
     */
    public void setTitle(String title) {
        this.title = title;
    }

    /**
     * @return String This returns the subject of the LO
     */
    public String getSubject() {
        return subject;
    }

    /**
     * This sets the subject of the LO
     *
     * @param subject Long
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * @return String This returns the description of the LO
     */
    public String getDescription() {
        return description;
    }

    /**
     * This sets the description of the LO
     *
     * @param description String
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * @return String This returns the date the LO is uploaded
     */
    public Date getUploadDate() {
        return uploadDate;
    }

    /**
     * This sets the date of the LO is uploaded
     *
     * @param uploadDate String
     */
    public void setUploadDate(Date uploadDate) {
        this.uploadDate = uploadDate;
    }

    /**
     * @return String This returns the comments of the LO
     */
    public String getComments() {
        return comments;
    }

    /**
     * This sets the comments of the LO
     *
     * @param comments String
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     * @return String This returns the status of the LO
     */
    public int getStatus() {
        return status;
    }

    /**
     * This sets the status of the LO
     *
     * @param status String
     */
    public void setStatus(int status) {
        this.status = status;
    }

    /**
     * @return String This returns the reviewer of the LO
     */
    public String getRev() {
        return rev;
    }

    /**
     * This sets the rev of the LO
     *
     * @param rev String
     */
    public void setRev(String rev) {
        this.rev = rev;
    }

    /**
     * @return String This returns the title of the uploader of the LO
     */
    public String getUploadedBy() {
        return uploadedBy;
    }

    /**
     * This sets the uploader of the LO
     *
     * @param uploadedBy String
     */
    public void setUploadedBy(String uploadedBy) {
        this.uploadedBy = uploadedBy;
    }

    /**
     * @return List<String> This returns the list of errors of the LO
     */
    public List<String> getErrorList() {
        return errorList;
    }

    /**
     * This sets the errorList of the LO
     *
     * @param errorList List<String>
     */
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
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

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public String getFileExtension() {
        return fileExtension;
    }

    public void setFileExtension(String fileExtension) {
        this.fileExtension = fileExtension;
    }
}
