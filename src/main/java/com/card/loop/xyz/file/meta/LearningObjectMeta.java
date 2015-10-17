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

@Document(collection = "lo_meta")
public class LearningObjectMeta extends BasicDBObject{
    private String name;
    private String fileName;
    private String filePath;

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.put("name", name);
        this.name = name;
    }

    public String getFileName() {
        return fileName;
    }

    public void setFileName(String fileName) {
        this.put("fileName", fileName);
        this.fileName = fileName;
    }

    public String getFilePath() {
        this.put("filePath", filePath);
        return filePath;
    }

    public void setFilePath(String filePath) {
        this.filePath = filePath;
    }
}
