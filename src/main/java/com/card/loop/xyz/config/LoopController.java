package com.loop.controller;

import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;


@Controller
@RequestMapping("/api/file")
public class LoopController {
	
	@RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.GET)
	public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
		//request.setAttribute(FILE_ID, id);
	//	LearningElement element = Database.get().getElement(elementID);
	/*	String path = "/home/siegfred/Desktop/UPLOADS/" + element.getTitle();
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(path);*/
	}
	
	@RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.HEAD)
	public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
	//	LearningElement element = Database.get().getElement(elementID);
	/*	String path = "/home/siegfred/Desktop/UPLOADS/" + element.getTitle();
		ContentShipper shipper = new ContentShipper(request, response, false);
		shipper.ship(path);*/
	}
	
	@RequestMapping(value="/upload", method = RequestMethod.POST)
	public void uploadLearningElement(@RequestParam("title") String title, @RequestParam("author") String authorID,
						   @RequestParam("description") String description, @RequestParam("file") MultipartFile file) {
		if (!file.isEmpty()) {
			try {
                byte[] bytes = file.getBytes();
                File fil = new File("/home/siegfred/Desktop/UPLOADS/" + title);
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                stream.write(bytes);
                stream.close();
                
       //         LearningElement le = new LearningElement(title, authorID, description);
       //         Database.get().save(le);
                
                System.out.println("UPLOAD FINISHED");
            } catch (Exception e) {
                System.err.println(e.toString());
            }
        } else {
            System.err.println("EMPTY FILE.");
        }
	}
	
}
