package com.neighborCabinet.project.controller;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReviewVO;
import com.neighborCabinet.project.service.PlaceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import java.util.ArrayList;

@Controller
public class PlaceController {
    @Autowired
    private PlaceInfoService service;
    @RequestMapping("/place/placeDetailView/{pNo}")
    public String rentalDetail(@PathVariable String pNo,
                               Model model){

        PlaceInfoVO pi=service.detailViewPlace(pNo);
        ArrayList<QaVO> qaList=service.showViewQA(pNo);
        ArrayList<ReviewVO> reviewList=service.showViewReview(pNo);
        model.addAttribute("pi",pi);
        model.addAttribute("qaList",qaList);
        model.addAttribute("reviewList",reviewList);

        return "place_b/placeDetailView";
    }
    @RequestMapping("/testb")
    public String test(){
        return "testB";
    }

}
