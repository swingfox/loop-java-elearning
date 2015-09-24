/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.model.LearningObject;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 *
 * @author Aislinn
 */
public class LearningObjectService 
{
    public LearningObjectDto getSpecificLearningObject(LearningObjectDto lo) throws UnknownHostException{
        LearningObject loModel;
        loModel = LearningObjectDAO.getSpecificLearningObject(lo.getName());
       if(loModel != null){
            //lo.setId(loModel.getID());
            lo.setName(loModel.getName());
            lo.setDescription(loModel.getDescription());
            lo.setSubject(loModel.getSubject());
            lo.setDateUploaded(loModel.getDateUploaded());
            
            /*dto.setDownloads(model.getDownloads());           
            dto.setRating(model.getRating());
            dto.setRev(model.getRev());
            dto.setStatus(model.getStatus());
            dto.setComments(model.getComments());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setFilepath(model.getFilepath());
            */
        }
        return lo;
    }
}
