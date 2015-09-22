/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.apache.commons.io.IOUtils;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author David
 */
@Controller
@RequestMapping("/informatron")
public class InformatronController {
    @RequestMapping(value="/download", method=RequestMethod.GET)
    private ModelAndView accessInformatronDownload (HttpServletResponse res, HttpServletRequest req) { 
        try {
                String path = req.getParameter("file");
                String fileName = req.getParameter("name");
                File f = new File(path);
                if (f.exists()) {
                    res.setContentLength(new Long(f.length()).intValue());
                    res.setHeader("Content-Disposition", "attachment; " + fileName);
                    res.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
                    OutputStream out = res.getOutputStream();
                    res.setContentType("text/plain; charset=utf-8");
                    FileInputStream fi = new FileInputStream(f);
                    IOUtils.copy(fi, out);
                    out.flush();
                    out.close();                     
                }
            } catch (Exception e) {
                e.printStackTrace();
            }      
        return new ModelAndView("download");
    }
    @RequestMapping("/downloadLE")
    public ModelAndView accessInformatronDownloadLE() {
        return new ModelAndView("downloadLE");
    } 
    @RequestMapping("/error")
    public ModelAndView accessError() {
        return new ModelAndView("error");
    }
}
