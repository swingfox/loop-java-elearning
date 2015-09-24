/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author David
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
}
