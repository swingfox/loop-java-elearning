/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import java.io.IOException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;
import com.card.loop.xyz.dao.LearningElementDAO;
import com.card.loop.xyz.model.LearningElement;
import com.loop.controller.ContentShipper;

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
		//request.setAttribute(FILE_ID, id);
              
                LearningElement element= LearningElementDAO.getSpecificLearningElement(elementID);
		String path = "C:\\Users\\jm-maricel\\Desktop\\100415\\loop-java-elearning\\uploads\\LE\\" + element.getName();
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(path);   
	}
        
     @RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.HEAD)
	public void getFileH(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
		//request.setAttribute(FILE_ID, id);
            
                LearningElement element= LearningElementDAO.getSpecificLearningElement(elementID);
		String path = "C:\\Users\\jm-maricel\\Desktop\\100415\\loop-java-elearning\\uploads\\LE\\" + element.getName();
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(path);
	}
        
        
}
