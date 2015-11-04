/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dao.OldLODAO;
import com.card.loop.xyz.dto.LearningElementDto;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.service.LearningObjectService;
import com.card.loop.xyz.service.OldLOService;
import com.card.loop.xyz.service.UserService;
import com.loop.controller.ContentShipper;
import com.mongodb.gridfs.GridFSDBFile;
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.URI;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.json.JSONException;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpMethod;
import org.springframework.http.client.ClientHttpRequest;
import org.springframework.http.client.ClientHttpResponse;
import org.springframework.http.client.SimpleClientHttpRequestFactory;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
/**
 *
 * @author Aislinn
 */

@RestController
@RequestMapping("/LO")
public class LearningObjectController {
    
    @Autowired LearningObjectService loService;
    @Autowired LearningObjectDAO dao;
    
    @Autowired OldLOService loService2;
    @Autowired OldLODAO dao2;

    
    @RequestMapping(value="/upload", method = RequestMethod.POST)
    public String upload(@RequestParam(value = "title") String title, @RequestParam("author") String author,
		         @RequestParam("description") String description, @RequestParam("file") MultipartFile file, @RequestParam("type") String type) {
            if (!file.isEmpty()) {
                    try {
                        byte[] bytes = file.getBytes();
                        File fil = new File(AppConfig.UPLOAD_BASE_PATH + file.getOriginalFilename());
                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                        stream.write(bytes);
                        stream.close();

                        LearningObject lo = new LearningObject();
                        System.out.println(title);
                        System.out.println(author);
                        System.out.println(description);

                        lo.setTitle(title);
                        lo.setUploadedBy(author);
                        lo.setDateUpload(new Date());
                        lo.setDescription(description);
                        lo.setStatus(0);
                        lo.setDownloads(0);
                        lo.setRating(1);


                        System.out.println("UPLOAD LO FINISHED");

                } catch (Exception e) {
                    System.err.println(e.toString());
                }
            } 
            else {
                System.err.println("EMPTY FILE.");
            }
            
            return "redirect:/developer-update";
    }
    
     @RequestMapping(value = "/assignReviewer", method = RequestMethod.POST)
    public boolean assignReviewer(@RequestParam("loid") String id,@RequestParam("reviewer") String reviewer) throws UnknownHostException {
        if(id!=null && reviewer!=null)
            return loService.assignReviewer(id,reviewer);
        else
            return false;
    }
    
    public void uploadAllLOToInformatron()
    {
        try {
            SimpleClientHttpRequestFactory rf= new SimpleClientHttpRequestFactory();
            ClientHttpRequest req = rf.createRequest(URI.create(AppConfig.LOOP_URL + "/loop-XYZ/loop/LO/availableLO"),HttpMethod.GET);
            ClientHttpResponse response = req.execute();
            
            StringBuilder sb = new StringBuilder();
            BufferedReader br = new BufferedReader(new InputStreamReader(response.getBody()));
            ClientHttpRequest req2 = rf.createRequest(URI.create(AppConfig.INFORMATRON_URL + "/InformatronYX/informatron/LO/upload/availableLOs"), HttpMethod.POST);
            BufferedWriter req2Writer = new BufferedWriter(new OutputStreamWriter(req2.getBody()));
            String string = br.readLine();
                        br.close();

            req2Writer.write(string);
                        req2Writer.close();
            req2.getHeaders().add("Content-Type", "application/json");
            System.out.println(string);
            ClientHttpResponse response2 = req2.execute();
            BufferedReader reader  = new BufferedReader(new InputStreamReader(response2.getBody()));
            
            try {
                String str = reader.readLine();
                if(str.equals("true"))
                        System.out.println("SUCCESS!!");
                else
                    System.err.println("FAILL!!");
            } catch (Exception ex) {
                Logger.getLogger(LearningObjectController.class.getName()).log(Level.SEVERE, null, ex);
            }
        } catch (IOException ex) {
            Logger.getLogger(LearningObjectController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    //this is for the the admin
    /*
    *   @params String id the name of the specific LE
    *   @return List<LearningObjectDto> returns the list of all downloadable LEs
    */
    @RequestMapping("/availableLO")
    @ResponseBody
    public List<LearningObjectDto> availableListLO()
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getAvailableLearningObjects();
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return dtos;
    }
    
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
    //list of history revisions in LOs collection=oldlo
    @RequestMapping("/listHistory")
    @ResponseBody
    public List<LearningObjectDto> ListLOHistory() throws UnknownHostException
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService2.getLearningObjects();
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return dtos;
    }
    @RequestMapping("/acceptLO/{id}")
    @ResponseBody
    public boolean acceptLO(@PathVariable String id) throws UnknownHostException, Exception{
        LearningObjectDto ud = new LearningObjectDto();
        boolean ok = false;
        ud.setId(id);
        ok = loService.acceptLO(ud);
        this.uploadAllLOToInformatron();
        return ok;
    }
    
    @RequestMapping("/demoteLO/{id}")
    @ResponseBody
    public boolean demoteLO(@PathVariable String id) throws UnknownHostException, Exception{
        LearningObjectDto ud = new LearningObjectDto();
        boolean ok = false;
        ud.setId(id);
        ok = loService.demoteLO(ud);
        this.uploadAllLOToInformatron();
        return ok;
    }
    
    @RequestMapping("/deleteLO/{id}")
    @ResponseBody
    public boolean deleteLO(@PathVariable String id) throws UnknownHostException, Exception{
        LearningObjectDto ud = new LearningObjectDto();
        boolean ok = false;
        ud.setId(id);
        ok = loService.deleteLO(ud);
        //this.uploadAllLOToInformatron();
        return ok;
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
    @RequestMapping("/download")    
    public LearningObjectDto LODetails(@RequestParam("loid") String id) throws UnknownHostException
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
    *   @params String LOname the name of the specific LO
    *   @return ok returns true if approved successfully
    */
    @RequestMapping("/approve/{LOname}")    
    public boolean approve(@PathVariable String LOname) throws UnknownHostException
    {
        boolean ok;
        
        ok = loService.approveLO(LOname);
        this.uploadAllLOToInformatron();
        return ok;
    }
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLO/{elementID}", method = RequestMethod.GET)
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {                   
      //  GridFSDBFile element = dao.getSingleLO(elementID, "lo.meta");
        
       /* System.out.println(element.getId().toString());
        dao.writePhysicalFile(element.getId().toString(), element.getFilename());
        System.out.println(element);
        System.out.println(element.getFilename());
        String path = AppConfig.DOWNLOAD_BASE_PATH + element.getFilename();

        File f = new File(path);
        ContentShipper shipper = new ContentShipper(request, response, true);
        shipper.ship(path);         
        f.delete();
        */
    }
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLO/{elementID}", method = RequestMethod.HEAD)
    public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
   /*     GridFSDBFile element = dao.getSingleLO(elementID, "lo.meta");
        dao.writePhysicalFile(element.getId().toString(), element.getFilename());

        String path = AppConfig.DOWNLOAD_BASE_PATH + element.getFilename();
	File f = new File(path);

        ContentShipper shipper = new ContentShipper(request, response, true);
        shipper.ship(path);
        
        f.delete();*/
    }
    @RequestMapping("/getLO/{loid}")
    public List<LearningObjectDto> getLO(@PathVariable String loid) throws UnknownHostException {
        List<LearningObjectDto> lo = new ArrayList<>(); 
        lo.add(loService.getLearningObject(loid));
        return lo;
    }
    
    @RequestMapping("/getOldLO/{loid}")
    public List<LearningObjectDto> getOldLO(@PathVariable String loid) throws UnknownHostException {
        List<LearningObjectDto> lo = new ArrayList<>(); 
        lo.add(loService2.getLearningObject(loid));
        return lo;
    }
    
    @RequestMapping(value = "/reviewLO", method = RequestMethod.POST)
    public boolean reviewLO(@RequestParam("loid")String id, @RequestParam("rating") int rating, @RequestParam("comment") String comment) throws UnknownHostException{
        LearningObjectDto lo = new LearningObjectDto();
        
        lo.setId(id);
        lo.setComments(comment);
        lo.setRating(rating);
        System.out.println("ID : " +  id + " Comments: " + comment + " Rating: " + rating);
        return loService.reviewLO(lo);
    }
}
