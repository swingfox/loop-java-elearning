/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author David
 */
@Controller
public class Redirect {
    @RequestMapping("/developer-update")
    public ModelAndView redirectDeveloperUpdate() {
        return new ModelAndView("developer-update");
    } 
    @RequestMapping("/developer-le")
    public ModelAndView redirectDeveloperLE() {
        return new ModelAndView("developer-le");
    } 
}
