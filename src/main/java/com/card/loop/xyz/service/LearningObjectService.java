/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 *
 * @author Aislinn
 * 
 * [09/30/2015] -   Vine Deiparine  - Added getLearningObjects
 */
@Service
public class LearningObjectService 
{
    @Autowired LearningObjectDAO dao;
    
    public boolean acceptLO(LearningObjectDto lo) throws UnknownHostException, Exception{
        boolean ok = false;
        LearningObject model = dao.getLO(lo.getId());
        if(model!= null){
            model.setStatus(1);
            dao.acceptLO(model);
            ok = true;
        }
        else
            throw new Exception("LearningObject does not exist. ");
        return ok;
        
    }
    
    public boolean demoteLO(LearningObjectDto lo) throws UnknownHostException, Exception{
        boolean ok = false;
        LearningObject model = dao.getLO(lo.getId());
        if(model!= null){
            model.setStatus(0);
            dao.demoteLO(model);
            ok = true;
        }
        else
            throw new Exception("LearningObject does not exist. ");
        return ok;
        
    }
    
    public boolean deleteLO(LearningObjectDto lo) throws UnknownHostException, Exception{
        boolean ok = false;
        LearningObject model = dao.getLO(lo.getId());
        if(model!= null){
            //model.setStatus(0);
            dao.deleteLO(model);
            ok = true;
        }
        else
            throw new Exception("LearningObject does not exist. ");
        return ok;
        
    }
    
    public boolean assignReviewer(String id, String reviewer) throws UnknownHostException {
        if(dao.exists(id))
            return dao.assignReviewer(id,reviewer);
        else
            return false;
    }

    public LearningObjectDto getLearningObject(String id) throws UnknownHostException{
        LearningObject loModel;
        loModel = dao.getLearningObject(id);
        LearningObjectDto dto = new LearningObjectDto();
       if(loModel != null){  
            dto.setId(loModel.getId());
            dto.setTitle(loModel.getTitle());
            dto.setDescription(loModel.getDescription());
            dto.setSubject(loModel.getSubject());
            dto.setUploadDate(loModel.getUploadDate());
            dto.setDownloads(loModel.getDownloads());           
            dto.setRating(loModel.getRating());
            dto.setRev(loModel.getRev());
            dto.setStatus(loModel.getStatus());
            dto.setComments(loModel.getComments());
            dto.setUploadedBy(loModel.getUploadedBy());    
            dto.setPrice(loModel.getPrice());
            dto.setSequence(loModel.getSequence());
            dto.setObjective(loModel.getObjective());
        }
        return dto;
    }
    
    public List<LearningObjectDto> getLearningObjects() throws UnknownHostException{
        List<LearningObject> LOList = dao.getList();
        List<LearningObjectDto> objects = new ArrayList<>();
        for(LearningObject model: LOList){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setUploadDate(model.getUploadDate());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setStatus(model.getStatus());
            dto.setSequence(model.getSequence());
            dto.setPrice(model.getPrice());
            dto.setObjective(model.getObjective());

            objects.add(dto);
        }
        return objects;
    }
    
    public List<LearningObjectDto> getAvailableLearningObjects() throws UnknownHostException{
        List<LearningObject> LOList = dao.getAllDownloadableLO();
        List<LearningObjectDto> objects = new ArrayList<>();
        for(LearningObject model: LOList){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setUploadDate(model.getUploadDate());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setStatus(model.getStatus());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setSequence(model.getSequence());
            dto.setObjective(model.getObjective());
            dto.setPrice(model.getPrice());
            objects.add(dto);
        }
        return objects;
    }
    
    public List<LearningObjectDto> getReviewerLOList(String rev) throws UnknownHostException{
        List<LearningObject> LOList = dao.getReviewerLOList(rev);
        List<LearningObjectDto> objects = new ArrayList<>();
        for(LearningObject model: LOList){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setUploadDate(model.getUploadDate());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setStatus(model.getStatus());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setSequence(model.getSequence());
            dto.setObjective(model.getObjective());
            objects.add(dto);
        }
        return objects;
    }
    
    public boolean approveLO(String name) throws UnknownHostException{
        boolean ok = false;
        LearningObject lo = dao.getLearningObject(name);
        LearningObjectDto dto = new LearningObjectDto();
            dto.setId(lo.getId());
            dto.setRating(5);
            dto.setTitle(lo.getTitle());
            dto.setDescription(lo.getDescription());
            dto.setSubject(lo.getSubject());
            dto.setDownloads(lo.getDownloads());
            dto.setUploadDate(lo.getUploadDate());
            dto.setRev(lo.getRev());
            dto.setUploadedBy(lo.getUploadedBy());
            dto.setComments(lo.getComments());
            dto.setStatus(lo.getStatus());
            dto.setUploadedBy(lo.getUploadedBy());
            dto.setSequence(lo.getSequence());
            dto.setObjective(lo.getObjective());
            dao.updateLO(dto);
        return ok;
    }

    public boolean reviewLO(LearningObjectDto lo) throws UnknownHostException {
        LearningObject obj = dao.getLearningObject(lo.getId());
        obj.setComments(lo.getComments());
        obj.setRating(lo.getRating());
        return dao.saveLO(obj);
    }
}
