/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

//import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.service.LearningObjectService;
import com.card.loop.xyz.service.UserService;
import com.mongodb.util.JSON;
import java.io.BufferedReader;
import java.io.IOException;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import org.json.simple.JSONObject;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
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
    /**
    @RequestMapping("/login")
    @ResponseBody
    public LearningObjectDto LO(@RequestBody LearningObjectDto lo) throws UnknownHostException
    {
        LearningObjectDto result = null;
        try{
            System.out.println("LOOO");
            LearningObjectService service = new LearningObjectService();
            result = service.getLearningObject(lo.getID());
            if(result==null)
                lo.getErrorList().add("NULLL!");
        }catch(Exception e){
            //user.getErrorList().add(e.toString());
            System.out.println(e.toString());
        }
        return result;
    }**/
    //wla na dawy requestmapping
    //okay so 
    //okie, 
    //padaun ug code, waitt....,cge goooo
    public void DownloadLO()
    {
        try {
            /*LearningObjectDto result = null;
            try{
            result = loService.getSpecificLearningObject(result);
            if(result!=null) {
            } else {
            result.getErrorList().add("NULLL!");
            }
            }catch(Exception e){
            //user.getErrorList().add(e.toString());
            System.out.println(e.toString());
            }
            return result;*/
            SimpleClientHttpRequestFactory rf= new SimpleClientHttpRequestFactory();
            ClientHttpRequest req= rf.createRequest(URI.create("http://192.168.254.101:8080/InformatronYX/informatron/LO/upload/availableLO"),HttpMethod.POST);
            java.io.PrintWriter pw = new java.io.PrintWriter(req.getBody());
            JSONObject obj= new JSONObject();
            pw.print(obj.toString());
            ClientHttpResponse response = req.execute();
            
            //response
            BufferedReader reader= new BufferedReader(new java.io.InputStreamReader(response.getBody()));

            JSONObject responseObj = new JSONObject();
            responseObj.put(req, reader);
            
            // JSONObject responseObj = (JSONObject) JSONSerializer.toJSON(reader.readLine());

           // JSONObject responseObj = new JSONObject(reader.readLine());

           // JSONObject responseObj = new JSONObject(reader.readLine());

        } catch (IOException ex) {
            Logger.getLogger(LearningObjectController.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
    //this is for the the admin
    @RequestMapping("/list")
    @ResponseBody
    public List<LearningObjectDto> ListLO()
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getLearningObjects();
        }catch(Exception e){ }
        return dtos;
    }
    

    //this is for the the admin
    @RequestMapping("/revList")
    @ResponseBody
    public List<LearningObjectDto> RevListLO(@RequestBody String rev)
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getReviewerLOList(rev);
        }catch(Exception e){ 
            e.printStackTrace(); }
        return dtos;
    }
    @RequestMapping("/LODetails")    
    public LearningObjectDto LODetails(@RequestBody String id) throws UnknownHostException
    {
        LearningObjectDto dto = new LearningObjectDto();
        try{
            dto = loService.getLearningObject(id);
        }catch(Exception e){ }
        return dto;
    }
}
