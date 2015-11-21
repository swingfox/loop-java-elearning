/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import com.card.loop.xyz.controller.LearningObjectController;
import com.card.loop.xyz.model.LearningElement;
import com.loop.controller.ContentShipper;
import java.io.IOException;
import java.util.logging.Level;
import java.util.logging.Logger;
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
public class IndexController{
    @RequestMapping("/home")
    public ModelAndView accessIndex() throws IOException {
        LearningObjectController o = new LearningObjectController();
        o.uploadAllLOToInformatron();
        return new ModelAndView("index");
    } 
    @RequestMapping("/dragon")
    public ModelAndView dragon() throws IOException {
        return new ModelAndView("dragon");
    } 
    @RequestMapping("/download")
    public ModelAndView accessDownload() {
        return new ModelAndView("download");
    } 
    @RequestMapping(value="/downloads",method=RequestMethod.HEAD)
    public void accessDownloadFileH(HttpServletRequest req, HttpServletResponse res){
        try {
            ContentShipper sh = new ContentShipper(req,res,false); // true if ship physical file
            sh.ship("C:\\Users\\jm-maricel\\Desktop\\100415\\loop-java-elearning\\uploads\\LE\\TestLEUpload2.zip");
        } catch (IOException ex) {
            Logger.getLogger(IndexController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    
    @RequestMapping(value="/downloads",method=RequestMethod.GET)
    public void accessDownloadFile(HttpServletRequest req, HttpServletResponse res){
        try {
            ContentShipper sh = new ContentShipper(req,res,true); // true if ship physical file
            sh.ship("C:\\Users\\jm-maricel\\Desktop\\100415\\loop-java-elearning\\uploads\\LE\\TestLEUpload2.zip");
        } catch (IOException ex) {
            Logger.getLogger(IndexController.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
    @RequestMapping("/downloadLE")
    public ModelAndView accessDownloadLE() {
        return new ModelAndView("downloadLE");
    } 
    @RequestMapping("/downloadLEAdmin")
    public ModelAndView accessDownloadLEAdmin() {
        return new ModelAndView("downloadLEAdmin");
    } 
    @RequestMapping("/downloadLOAdmin")
    public ModelAndView accessDownloadLOAdmin() {
        return new ModelAndView("downloadLOAdmin");
    } 
    @RequestMapping("/historyLE-admin")
    public ModelAndView accessHistoryLEAdmin() {
        return new ModelAndView("historyLE-admin");
    } 
    @RequestMapping("/developer-le")
    public ModelAndView accessDeveloperLE() {
        return new ModelAndView("developer-le");
    } 
    @RequestMapping("/developer-update")
    public ModelAndView accessDeveloperUpdate() {
        return new ModelAndView("developer-update");
    } 
    @RequestMapping("/historyLE-dev")
    public ModelAndView accessHistoryLEDev() {
        return new ModelAndView("historyLE-dev");
    } 
    @RequestMapping("/historyLE-rev")
    public ModelAndView accessHistoryLERev() {
        return new ModelAndView("historyLE-rev");
    } 
    @RequestMapping("/historyLO-admin")
    public ModelAndView accessHistoryLOAdmin() {
        return new ModelAndView("historyLO-admin");
    }
    @RequestMapping("/historyLO-dev")
    public ModelAndView accessHistoryLODev() {
        return new ModelAndView("historyLO-dev");
    }
    @RequestMapping("/review-list")
    public ModelAndView accessReviewList() {
        return new ModelAndView("review-list");
    }
    @RequestMapping("/reviewLE-admin")
    public ModelAndView accessReviewLEAdmin() {
        return new ModelAndView("reviewLE-admin");
    }
    @RequestMapping("/advanced-search-rev")
    public ModelAndView accessAdvancedSearchRev() {
        return new ModelAndView("advanced-search-rev");
    }
    @RequestMapping("/advanced-search-dev")
    public ModelAndView accessAdvancedSearchDev() {
        return new ModelAndView("advanced-search-dev");
    }
    @RequestMapping("/reviewLE-rev")
    public ModelAndView accessReviewLERev() {
        return new ModelAndView("reviewLE-rev");
    }
    @RequestMapping("/reviewLO-admin")
    public ModelAndView accessReviewLOAdmin() {
        return new ModelAndView("reviewLO-admin");
    }
    @RequestMapping("/reviewLO-rev")
    public ModelAndView accessReviewLORev() {
        return new ModelAndView("reviewLO-rev");
    }
    @RequestMapping("/reviewer-le")
    public ModelAndView accessReviewerLE() {
        return new ModelAndView("reviewer-le");
    }
    @RequestMapping("/reviewer-update")
    public ModelAndView accessReviewerUpdate() {
        return new ModelAndView("reviewer-update");
    }
    @RequestMapping("/upload-dev")
    public ModelAndView accessUploadDev() {
        return new ModelAndView("upload-dev");
    }
    @RequestMapping("/historyLO-rev")
    public ModelAndView accessHistoryLORev() {
        return new ModelAndView("historyLO-rev");
    }
    
    @RequestMapping("/uploadLE-dev")
    public ModelAndView uploadLEDeveloper() {
        return new ModelAndView("uploadLE-dev");
    }
    
    @RequestMapping("/advanced-search-dev-results")
    public ModelAndView advancedSearchDevResults() {
        return new ModelAndView("advanced-search-dev-results");
    }
    
    @RequestMapping("/admin-view")
    public ModelAndView accessAdminView() {
        return new ModelAndView("admin-view");
    }
    @RequestMapping("/admin-view1")
    public ModelAndView accessAdminView1() {
        return new ModelAndView("admin-view1");
    }
    @RequestMapping("/admin-view2")
    public ModelAndView accessAdminView2() {
        return new ModelAndView("admin-view2");
    }
    @RequestMapping("/admin-view3")
    public ModelAndView accessAdminView3() {
        return new ModelAndView("admin-view3");
    }
    @RequestMapping("/admin-view4")
    public ModelAndView accessAdminView4() {
        return new ModelAndView("admin-view4");
    }
    @RequestMapping("/admin-view5")
    public ModelAndView accessAdminView5() {
        return new ModelAndView("admin-view5");
    }
    @RequestMapping("/admin-view6")
    public ModelAndView accessAdminView6() {
        return new ModelAndView("admin-view6");
    }
    @RequestMapping("/error")
    public ModelAndView accessError() {
        return new ModelAndView("error");
    }
}
