package com.neighborCabinet.project.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neighborCabinet.project.model.DealHistoryVO;
import com.neighborCabinet.project.model.RentHistoryVO;
import com.neighborCabinet.project.service.DealHistoryService;
import com.neighborCabinet.project.service.RentHistoryService;

@Controller
public class RentHistoryController {
	@Autowired
	RentHistoryService service;
	
	@Autowired
	DealHistoryService dealService;
	
	@RequestMapping("/rentHistory")
	public String rental(Model model) {
		//대여 내역
		ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory();
		model.addAttribute("rentAllHistory", rentAllHistory);
		
		//거래 내역
		ArrayList<DealHistoryVO> dealAllHistory = dealService.listAllDeal();
		model.addAttribute("dealAllHistory", dealAllHistory);
		
		
		return "rentHistory/rentHistory";
	}
}
