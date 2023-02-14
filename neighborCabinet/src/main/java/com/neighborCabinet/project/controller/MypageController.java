package com.neighborCabinet.project.controller;


import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.neighborCabinet.project.model.DealHistoryVO;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.RentHistoryVO;
import com.neighborCabinet.project.model.UsermodifyVO;
import com.neighborCabinet.project.service.DealHistoryService;
import com.neighborCabinet.project.service.IUsermodifyService;
import com.neighborCabinet.project.service.RentHistoryService;

@Controller
public class MypageController { 
	@Autowired
	private IUsermodifyService iUsermodifyService;
	
	@RequestMapping("/mypage")
	public String index() {
		return "mypage/MyPage";
	}
	
	@GetMapping("/modifyInfo")
	public String memberGetDetailGet(Model model, HttpSession session) throws Exception {
		String userId = (String) session.getAttribute("sid");
		model.addAttribute("memberInfo", iUsermodifyService.memberGetDetail(userId));
		return "mypage/modifyInfo";
	}
	
	@GetMapping("/modifyInfo2")
	public String memberGetDetailGet1(Model model, HttpSession session) throws Exception {
		String userId = (String) session.getAttribute("sid");
		model.addAttribute("memberInfo", iUsermodifyService.memberGetDetail(userId));
		return "mypage/modifyInfo2";
	}
	
	@RequestMapping("/modifyInfo!")
	public String memberModifyPOST(UsermodifyVO member, RedirectAttributes rttr) throws Exception {
		int result = iUsermodifyService.memberModify(member);
		rttr.addFlashAttribute("modify_result", result);
		return "redirect:/modifyInfo";
	}
	
	@PostMapping("/deleteInfo")
	public String memberDeletePOST(String userId, RedirectAttributes rttr) {
		
		int result = 0;
		 
		try {
			
			result = iUsermodifyService.memberDelete(userId);
			
		} catch (Exception e) {
			
			e.printStackTrace();
			result = 2; 
			rttr.addFlashAttribute("delete_result", result);
			
			return "redirect:/";
			
		}
		
		
		rttr.addFlashAttribute("delete_result", result);
		
		return "redirect:/";
		
	}	
	
	@Autowired
	RentHistoryService service;
	
	@Autowired
	DealHistoryService dealService;
	
	@RequestMapping("/lenderPage")
	public String lender(Model model) {
		//대여 내역
//		ArrayList<RentHistoryVO> rentAllHistory = service.listAllHistory();
//		model.addAttribute("rentAllHistory", rentAllHistory);
		
		//거래 내역
		ArrayList<DealHistoryVO> dealAllHistory = dealService.listAllDeal();
		model.addAttribute("dealAllHistory", dealAllHistory);
		
		
		return "mypage/lenderPage";
	}
}
