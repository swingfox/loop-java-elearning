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
    /*
    *   @params String id the name of the specific LE
    *   @return List<LearningElementDto> returns the list of all downloadable LEs
    */
    @RequestMapping("/download/{id}")    
    @ResponseBody
    public LearningElementDto LEDetails(@PathVariable String id) throws UnknownHostException
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
    @RequestMapping(value = "/downloadLE/{elementID}", method = RequestMethod.GET)
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {                   
        GridFSDBFile element = dao.getSingleLE(elementID, "le.meta");
        System.out.println(element.getId().toString());
        dao.writePhysicalFile(element.getId().toString(), element.getFilename());
        System.out.println(element);
        System.out.println(element.getFilename());
        String path = "C:\\Users\\David\\Desktop\\LOOP-FILE-EDIT\\loop-java-elearning\\tmp\\" + element.getFilename();

        File f = new File(path);
        ContentShipper shipper = new ContentShipper(request, response, true);
        shipper.ship(path);         
        f.delete();

    }
    /*
    *   @params String elementID the name of the specific LO to be downloaded
    */
    @RequestMapping(value = "/downloadLE/{elementID}", method = RequestMethod.HEAD)
    public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
        //LearningElement element = dao.getSpecificLearningElementById(elementID);
        GridFSDBFile element = dao.getSingleLE(elementID, "le.meta");
        String path = "C:\\Users\\David\\Desktop\\LOOP-FILE-EDIT\\loop-java-elearning\\tmp\\" + element.getFilename();
	 File f = new File(path);
            System.out.println("DABOYY");
            ContentShipper shipper = new ContentShipper(request, response, true);
            shipper.ship(path);
         
        f.delete();
    }
    
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

                        LearningElement le = new LearningElement();
                        le.setTitle(title);
                        le.setUploadedBy(author);
                        le.setDescription(description);
                        le.setDownloads(0);
                        le.setStatus("1");
                        le.setRating(1);
                        le.setUploadDate(new Date().toString());
                        le.setFilePath(file.getOriginalFilename());
                        dao.addLearningElement(le);
                       

                        System.out.println("UPLOAD FINISHED");

                } catch (Exception e) {
                    System.err.println(e.toString());
                }
            } 
            else {
                System.err.println("EMPTY FILE.");
            }
            
        }
}
