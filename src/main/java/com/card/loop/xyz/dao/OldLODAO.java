/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.dao;

import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.model.OldLO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.data.mongodb.core.MongoOperations;
import org.springframework.data.mongodb.core.query.Query;
import org.springframework.stereotype.Repository;

import java.net.UnknownHostException;
import java.util.List;

import static org.springframework.data.mongodb.core.query.Criteria.where;
import static org.springframework.data.mongodb.core.query.Query.query;

/**
 * @author aislinn
 */
@Repository
public class OldLODAO {
    @Autowired
    MongoOperations mongoOps;

    public static void main(String[] args) throws Exception {
        //MongoOperations mongoOps = new MongoTemplate(AppConfig.mongo(),AppConfig.DATABASE_LOOP);
        //JOptionPane.showMessageDialog(null,mongoOps.find(query(where("name").is("hahah")), OldLO.class));
    }

    /*
     * Get details of specific learning object
     */
    public OldLO getLearningObject(String id) throws UnknownHostException {
        return mongoOps.findOne(query(where("_id").is(id)), OldLO.class);
    }

    public List<OldLO> getListHistory() throws UnknownHostException {
        return mongoOps.findAll(OldLO.class);
    }

    public List<OldLO> getAllDownloadableLO() throws UnknownHostException {
        Query query = new Query();
        query.with(new Sort(new Sort.Order(Sort.Direction.DESC, "dateUploaded")));
        return (mongoOps.find(query(where("rating").is(5)), OldLO.class));
    }

    public List<OldLO> getReviewerLOList(String rev) throws UnknownHostException {
        return mongoOps.find(query(where("uploadedBy").is(rev)), OldLO.class);
    }

    public void updateLO(LearningObjectDto lo) throws UnknownHostException {
        Query query = new Query();
        query.addCriteria(where("_id").is(lo.getId()));
        OldLO obj = mongoOps.findOne(query, OldLO.class);
        obj.setId(lo.getId());
        obj.setUploadDate(lo.getUploadDate());
        obj.setDownloads(lo.getDownloads());
        obj.setStatus(lo.getStatus());
        obj.setSubject(lo.getSubject());
        obj.setDescription(lo.getDescription());
        obj.setUploadedBy(lo.getUploadedBy());
        obj.setRating(lo.getRating());
        obj.setComments(lo.getComments());
        mongoOps.save(obj);
    }
}
