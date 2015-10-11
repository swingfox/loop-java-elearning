/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

//import com.card.loop.xyz.dto.UserDto;
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

    @RequestMapping("/download/{id}")    
    @ResponseBody
    public LearningObjectDto LODetails(@PathVariable String id) throws UnknownHostException
    {
        LearningObjectDto dto = new LearningObjectDto();
        try{
            dto = loService.getLearningObject(id);
        }catch(Exception e){ e.printStackTrace();}
        return dto;
    }
    
    @RequestMapping("/downloadAllLO")    
    @ResponseBody
    public List<LearningObjectDto> LearningObjects() throws UnknownHostException
    {
        List<LearningObjectDto> dto = new ArrayList<>();
        try{
            dto = loService.getLearningObjects();
        }catch(Exception e){ e.printStackTrace();}
        return dto;
    }
    
    @RequestMapping(value = "/downloadLO/{elementID}", method = RequestMethod.GET)
	public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
	
      //  LearningObject element= LearningObjectDAO.getLearningObject(elementID);
                            
                LearningObject element = LearningObjectDAO.getLearningObject(elementID);
                System.out.println("ELEMENT ID:" +  element.getFilepath());
		String path = "C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LO\\" + element.getFilepath();
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(path);   
	}
        
     @RequestMapping(value = "/downloadLO/{elementID}", method = RequestMethod.HEAD)
	public void getFileH(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
		
      //   LearningObject element= LearningObjectDAO.getLearningObject(elementID);
                LearningObject element = LearningObjectDAO.getLearningObject(elementID);

                System.out.println("ELEMENT ID:" +  element.getFilepath());

		String path = "C:\\Users\\David\\Desktop\\Software Engineering\\loop-java-elearning\\uploads\\LO\\" + element.getFilepath();
		ContentShipper shipper = new ContentShipper(request, response, false);
		shipper.ship(path);
	}
}
