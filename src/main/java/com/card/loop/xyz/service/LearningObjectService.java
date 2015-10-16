/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dao.UserDAO;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.model.User;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Aislinn
 * 
 * [09/30/2015] -   Vine Deiparine  - Added getLearningObjects
 */
public class LearningObjectService 
{
    public LearningObjectDto getLearningObject(String id) throws UnknownHostException{
        LearningObject loModel;
        loModel = LearningObjectDAO.getLearningObject(id);
        LearningObjectDto dto = new LearningObjectDto();
       if(loModel != null){  
            dto.setId(loModel.getId());
            dto.setName(loModel.getName());
            dto.setDescription(loModel.getDescription());
            dto.setSubject(loModel.getSubject());
            dto.setDateUploaded(loModel.getDateUploaded());
            dto.setDownloads(loModel.getDownloads());           
            dto.setRating(loModel.getRating());
            dto.setRev(loModel.getRev());
            dto.setStatus(loModel.getStatus());
            dto.setComments(loModel.getComments());
            dto.setUploadedBy(loModel.getUploadedBy());
            dto.setFilepath(loModel.getFilepath());     
            dto.setSequence(loModel.getSequence());
        }
        return dto;
    }
    
    public List<LearningObjectDto> getLearningObjects() throws UnknownHostException{
        List<LearningObject> LOList = LearningObjectDAO.getList();
        List<LearningObjectDto> objects = new ArrayList<>();
        for(LearningObject model: LOList){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setName(model.getName());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setDateUploaded(model.getDateUploaded());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setRev(model.getRev());
            dto.setStatus(model.getStatus());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setSequence(model.getSequence());
            objects.add(dto);
        }
        return objects;
    }
    
    public List<LearningObjectDto> getAvailableLearningObjects() throws UnknownHostException{
        List<LearningObject> LOList = LearningObjectDAO.getAllDownloadableLO();
        List<LearningObjectDto> objects = new ArrayList<>();
        for(LearningObject model: LOList){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setName(model.getName());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setDateUploaded(model.getDateUploaded());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setRev(model.getRev());
            dto.setStatus(model.getStatus());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setSequence(model.getSequence());
            objects.add(dto);
        }
        return objects;
    }
    
    public List<LearningObjectDto> getReviewerLOList(String rev) throws UnknownHostException{
        List<LearningObject> LOList = LearningObjectDAO.getReviewerLOList(rev);//LearningObjectDAO.getAllLearningObjectByDateUpload(new Date());
        List<LearningObjectDto> objects = new ArrayList<>();
        for(LearningObject model: LOList){
            LearningObjectDto dto = new LearningObjectDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setName(model.getName());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setDateUploaded(model.getDateUploaded());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setStatus(model.getStatus());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setSequence(model.getSequence());
            objects.add(dto);
        }
        return objects;
    }
    
    public boolean approveLO(String name) throws UnknownHostException{
        boolean ok = false;
        LearningObject lo = LearningObjectDAO.getLearningObject(name);
        LearningObjectDto dto = new LearningObjectDto();
            dto.setId(lo.getId());
            dto.setRating(5);
            dto.setName(lo.getName());
            dto.setDescription(lo.getDescription());
            dto.setSubject(lo.getSubject());
            dto.setDownloads(lo.getDownloads());
            dto.setDateUploaded(lo.getDateUploaded());
            dto.setRev(lo.getRev());
            dto.setUploadedBy(lo.getUploadedBy());
            dto.setComments(lo.getComments());
            dto.setStatus(lo.getStatus());
            dto.setUploadedBy(lo.getUploadedBy());
            dto.setSequence(lo.getSequence());
        LearningObjectDAO.updateLO(dto);
        return ok;
    }
    
    public boolean acceptUser(String name) throws UnknownHostException{
        boolean ok = false;
        LearningObject lo = LearningObjectDAO.getLearningObject(name);
        User u= UserDAO.getUser(null);
        u.setNewAccount(false);
       // UserDAO.updateLO(u);
        return ok;
    }
}
