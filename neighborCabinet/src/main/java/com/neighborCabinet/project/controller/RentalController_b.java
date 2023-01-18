package com.neighborCabinet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class RentalController_b {
    @RequestMapping("/rental/detail")
    public String rentalDetail(){
        return "rental_b/rentalDetail";
    }
    @RequestMapping("/rental/map")
    public String rentalMap(){
        return "ex";
    }


}
