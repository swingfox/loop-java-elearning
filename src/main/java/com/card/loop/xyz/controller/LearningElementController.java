/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

import com.card.loop.xyz.dto.LearningElementDto;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.LearningElement;
//import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.service.LearningElementService;
import com.card.loop.xyz.service.UserService;
import java.net.UnknownHostException;
import java.util.ArrayList;
import java.util.List;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

/**
 *
 * @author Julie Jane A.Alegre
 */

@RestController
@RequestMapping("/LE")

public class LearningElementController {
   LearningElementService leService = new LearningElementService();
    @RequestMapping("/login")
    @ResponseBody
    public LearningElementDto LE(@RequestBody LearningElementDto le) throws UnknownHostException
    {
        LearningElementDto result = null;
        try{
            System.out.println("LE");
        LearningElementService service = new LearningElementService();
        result = service.getSpecificLearningElement(le);
        if(result==null)
            le.getErrorList().add("NULLL!");
        }catch(Exception e){
            //user.getErrorList().add(e.toString());
            System.out.println(e.toString());
        }
        return result;
    }
    
    @RequestMapping("/list")
    @ResponseBody
    public List<LearningElementDto> ListLE()
    {
        List<LearningElementDto> dtos = new ArrayList<>();
        try{
            dtos = leService.getLearningElements();
        }catch(Exception e){ 
            e.printStackTrace(); }
        return dtos;
    }
    
}
