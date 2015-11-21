package com.card.loop.xyz.dragon;

import com.card.loop.xyz.LOIDE.LOIDECommunicator;
import com.card.loop.xyz.LOIDE.LOIDEHandler;
import com.card.loop.xyz.LOIDE.LearningElementMeta;
import com.card.loop.xyz.LOIDE.LearningObjectMeta;
import com.card.loop.xyz.model.LearningElement;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileOutputStream;
import java.io.FileWriter;
import java.io.IOException;
import java.lang.reflect.GenericArrayType;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.tika.Tika;
import org.json.JSONArray;
import org.json.JSONException;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

//import com.loop.controller.Database.LearningElement;

@Controller
@RequestMapping("/api/file")
public class DragonController {
	private LOIDEHandler handler = new LOIDECommunicator();
	
	@RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.GET)
	public void getFile(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
		//request.setAttribute(FILE_ID, id);
                
                
                File file = handler.getLearningElement(elementID);
		//LearningElement element = Database.get().getElement(elementID);
		//String path = System.getProperty("user.home") + File.separator + "Dragon/Learning Elements/" + element.getTitle();
		
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(file);
	}
	
	@RequestMapping(value = "/retrieve/{elementID}", method = RequestMethod.HEAD)
	public void getFileHeader(HttpServletRequest request, HttpServletResponse response, @PathVariable String elementID) throws IOException {
		File file = handler.getLearningElement(elementID);
		//LearningElement element = Database.get().getElement(elementID);
		//String path = System.getProperty("user.home") + File.separator + "Dragon/Learning Elements/" + element.getTitle();
		
		ContentShipper shipper = new ContentShipper(request, response, true);
		shipper.ship(file);
	}
	
    @RequestMapping(value = "/uploadquiz", method = RequestMethod.POST)
    public void uploadQuiz(HttpServletResponse response, @RequestParam("title") String title, @RequestParam("author") String authorID,
            @RequestParam("description") String description, @RequestParam("objective") String objective,
            @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File fil = new File(title);

                fil.createNewFile();
                
                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                stream.write(bytes);
                stream.close();
                
                
                //LearningElement le = new LearningElement(title, authorID, description);

                //Tika t = new Tika();
                //String fType = t.detect(bytes);
                //fType = fType.substring(0, fType.indexOf('/', 0));
 
                LearningElementMeta meta = new LearningElementMeta();
                meta.setDescription(description);
                meta.setAuthorID(authorID);
                meta.setPublishingDate(new Date().toString());
                meta.setSize(String.valueOf(file.getSize()));
                meta.setTitle(title);
                meta.setType("quiz");

                handler.submitLearningElement(meta, fil);

                response.setStatus(HttpServletResponse.SC_ACCEPTED);
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_PRECONDITION_FAILED);
            System.err.println("EMPTY FILE.");
        }
    }

    @RequestMapping(value = "/prepare/{elementID}", method = RequestMethod.POST)
    public void prepareZippedElement(HttpServletRequest req, HttpServletResponse resp, @PathVariable String elementID) throws IOException {
        String s = File.separator;
        String launcherPath = req.getServletContext().getRealPath(s) + "html-le-stage" + s + elementID;
        System.out.println(launcherPath);

        UnzipUtility ut = new UnzipUtility();

        //LearningElement le = Database.get().getElement(elementID);
        File zip = handler.getLearningElement(elementID);
        ut.unzip(zip, launcherPath);
        resp.setStatus(HttpServletResponse.SC_OK);
    }

    @RequestMapping(value = "/upload", method = RequestMethod.POST)
    public void uploadLearningElement(HttpServletResponse response, @RequestParam("title") String title, @RequestParam("author") String authorID,
            @RequestParam("description") String description, @RequestParam("objective") String objective,
            @RequestParam("file") MultipartFile file) {
        if (!file.isEmpty()) {
            try {
                byte[] bytes = file.getBytes();
                File fil = new File(title);

                fil.createNewFile();

                BufferedOutputStream stream = new BufferedOutputStream(new FileOutputStream(fil));
                stream.write(bytes);
                stream.close();

                //LearningElement le = new LearningElement(title, authorID, description);
                Tika t = new Tika();
                String fType = t.detect(bytes);
                fType = fType.substring(0, fType.indexOf('/', 0));
                
                if (fType.equals("application")) {
                    fType = "class";
                }
                
                LearningElementMeta meta = new LearningElementMeta();
                meta.setDescription(description);
                meta.setAuthorID(authorID);
                meta.setPublishingDate(new Date().toString());
                meta.setSize(String.valueOf(file.getSize()));
                meta.setTitle(title);
                meta.setType(fType);

                handler.submitLearningElement(meta, fil);

                response.setStatus(HttpServletResponse.SC_ACCEPTED);
            } catch (Exception e) {
                e.printStackTrace();
                response.setStatus(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
            }
        } else {
            response.setStatus(HttpServletResponse.SC_PRECONDITION_FAILED);
            System.err.println("EMPTY FILE.");
        }
    }
	
	@RequestMapping(value="/upload/lo", method = RequestMethod.POST)
	public void uploadLearningObject(HttpServletResponse response, @RequestParam("title") String title, @RequestParam("elements") String elementJson, @RequestParam("author") String authorID,
						   @RequestParam("description") String description, @RequestParam("objective") String objective) throws JSONException {
            LearningObjectMeta meta = new LearningObjectMeta();
            
            meta.setAuthorID(authorID);
            meta.setDescription(description);
            meta.setObjective(objective);
            meta.setPublishingDate(new Date().toString());
            meta.setTitle(title);
            JSONArray json = new JSONArray(elementJson);
            
            ArrayList<String> ids= new ArrayList<>();
            
            for (int i = 0; i < json.length(); ++i) {
                ids.add(json.getString(i));
            }
            
            meta.setElementIDs(ids);
            
            handler.submitLearningObject(meta);
            
	}
}
