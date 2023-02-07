package com.neighborCabinet.project.controller;


import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neighborCabinet.project.model.DealHistoryVO;
import com.neighborCabinet.project.model.RentHistoryVO;
import com.neighborCabinet.project.service.DealHistoryService;
import com.neighborCabinet.project.service.RentHistoryService;

@Controller
public class RentHistoryController {
	//의존성 주입 부분 변경하기
	@Autowired
	RentHistoryService service;
	
	@Autowired
	DealHistoryService dealService;
	
	
	//여기 searchVO 제거
	@RequestMapping("/rentHistory")
	public String rental(@ModelAttribute("searchVO") RentHistoryVO searchVO, Model model) {
		//거래 내역
		ArrayList<DealHistoryVO> dealAllHistory = dealService.listAllDeal();
		model.addAttribute("dealAllHistory", dealAllHistory);
		
		//대여 내역
		ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory(searchVO);
		
		model.addAttribute("rentAllHistory", rentAllHistory);
		
		return "rentHistory/rentHistory";
	}
	
	@ResponseBody
	@RequestMapping("/rentHistorySearch") //주소 임시
	public ArrayList<RentHistoryVO> searchList(@ModelAttribute("searchVO") RentHistoryVO searchVO, Model model) {
		//대여내역 - 전체조회 검색
		ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory(searchVO);
		model.addAttribute("rentAllHistory", rentAllHistory);
		
		return service.listAllHistory(searchVO);
	}
	
}
