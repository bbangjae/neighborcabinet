package com.neighborCabinet.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.service.BoxInfoService_y;

@Controller
public class HeaderTest {
	
	@Autowired
	private BoxInfoService_y service;
	
	@RequestMapping("/header")
	public String head() {
		return "/layout/header";
	}
	
	@RequestMapping("/boxOrder")
	public String boxOrder(Model model) {
		
		ArrayList<BoxInfoVO_y> type_A = service.type_AList();
		ArrayList<BoxInfoVO_y> type_B = service.type_BList();
		model.addAttribute("type_A", type_A);
		model.addAttribute("type_B", type_B);
		
		return "/boxOrder/boxOrder";
	}
}
