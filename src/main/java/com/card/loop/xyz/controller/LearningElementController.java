/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

import com.card.loop.xyz.config.AppConfig;
import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dto.LearningElementDto;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.service.LearningElementService;
import com.card.loop.xyz.service.UserService;
import com.loop.controller.ContentShipper;
import com.mongodb.gridfs.GridFSDBFile;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Julie Jane A. Alegre
 */

@RestController
@RequestMapping("/LE")
public class LearningElementController {
    @Autowired LearningElementService leService;
    @Autowired LearningElementDAO dao;
   /*
    *   @return List<LearningElementDto> returns the list of all downloadable LEs
    */ 
    @RequestMapping("/list")
    @ResponseBody
    public List<LearningElementDto> ListLE()
    {
        List<LearningElementDto> dtos = new ArrayList<>();
        try{
            dtos = leService.getLearningElements();
        }catch(Exception e){ 
            e.printStackTrace(); 
        }
        return dtos;
    }
    
     @RequestMapping("/acceptLE/{id}")
    @ResponseBody
    public boolean acceptLE(@PathVariable String id) throws UnknownHostException, Exception{
        LearningElementDto ud = new LearningElementDto();
        ud.setId(id);
        return leService.acceptLE(ud);
    }
    
    @RequestMapping("/demoteLE/{id}")
    @ResponseBody
    public boolean demoteLE(@PathVariable String id) throws UnknownHostException, Exception{
        LearningElementDto ud = new LearningElementDto();
        ud.setId(id);
        return leService.demoteLE(ud);
    }
    
    @RequestMapping("/deleteLE/{id}")
    @ResponseBody
    public boolean deleteLE(@PathVariable String id) throws UnknownHostException, Exception{
        LearningElementDto ud = new LearningElementDto();
        boolean ok = false;
        ud.setId(id);
        ok = leService.deleteLE(ud);
        return ok;
    }
    
    /*
    *   @params String id the name of the specific LE
    *   @return List<LearningElementDto> returns the list of all downloadable LEs
    */
    @RequestMapping(value="/download",method=RequestMethod.GET,params="id")    
    @ResponseBody
    public LearningElementDto LEDetails(@RequestParam("id") String id) throws UnknownHostException
    {
        LearningElementDto dto = new LearningElementDto();
        try{
            dto = leService.getSpecificLearningElement(id);
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return dto;
    }
    
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLE", method = RequestMethod.GET)
    public void getFile(HttpServletRequest request, HttpServletResponse response, @RequestParam(value="id") String elementID) throws IOException {                   
        GridFSDBFile element = dao.getSingleLE(elementID, "le.meta");
        dao.writePhysicalFile(element.getId().toString(), element.getFilename());
        System.out.println(element);
        System.out.println(element.getFilename());
        String path = AppConfig.DOWNLOAD_BASE_PATH + element.getFilename();

        File f = new File(path);
        ContentShipper shipper = new ContentShipper(request, response, true);
        shipper.ship(path);         
        f.delete();

    }
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLE", method = RequestMethod.HEAD)
    public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @RequestParam("id") String elementID) throws IOException {
        GridFSDBFile element = dao.getSingleLE(elementID, "le.meta");
        String path = AppConfig.DOWNLOAD_BASE_PATH + element.getFilename();
	File f = new File(path);
        System.out.println("DABOYY");
        ContentShipper shipper = new ContentShipper(request, response, true);
        shipper.ship(path);
         
        f.delete();
    }
    
    @RequestMapping(value="/upload", method = RequestMethod.POST)
    public ModelAndView upload(@RequestParam("title") String title, @RequestParam("author") String author, @RequestParam("subject") String subject,
                               @RequestParam("description") String description, @RequestParam("file") MultipartFile file, @RequestParam("type") String type) {
            if (!file.isEmpty()) {
                    try {
                        byte[] bytes = file.getBytes();
                        File fil = new File(AppConfig.USER_VARIABLE + AppConfig.LE_FILE_PATH + file.getOriginalFilename());
                
                        if (!fil.getParentFile().exists()){
                             fil.getParentFile().mkdirs();
                        }

                        BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                        stream.write(bytes);
                        stream.close();

                        LearningElement le = new LearningElement();
                        le.setTitle(title);
                        le.setUploadedBy(author);
                        le.setDescription(description);
                        le.setDownloads(0);
                        le.setStatus(1);
                        le.setRating(1);
                        le.setUploadDate(new Date());
                        le.setSubject(subject);
                        le.setFilePath(AppConfig.LE_FILE_PATH);
                        le.setFilename(file.getOriginalFilename());
                        le.setContentType(file.getOriginalFilename().split("\\.")[1]);
                        dao.addLearningElement(le);
                       

                        System.out.println("UPLOAD LE FINISHED");

                } catch (Exception e) {
                    System.err.println(e.toString());
                }
            } 
            else {
                System.err.println("EMPTY FILE.");
            }
          return new ModelAndView("developer-le-loop-redirect");
    }
    
    @RequestMapping(value = "/assignReviewer", method = RequestMethod.POST)
    public boolean assignReviewer(@RequestParam("leid") String id,@RequestParam("reviewer") String reviewer) throws UnknownHostException {
        if(id!=null && reviewer!=null)
            return leService.assignReviewer(id,reviewer);
        else
            return false;
    }
    
    @RequestMapping("/getLE/{leid}")
    public List<LearningElementDto> getLE(@PathVariable String leid) throws UnknownHostException {
        List<LearningElementDto> le = new ArrayList<>(); 
        le.add(leService.getSpecificLearningElement(leid));
        return le;
    }
    
    @RequestMapping(value = "/reviewLE", method = RequestMethod.POST)
    public boolean reviewLO(@RequestParam("leid")String id,@RequestParam("rating") int rating, @RequestParam("comment") String comment) throws UnknownHostException{
        LearningElementDto le = new LearningElementDto();
        le.setId(id);
        le.setRating(rating);
        le.setComments(comment);
        return leService.reviewLE(le);
    }
}
