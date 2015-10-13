/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

//import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.service.LearningObjectService;
import com.card.loop.xyz.service.UserService;
import com.loop.controller.ContentShipper;
import com.mongodb.util.JSON;


import com.mongodb.util.JSON;


import java.io.BufferedReader;
import java.io.IOException;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.json.simple.JSONObject;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
/**
 *
 * @author Aislinn
 */

@RestController
@RequestMapping("/LO")

public class LearningObjectController {
    
    LearningObjectService loService = new LearningObjectService();
    
    public void downloadAllLO()
    {
        try {
            SimpleClientHttpRequestFactory rf= new SimpleClientHttpRequestFactory();
            ClientHttpRequest req= rf.createRequest(URI.create("http://192.168.254.101:8080/InformatronYX/informatron/LO/upload/availableLO"),HttpMethod.POST);
            java.io.PrintWriter pw = new java.io.PrintWriter(req.getBody());
            JSONObject obj= new JSONObject();
            obj.put("lo", loService.getLearningObjects());
            pw.print(obj.toString());
            ClientHttpResponse response = req.execute();
            
            //response
            BufferedReader reader= new BufferedReader(new java.io.InputStreamReader(response.getBody()));

            JSONObject responseObj = new JSONObject();
            responseObj.put(req, reader);
            

        } catch (IOException ex) {
            Logger.getLogger(LearningObjectController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //this is for the the admin
    /*
    *   @params String id the name of the specific LE
    *   @return List<LearningObjectDto> returns the list of all downloadable LEs
    */
    @RequestMapping("/list")
    @ResponseBody
    public List<LearningObjectDto> ListLO()
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getLearningObjects();
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return dtos;
    }
    /* 
    *   @return List<LearningObjectDto> reviewer's learning objects
    */
    @RequestMapping("/revList/{reviewerID}")
    @ResponseBody
    public List<LearningObjectDto> RevListLO(@PathVariable String reviewerID)
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getReviewerLOList(reviewerID);
        }catch(Exception e){ 
            e.printStackTrace(); 
        }
        return dtos;
    }

    /*
    *   @params String id the name of the specific LO
    *   @return List<LearningObjectDto> returns the list of all downloadable LOs
    */
    @RequestMapping("/download/{id}")    
    @ResponseBody
    public LearningObjectDto LODetails(@PathVariable String id) throws UnknownHostException
    {
        LearningObjectDto dto = new LearningObjectDto();
        try{
            dto = loService.getLearningObject(id);
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return dto;
    }
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLO/{elementID}", method = RequestMethod.GET)
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {                   
                LearningObject element = LearningObjectDAO.getLearningObject(elementID);
		String path = AppConfig.UPLOAD_LO_PATH + element.getFilepath();
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(path);   
    }
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLO/{elementID}", method = RequestMethod.HEAD)
    public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
                LearningObject element = LearningObjectDAO.getLearningObject(elementID);

		String path = AppConfig.UPLOAD_LO_PATH + element.getFilepath();
		ContentShipper shipper = new ContentShipper(request, response, false);
		shipper.ship(path);
    }
}
