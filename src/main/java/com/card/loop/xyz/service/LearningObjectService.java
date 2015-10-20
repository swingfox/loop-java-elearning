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

    public LearningObjectDto getLearningObject(String id) throws UnknownHostException{
        LearningObject loModel;
        loModel = dao.getLearningObject(id);
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
            dto.setFilePath(loModel.getFilePath());     
            dto.setSequence(loModel.getSequence());
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
            dto.setName(model.getName());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setDateUploaded(model.getDateUploaded());
            dto.setRev(model.getRev());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setStatus(model.getStatus());
            dto.setSequence(model.getSequence());
            dto.setType(model.getType());
            dto.setFileName(model.getFileName());
            dto.setFilePath(model.getFilePath());
            dto.setFileType(model.getFileType());
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
            dto.setName(model.getName());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setDateUploaded(model.getDateUploaded());
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
        List<LearningObject> LOList = dao.getReviewerLOList(rev);//LearningObjectDAO.getAllLearningObjectByDateUpload(new Date());
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
        LearningObject lo = dao.getLearningObject(name);
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
            dao.updateLO(dto);
        return ok;
    }
    
    public boolean acceptUser(String name) throws UnknownHostException{
        boolean ok = false;
        LearningObject lo = dao.getLearningObject(name);
      //  User u= UserDAO.getUser(null);

       // u.setNewAccount(false);

    //    u.setNewAccount(false);
       // UserDAO.updateLO(u);
        return ok;
    }
}
