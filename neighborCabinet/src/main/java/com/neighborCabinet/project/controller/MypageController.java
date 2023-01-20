package com.neighborCabinet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MypageController {
	@RequestMapping("/mypage")
	public String index() {
		return "mypage/MyPage";
	}
	
	@RequestMapping("/mypage/modifyInfo")
	public String modifyInfo() {
		return "mypage/modifyInfo";
	}
	
	@RequestMapping("/reserve")
	public String reserve() {
		return "reserve";
	}
}
