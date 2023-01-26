package com.neighborCabinet.project.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neighborCabinet.project.service.UsermodifyService;

@Controller
public class MypageController {
	@Autowired
	private UsermodifyService service;
	
	@RequestMapping("/mypage")
	public String index() {
		return "mypage/MyPage";
	}
	
	@RequestMapping("/modifyInfo")
	public String memberView(String userId, Model model) {
		model.addAttribute("vo", service.viewMember(userId));
		return "mypage/modifyInfo";
	}
}
