package com.neighborCabinet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class rentalController_S {

    @RequestMapping("/rental/rentalreg")
    public String rental() {
        return "rental/rentalreg";
    }
}
