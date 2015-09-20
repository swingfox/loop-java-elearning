/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author David
 */
@RequestMapping("/informatron")
public class InformatronController {
    @RequestMapping("/Idownload")
    public ModelAndView accessInformatronDownload() {
        return new ModelAndView("download");
    } 
    @RequestMapping("/IdownloadLE")
    public ModelAndView accessInformatronDownloadLE() {
        return new ModelAndView("downloadLE");
    } 
}
