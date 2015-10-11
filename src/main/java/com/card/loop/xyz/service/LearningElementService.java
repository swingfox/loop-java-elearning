/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dto.LearningElementDto;
import com.card.loop.xyz.model.LearningElement;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
/**
 *
 * @author Julie Jane Alegre
 */
public class LearningElementService {
    
    public LearningElementDto getSpecificLearningElement(String id) throws UnknownHostException{
        LearningElement leModel;
        leModel = LearningElementDAO.getSpecificLearningElement(id);
        LearningElementDto dto = new LearningElementDto();
       if(leModel != null){  
            dto.setId(leModel.getId());
            dto.setName(leModel.getName());
            dto.setDescription(leModel.getDescription());
            dto.setSubject(leModel.getSubject());
            dto.setDateUploaded(leModel.getDateUploaded());
            dto.setDownloads(leModel.getDownloads());           
            dto.setRating(leModel.getRating());
            dto.setRev(leModel.getRev());
            dto.setStatus(leModel.getStatus());
            dto.setComments(leModel.getComments());
            dto.setUploadedBy(leModel.getUploadedBy());
            dto.setFilepath(leModel.getFilePath());            
        }
        return dto;
    }
    
     public List<LearningElementDto> getLearningElements() throws UnknownHostException{
        List<LearningElement> LOList = LearningElementDAO.getList();//LearningObjectDAO.getAllLearningObjectByDateUpload(new Date());
        List<LearningElementDto> objects = new ArrayList<>();
        for(LearningElement model: LOList){
            LearningElementDto dto = new LearningElementDto();
          //  dto.setId(model.getID());
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
            objects.add(dto);
        }
        return objects;
     }
}
