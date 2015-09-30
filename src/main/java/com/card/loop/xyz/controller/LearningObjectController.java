/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.controller;

//import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.dto.LearningObjectDto;
import com.card.loop.xyz.dto.UserDto;
import com.card.loop.xyz.model.LearningElement;
import com.card.loop.xyz.model.LearningObject;
import com.card.loop.xyz.service.LearningObjectService;
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
 * @author Aislinn
 */

@RestController
@RequestMapping("/LO")

public class LearningObjectController {
    
    LearningObjectService loService = new LearningObjectService();
    
    @RequestMapping("/login")
    @ResponseBody
    public LearningObjectDto LO(@RequestBody LearningObjectDto lo) throws UnknownHostException
    {
        LearningObjectDto result = null;
        try{
            System.out.println("LOOO");
            LearningObjectService service = new LearningObjectService();
            result = service.getSpecificLearningObject(lo);
            if(result==null)
                lo.getErrorList().add("NULLL!");
        }catch(Exception e){
            //user.getErrorList().add(e.toString());
            System.out.println(e.toString());
        }
        return result;
    }
    
    @RequestMapping("/download")
    @ResponseBody
    public LearningObjectDto DownloadLO()
    {
        LearningObjectDto result = null;
        try{
            result = loService.getSpecificLearningObject(result);
            if(result!=null) {
            } else {
                result.getErrorList().add("NULLL!");
            }
        }catch(Exception e){
            //user.getErrorList().add(e.toString());
            System.out.println(e.toString());
        }
        return result;
    }
    
    @RequestMapping("/list")
    @ResponseBody
    public List<LearningObjectDto> ListLO()
    {
        List<LearningObjectDto> dtos = new ArrayList<>();
        try{
            dtos = loService.getLearningObjects();
        }catch(Exception e){ e.printStackTrace(); }
        return dtos;
    }
}
