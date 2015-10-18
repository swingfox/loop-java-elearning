/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.file.meta;

import com.mongodb.BasicDBObject;
import org.springframework.data.mongodb.core.mapping.Document;

/**
 *
 * @author David
 */

@Document(collection = "le.meta.files")
public class LearningElementMeta{
    private String title;
    private String fileName;
    private String filePath;
    private String fileType;

    public String getTitle() {
        return title;
    }

    public void setTitle(String name) {
        this.title = name;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public String getFilePath() {
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }

    public String getFileType() {
        return fileType;
    }

    public void setFileType(String fileType) {
        this.fileType = fileType;
    }
    
    
}
