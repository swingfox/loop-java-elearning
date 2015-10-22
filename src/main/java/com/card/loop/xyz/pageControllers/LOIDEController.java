/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import com.card.loop.xyz.config.AppConfig;
import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.dao.LearningObjectDAO;
import com.card.loop.xyz.dto.LearningElementDto;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.service.LearningElementService;
import com.card.loop.xyz.service.LearningObjectService;
import com.loop.controller.ContentShipper;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import javax.swing.JOptionPane;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

/**
 *
 * @author David
 * 10-04-2015-Julie Jane Alegre
 * 
 */
@Controller
@RequestMapping("/loide")
public class LOIDEController {
    @Autowired LearningElementService leService;
    @Autowired LearningElementDAO daoLE;
    @Autowired LearningObjectDAO daoLO;

    @RequestMapping("/download")
    public ModelAndView accessInformatronDownload() {
        return new ModelAndView("download");
    } 
    @RequestMapping("/downloadLE")
    public ModelAndView accessInformatronDownloadLE() {
        return new ModelAndView("downloadLE");
    } 
    @RequestMapping(value="/search", method=RequestMethod.GET)
    public ModelAndView accessQueryLE(HttpServletResponse res, HttpServletRequest req) {
        req.getParameter("searchKey");
        return new ModelAndView("downloadLE");
    } 
    @RequestMapping("/error")
    public ModelAndView accessError() {
        return new ModelAndView("error");
    }
    
    @RequestMapping("/query/{searchKey}")
    public List<LearningElementDto> find(@PathVariable String searchKey) {		
        //return Database.get().find(searchKey);
        List<LearningElementDto> dtos = new ArrayList<>();
        try{
            dtos = leService.getLearningElements(searchKey);
        }catch(Exception e){ 
            e.printStackTrace();
        }
        return dtos;
    }
    
    @RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.GET)
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
        LearningElement element= daoLE.getSpecificLearningElementById(elementID);
	String path = AppConfig.UPLOAD_LE_PATH + element.getTitle();
	ContentShipper shipper = new ContentShipper(request, response, true);
	shipper.ship(path);   
    }
        
    @RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.HEAD)
    public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {	
        LearningElement element= daoLE.getSpecificLearningElementById(elementID);
	String path = AppConfig.UPLOAD_LE_PATH + element.getTitle();
	ContentShipper shipper = new ContentShipper(request, response, false);
	shipper.ship(path);
    }
    
    @RequestMapping(value="/upload/lo", method = RequestMethod.POST)
    public void uploadLearningObject(@RequestParam("title") String title, @RequestParam("elements") String elementJson, @RequestParam("author") String authorID,
						   @RequestParam("description") String description, @RequestParam("quiz") MultipartFile file) {
                if (!file.isEmpty()) {
			try {
                byte[] bytes = file.getBytes();
                
                File fil = new File(System.getProperty("user.home") + File.separator + "Dragon/Learning Elements/quizzes/" + title + "/quiz");
                
                if (!fil.getParentFile().exists())
                	fil.getParentFile().mkdirs();
                
                fil.createNewFile();
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                stream.write(bytes);
                stream.close();
                
                LearningElement le = new LearningElement();
                le.setTitle(title);
                le.setUploadedBy(authorID);
                le.setDescription(description);
                daoLE.addFile(le);
                
                
                String lg = String.format("=================Learning Object Uploaded===========================\n"
                				 + " Title: %s\n"
                				 + " Author ID:	%s\n"
                				 + " Description: %s\n"
                				 + " Learning Elements :\n"
                				 + "%s\n"
                				 + " Quiz File: %s\n"
                				 + "========================Log end======================================\n",
                				 	title, authorID, description, elementJson, fil.getAbsolutePath());
                File log = new File(System.getProperty("user.home") + File.separator + "Dragon/Learning Elements/quizzes/" + title + "/log.txt");
                log.createNewFile();
                FileWriter writer = new FileWriter(log);
                writer.write(lg);
                writer.close();
                
            } catch (Exception e) {
                System.err.println(e.toString());
            }
        } else {
            System.err.println("EMPTY QUIZ");
        }
	}
        
    @RequestMapping(value="/upload", method = RequestMethod.POST)
    public String upload(@RequestParam("title") String title, @RequestParam("author") String author, @RequestParam("subject") String subject,
		       @RequestParam("description") String description, @RequestParam("file") MultipartFile file, @RequestParam("type") String type) {
            System.out.println("UPLOAD");
        if (!file.isEmpty()) {
                    try {
                        switch (type) {
                            case "LE":
                                System.out.println("TITLE: " + title);
                                LearningElement le = new LearningElement();
                                le.setTitle(title);
                                le.setUploadedBy(author);
                                le.setDescription(description);
                                le.setDownloads(0);
                                le.setStatus(0);
                                le.setRating(1);
                                le.setSubject(subject);
                                le.setType("LE");
                                le.setUploadDate(new Date().toString());
                                le.setFileName(file.getOriginalFilename());
                                le.setFilePath(AppConfig.UPLOAD_LE_PATH);
                                daoLE.addLearningElement(le);
                                
                                break;
                            case "LO":
                                LearningObject lo = new LearningObject();
                                lo.setTitle(title);
                                lo.setUploadedBy(author);
                                lo.setDescription(description);
                                lo.setDownloads(0);
                                lo.setStatus(0);
                                lo.setRating(1);
                                lo.setType(type);
                                lo.setSubject(subject);
                                lo.setFileName(file.getOriginalFilename());
                                lo.setFilePath(AppConfig.UPLOAD_LO_PATH);
                                daoLO.addLearningObject(lo);
                                JOptionPane.showMessageDialog(null,lo.getTitle());
                                break;   
                                default:
                                
                                break;
                        }

                        System.out.println("UPLOAD FINISHED");

                } catch (Exception e) {
                    System.err.println(e.toString());
                }
            } 
            else {
                System.err.println("EMPTY FILE.");
            }
            String redirect = null;
            if(type.equals("LE"))
                redirect = "redirect:/store/developer-le";
            else if(type.equals("LO"))
                redirect = "redirect:/store/developer-update";
            
            return redirect;
        }
    
}
