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
import java.io.BufferedOutputStream;
import java.io.BufferedReader;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStreamReader;
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
    
    LearningObjectService loService = new LearningObjectService();
    
    @RequestMapping(value="/upload", method = RequestMethod.POST)
    public void upload(@RequestParam("title") String title, @RequestParam("author") String author,
		       @RequestParam("description") String description, @RequestParam("file") MultipartFile file, @RequestParam("type") String type) {
            if (!file.isEmpty()) {
                    try {
                        byte[] bytes = file.getBytes();
                        File fil = new File(AppConfig.UPLOAD_BASE_PATH+ type + "//" + file.getOriginalFilename());
                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                        stream.write(bytes);
                        stream.close();

                        LearningObject lo = new LearningObject();
                        lo.setName(title);
                        lo.setUploadedBy(author);
                        lo.setDateUploaded(new Date().toString());
                        lo.setDescription(description);
                        lo.setStatus("1");
                        lo.setDownloads(0);
                        lo.setRating(1);
                        lo.setFilepath(file.getOriginalFilename());
                        LearningObjectDAO.addLearningObject(lo);


                        System.out.println("UPLOAD FINISHED");

                } catch (Exception e) {
                    System.err.println(e.toString());
                }
            } 
            else {
                System.err.println("EMPTY FILE.");
            }
        }
    
    public void uploadAllLOToInformatron()
    {
        try {
            SimpleClientHttpRequestFactory rf= new SimpleClientHttpRequestFactory();
            ClientHttpRequest req = rf.createRequest(URI.create(AppConfig.LOOP_URL + "/loop-XYZ/loop/list"),HttpMethod.GET);
            ClientHttpResponse response = req.execute();
            ClientHttpRequest req2 = rf.createRequest(URI.create(AppConfig.INFORMATRON_URL + "/InformatronYX/informatron/LO/upload/availableLO"), HttpMethod.GET);
            IOUtils.copy(response.getBody(), req2.getBody());
            ClientHttpResponse response2 = req2.execute();
            
            BufferedReader reader  = new BufferedReader(new InputStreamReader(response2.getBody()));
            try {
                JSONObject obj = new JSONObject(reader.readLine());
                // checking
                if(reader.readLine().equals("true"))
                        System.out.println("SUCCESS!!");
                else
                    System.err.println("FAILL!!");
            } catch (JSONException ex) {
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
