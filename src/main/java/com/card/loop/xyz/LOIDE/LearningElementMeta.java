/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.LOIDE;

/**
 * @author siegfred
 */
public class LearningElementMeta {
    /*{
	  “ID”: “LearningElementID”,
	  “title”: “Titie”,
	  “authorID”:”nd3aenc44mzk”, 
	  “description”: “LE description”
	  “type”: ”Video”,
	  “publishingDate”: “09/09/1993”,
	  “size”: “0.45 MB”;
	}*/

    private String ID;
    private String title;
    private String authorID;
    private String description;
    private String type;
    private String publishingDate;
    private String size;

    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getPublishingDate() {
        return publishingDate;
    }

    public void setPublishingDate(String publishingDate) {
        this.publishingDate = publishingDate;
    }

    public String getSize() {
        return size;
    }

    public void setSize(String size) {
        this.size = size;
    }

}
