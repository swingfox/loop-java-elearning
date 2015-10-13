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
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import com.loop.controller.ContentShipper;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.util.Date;
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
    
    @RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.GET)
    public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
        LearningElement element= LearningElementDAO.getSpecificLearningElementById(elementID);
	String path = "C:\\Users\\jm-maricel\\Desktop\\100815\\loop-java-elearning\\uploads\\LE\\" + element.getName();
	ContentShipper shipper = new ContentShipper(request, response, true);
	shipper.ship(path);   
    }
        
    @RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.HEAD)
    public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {	
        LearningElement element= LearningElementDAO.getSpecificLearningElementById(elementID);
	String path = "C:\\Users\\jm-maricel\\Desktop\\100815\\loop-java-elearning\\uploads\\LE\\" + element.getName();
	ContentShipper shipper = new ContentShipper(request, response, false);
	shipper.ship(path);
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

                        switch (type) {
                            case "LE":
                                LearningElement le = new LearningElement();
                                le.setName(title);
                                le.setUploadedBy(author);
                                le.setDescription(description);
                                le.setDownloads(0);
                                le.setStatus("1");
                                le.setRating(1);
                                le.setDateUploaded(new Date().toString());
                                le.setFilePath(file.getOriginalFilename());
                                LearningElementDAO.addLearningElement(le);
                                break;
                            case "LO":
                                LearningObject lo = new LearningObject();
                                lo.setName(title);
                                lo.setUploadedBy(author);
                                lo.setDescription(description);
                                lo.setFilepath(file.getOriginalFilename());
                                LearningObjectDAO.addLearningObject(lo);
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
        }
    
}
