/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dto;

import java.util.List;

/**
 * REVISION HISTORY
 * 
 * [2015/09/09]     -   Vine Deiparine  -   Initial Codes 
 * 
 */
public class LearningObjectDto {
        
    /*
    *number of downloads of the Learning Object
    */
    private int downloads;    
    /*
    *Rating of the Learning Object
    */
    private double rating;
    /*
    *Id of the Learning Object
    */
    private Long id;
    /*
    *Name of the Learning Object
    */
    private String name;
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
    private String dateUploaded;
    /*
    *Filepath of the Learning Object
    */
    private String filepath;
    /*
    *Comments of the Learning Object
    */
    private String comments;
    /*
    *Status of the Learning Object
    */
    private String status;
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
    private List<String>  errorList;

    /**
     * 
     * @return int Number of downloads of the LO
     */
    public int getDownloads() {
        return downloads;
    }

    /**
     * This sets the number of downloads of the LO
     * @param downloads int
     */
    public void setDownloads(int downloads) {
        this.downloads = downloads;
    }

    /**
     * 
     * @return double This returns the rating of the LO
     */
    public double getRating() {
        return rating;
    }

    /**
     * This sets the rating of the LO
     * @param rating double
     */
    public void setRating(double rating) {
        this.rating = rating;
    }

    /**
     * 
     * @return Long This returns the id of the LO
     */
    public Long getId() {
        return id;
    }

    /**
     * This sets the id of the LO
     * @param id Long
     */
    public void setId(Long id) {
        this.id = id;
    }

    /**
     * 
     * @return String This returns the name of the LO
     */
    public String getName() {
        return name;
    }

    /**
     * This sets the name of the LO
     * @param name String
     */
    public void setName(String name) {
        this.name = name;
    }

    /**
     * 
     * @return String This returns the subject of the LO
     */
    public String getSubject() {
        return subject;
    }

    /**
     * This sets the subject of the LO
     * @param subject Long
     */
    public void setSubject(String subject) {
        this.subject = subject;
    }

    /**
     * 
     * @return String This returns the description of the LO
     */
    public String getDescription() {
        return description;
    }

    /**
     * This sets the description of the LO
     * @param description String
     */
    public void setDescription(String description) {
        this.description = description;
    }

    /**
     * 
     * @return String This returns the date the LO is uploaded
     */
    public String getDateUploaded() {
        return dateUploaded;
    }

    /**
     * This sets the date of the LO is uploaded
     * @param dateUploaded String
     */
    public void setDateUploaded(String dateUploaded) {
        this.dateUploaded = dateUploaded;
    }

    /**
     * 
     * @return String This returns the filepath of the LO
     */
    public String getFilepath() {
        return filepath;
    }

    /**
     * This sets the filepath of the LO
     * @param filepath String
     */
    public void setFilepath(String filepath) {
        this.filepath = filepath;
    }

    /**
     * 
     * @return String This returns the comments of the LO
     */
    public String getComments() {
        return comments;
    }

    /**
     * This sets the comments of the LO
     * @param comments String
     */
    public void setComments(String comments) {
        this.comments = comments;
    }

    /**
     * 
     * @return String This returns the status of the LO
     */
    public String getStatus() {
        return status;
    }

    /**
     * This sets the status of the LO
     * @param status String
     */
    public void setStatus(String status) {
        this.status = status;
    }

    /**
     * 
     * @return String This returns the reviewer of the LO
     */
    public String getRev() {
        return rev;
    }

    /**
     * This sets the rev of the LO
     * @param rev String
     */
    public void setRev(String rev) {
        this.rev = rev;
    }

    /**
     * 
     * @return String This returns the name of the uploader of the LO
     */
    public String getUploadedBy() {
        return uploadedBy;
    }

    /**
     * This sets the uploader of the LO
     * @param uploadedBy String
     */
    public void setUploadedBy(String uploadedBy) {
        this.uploadedBy = uploadedBy;
    }

    /**
     * 
     * @return List<String> This returns the list of errors of the LO
     */
    public List<String> getErrorList() {
        return errorList;
    }

    /**
     * This sets the errorList of the LO
     * @param errorList List<String>
     */
    public void setErrorList(List<String> errorList) {
        this.errorList = errorList;
    }
}
