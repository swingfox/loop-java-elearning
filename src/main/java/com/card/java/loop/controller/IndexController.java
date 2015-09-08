/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.java.loop.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author Ian AHAHHAHA
 */

@Controller
@RequestMapping("/loop-java-elearning")
public class IndexController {
    
    @RequestMapping("/home")
    public ModelAndView accesToIndexPage(){
        return new ModelAndView("index"); 
      /*  ingani-un pag safely switch pages sa J2EE
                
                Todo:
                1.  I-set up imu mga XML
                2.  I-map ang pages(code above)
                3.  Himu mga contollers
      */
    }
}
