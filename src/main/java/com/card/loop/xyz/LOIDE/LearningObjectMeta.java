/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.LOIDE;

import java.util.ArrayList;

/**
 * @author siegfred
 */
public class LearningObjectMeta {
    /*
    {
	   “ID”: ”dejgkqjbw33aaeccje”,
	   “authorID”:”nd3aenc44mzk”, 
	   “title”: “Learning Object Title”,
	   “description”: “Learning Object Description”,
	   “publishingDate”: “07/07/1997”,
	   “objective”: ”objective”
	}
    */

    private String ID;
    private String authorID;
    private String title;
    private String description;
    private String publishingDate;
    private String objective;
    private ArrayList<String> elementIDs;

    public ArrayList<String> getElementIDs() {
        return elementIDs;
    }

    public void setElementIDs(ArrayList<String> elementIDs) {
        this.elementIDs = elementIDs;
    }


    public String getID() {
        return ID;
    }

    public void setID(String ID) {
        this.ID = ID;
    }

    public String getAuthorID() {
        return authorID;
    }

    public void setAuthorID(String authorID) {
        this.authorID = authorID;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getPublishingDate() {
        return publishingDate;
    }

    public void setPublishingDate(String publishingDate) {
        this.publishingDate = publishingDate;
    }

    public String getObjective() {
        return objective;
    }

    public void setObjective(String objective) {
        this.objective = objective;
    }
}
