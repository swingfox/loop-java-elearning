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
    public LearningElementDto getSpecificLearningElement(LearningElementDto le) throws UnknownHostException{
        LearningElement leModel;
        leModel = LearningElementDAO.getSpecificLearningElement(le.getName());
       if(leModel != null){
            //lo.setId(loModel.getID());
            le.setName(leModel.getName());
            le.setDescription(leModel.getDescription());
            le.setSubject(leModel.getSubject());
            le.setDateUploaded(leModel.getDateUploaded());
            
            /*dto.setDownloads(model.getDownloads());           
            dto.setRating(model.getRating());
            dto.setRev(model.getRev());
            dto.setStatus(model.getStatus());
            dto.setComments(model.getComments());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setFilepath(model.getFilepath());
            */
        }
        return le;
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
