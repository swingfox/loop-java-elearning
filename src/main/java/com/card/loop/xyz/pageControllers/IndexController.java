/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.card.loop.xyz.pageControllers;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

/**
 *
 * @author David
 */
@Controller
public class IndexController {
    @RequestMapping("/home")
    public ModelAndView accessIndex() {
        return new ModelAndView("index");
    } 
    @RequestMapping("/download")
    public ModelAndView accessDownload() {
        return new ModelAndView("download");
    } 
    @RequestMapping("/downloadLE")
    public ModelAndView accessDownloadLE() {
        return new ModelAndView("downloadLE");
    } 
    @RequestMapping("/downloadLE/admin")
    public ModelAndView accessDownloadLEAdmin() {
        return new ModelAndView("downloadLEAdmin");
    } 
    @RequestMapping("/downloadLO/admin")
    public ModelAndView accessDownloadLOAdmin() {
        return new ModelAndView("downloadLOAdmin");
    } 
    
    @RequestMapping("/historyLE/admin")
    public ModelAndView accessHistoryLEAdmin() {
        return new ModelAndView("historyLE-admin");
    } 
    @RequestMapping("/historyLE/dev")
    public ModelAndView accessHistoryLEDev() {
        return new ModelAndView("historyLE-dev");
    } 
    @RequestMapping("/historyLE/rev")
    public ModelAndView accessHistoryLERev() {
        return new ModelAndView("historyLE-rev");
    } 
    @RequestMapping("/historyLO/admin")
    public ModelAndView accessHistoryLOAdmin() {
        return new ModelAndView("historyLO-admin");
    }
    @RequestMapping("/historyLO/dev")
    public ModelAndView accessHistoryLODev() {
        return new ModelAndView("historyLO-dev");
    }
    @RequestMapping("/review-list")
    public ModelAndView accessReviewList() {
        return new ModelAndView("review-list");
    }
    @RequestMapping("/reviewLE/admin")
    public ModelAndView accessReviewLEAdmin() {
        return new ModelAndView("reviewLE-admin");
    }
    @RequestMapping("/reviewLE/rev")
    public ModelAndView accessReviewLERev() {
        return new ModelAndView("reviewLE-rev");
    }
    @RequestMapping("/reviewLO/admin")
    public ModelAndView accessReviewLOAdmin() {
        return new ModelAndView("reviewLE-rev");
    }
    @RequestMapping("/reviewLO/rev")
    public ModelAndView accessReviewLORev() {
        return new ModelAndView("reviewLO-rev");
    }
    @RequestMapping("/reviewer/le")
    public ModelAndView accessReviewerLE() {
        return new ModelAndView("reviewer-le");
    }
    @RequestMapping("/reviewer/update")
    public ModelAndView accessReviewerUpdate() {
        return new ModelAndView("reviewer-update");
    }
    @RequestMapping("/upload/dev")
    public ModelAndView accessUploadDev() {
        return new ModelAndView("upload-dev");
    }
    @RequestMapping("/historyLO/rev")
    public ModelAndView accessHistoryLORev() {
        return new ModelAndView("HistoryLO-rev");
    }
    
    @RequestMapping("/admin/view")
    public ModelAndView accessAdminView() {
        return new ModelAndView("admin-view");
    }
    @RequestMapping("/admin/view2")
    public ModelAndView accessAdminView2() {
        return new ModelAndView("admin-view2");
    }
    @RequestMapping("/admin/view3")
    public ModelAndView accessAdminView3() {
        return new ModelAndView("admin-view3");
    }
    @RequestMapping("/admin/view4")
    public ModelAndView accessAdminView4() {
        return new ModelAndView("admin-view4");
    }
    @RequestMapping("/admin/view5")
    public ModelAndView accessAdminView5() {
        return new ModelAndView("admin-view5");
    }
    @RequestMapping("/admin/view6")
    public ModelAndView accessAdminView6() {
        return new ModelAndView("admin-view6");
    }
    @RequestMapping("/error")
    public ModelAndView accessError() {
        return new ModelAndView("error");
    }
}
