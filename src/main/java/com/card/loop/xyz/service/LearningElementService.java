/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.service;

import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dto.LearningElementDto;
import com.card.loop.xyz.model.LearningElement;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;

/**
 * @author Julie Jane Alegre
 */
@Service
public class LearningElementService {
    @Autowired
    LearningElementDAO dao;

    public boolean acceptLE(LearningElementDto le) throws Exception {
        boolean ok = false;
        LearningElement model = dao.getLE(le.getId());
        if (model != null) {
            model.setStatus(2);
            dao.acceptLE(model);
            ok = true;
        } else
            throw new Exception("LearningElement does not exist. ");
        return ok;

    }

    public boolean demoteLE(LearningElementDto le) throws Exception {
        boolean ok = false;
        LearningElement model = dao.getLE(le.getId());
        if (model != null) {
            model.setStatus(0);
            dao.demoteLE(model);
            ok = true;
        } else
            throw new Exception("LearningElement does not exist. ");
        return ok;

    }

    public boolean deleteLE(LearningElementDto le) throws Exception {
        boolean ok = false;
        LearningElement model = dao.getLE(le.getId());
        if (model != null) {
            dao.deleteLE(model);
            ok = true;
        } else
            throw new Exception("LearningObject does not exist. ");
        return ok;

    }

    public LearningElementDto getSpecificLearningElement(String id) throws UnknownHostException {
        LearningElement leModel = dao.getSpecificLearningElement(id);
        LearningElementDto dto = new LearningElementDto();
        if (leModel != null) {
            dto.setId(leModel.getId());
            dto.setTitle(leModel.getTitle());
            dto.setDescription(leModel.getDescription());
            dto.setSubject(leModel.getSubject());
            dto.setUploadDate(leModel.getUploadDate());
            dto.setDownloads(leModel.getDownloads());
            dto.setRating(leModel.getRating());
            dto.setRev(leModel.getRev());
            dto.setStatus(leModel.getStatus());
            dto.setComments(leModel.getComments());
            dto.setUploadedBy(leModel.getUploadedBy());
            dto.setFilePath(leModel.getFilePath());
        }
        return dto;
    }

    public List<LearningElementDto> getLearningElements() throws UnknownHostException {
        List<LearningElement> LOList = dao.getList();
        List<LearningElementDto> objects = new ArrayList<>();
        for (LearningElement model : LOList) {
            LearningElementDto dto = new LearningElementDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setUploadDate(model.getUploadDate());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setRev(model.getRev());
            dto.setStatus(model.getStatus());
            objects.add(dto);
        }
        return objects;
    }

    public List<LearningElementDto> searchLearningElements(String keyword) throws UnknownHostException {
        List<LearningElement> LOList;
        LOList = dao.searchLE(keyword);
        List<LearningElementDto> objects = new ArrayList<>();
        for (LearningElement model : LOList) {
            LearningElementDto dto = new LearningElementDto();
            dto.setId(model.getId());
            dto.setRating(model.getRating());
            dto.setTitle(model.getTitle());
            dto.setDescription(model.getDescription());
            dto.setSubject(model.getSubject());
            dto.setDownloads(model.getDownloads());
            dto.setUploadDate(model.getUploadDate());
            dto.setUploadedBy(model.getUploadedBy());
            dto.setComments(model.getComments());
            dto.setRev(model.getRev());
            dto.setStatus(model.getStatus());
            objects.add(dto);
        }
        return objects;
    }

    public boolean assignReviewer(String id, String reviewer) throws UnknownHostException {
        if (dao.exists(id))
            return dao.assignReviewer(id, reviewer);
        else
            return false;
    }

    public boolean reviewLE(LearningElementDto le) throws UnknownHostException {
        LearningElement obj = dao.getSpecificLearningElementById(le.getId());
        obj.setComments(le.getComments());
        obj.setRating(le.getRating());
        return dao.saveLE(obj);
    }

}
