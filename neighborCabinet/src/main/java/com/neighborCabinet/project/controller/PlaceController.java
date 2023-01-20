package com.neighborCabinet.project.controller;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.service.PlaceInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class PlaceController {
    @Autowired
    private PlaceInfoService service;
    @RequestMapping("/place/placeDetailView/{pNo}")
    public String rentalDetail(@PathVariable String pNo,
                               Model model){

        PlaceInfoVO pi=service.detailViewPlace(pNo);
        model.addAttribute("pi",pi);


        return "place_b/placeDetailView";
    }
    @RequestMapping("/rental/map")
    public String rentalMap(){
        return "test";
    }


}
