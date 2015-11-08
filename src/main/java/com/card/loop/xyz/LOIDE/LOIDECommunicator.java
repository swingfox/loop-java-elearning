/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.LOIDE;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import java.io.File;
import java.io.IOException;
import java.net.UnknownHostException;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.springframework.beans.factory.annotation.Autowired;

/**
 *
 * @author David
 */
public class LOIDECommunicator implements LOIDEHandler{
    @Autowired LearningElementDAO le;
    @Autowired LearningObjectDAO lo;
    
    @Override
    public LearningElementMeta getLearningElementMeta(String id) {  // id or LE name?
         LearningElementMeta meta = null;
        try {
            LearningElement loop = le.getSpecificLearningElementById(id);
            meta = new LearningElementMeta();
            
            meta.setAuthorID(loop.getUploadedBy());
            meta.setDescription(loop.getDescription());
            meta.setID(loop.getId());  // id on mongodb?
            meta.setPublishingDate(loop.getUploadDate().toString());
            meta.setSize(Long.toString(loop.getLength()));
            meta.setTitle(loop.getTitle());
            meta.setType(loop.getType());
           
            
            throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
        } catch (UnknownHostException ex) {
            Logger.getLogger(LOIDECommunicator.class.getName()).log(Level.SEVERE, null, ex);
        }
        return meta;
    }

    @Override
    public File getLearningElement(String id) {
        File fil = null;
           try {
                    fil = new File(AppConfig.DOWNLOAD_BASE_PATH + id);
                
                    if (!fil.getParentFile().exists()){
                        fil.getParentFile().mkdirs();
                    }
                    le.getSingleLE(id,"le.meta").writeTo(fil);      
            }
            catch (Exception e) {
                    System.err.println(e.toString());
            }
           return fil;
    }

    @Override
    public List<LearningElementMeta> findLearningElementMeta() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public AuthorMeta getAuthorMeta(String id) {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }

    @Override
    public boolean submitLearningElement(LearningElementMeta meta, File file) {
        boolean finished = false;
        try {
            LearningElement loop = new LearningElement();
            loop.setUploadedBy(meta.getAuthorID());
            loop.setDescription(meta.getDescription());
            loop.setId(meta.getID());
            loop.setLength(Long.parseLong(meta.getSize()));
            loop.setUploadDate(new Date(meta.getPublishingDate()));
            loop.setTitle(meta.getTitle());
            loop.setType(meta.getType());
            loop.setRating(1);
            loop.setStatus(0);
            le.addFile(loop, file);
            finished = true;
        } catch (IOException ex) {
            Logger.getLogger(LOIDECommunicator.class.getName()).log(Level.SEVERE, null, ex);
        }
        
        return finished;
    }

    @Override
    public boolean submitLearningObject(LearningObjectMeta meta) {   
        boolean finished = false;
        LearningObject loop = new LearningObject();
        
        loop.setId(meta.getID());
        loop.setObjective(meta.getObjective());
        loop.setDateUpload(new Date(meta.getPublishingDate()));
        loop.setTitle(meta.getTitle());
        loop.setDescription(meta.getDescription());
        loop.setUploadedBy(meta.getAuthorID());
        loop.setRating(1);
        loop.setStatus(0);
        
        lo.saveLO(loop);
        return finished;
    }
    
}
