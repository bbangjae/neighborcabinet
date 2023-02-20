package com.neighborCabinet.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.messageAllVO_y;
import com.neighborCabinet.project.service.MessageService_y;

@Controller
public class MessageController {
	@Autowired
	private MessageService_y service;
	
	@RequestMapping("/message")
	public String message(HttpSession session, Model model) {
		
		return "/message/header";
		
	}
	
	@RequestMapping("/message/message")
	public String mesMessage(HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		
		ArrayList<messageAllVO_y> message = service.messageAll(userId);
		
		for(int i = 0;i<message.size();i++) {
			message.get(i).setMesDate(message.get(i).getMesDate().substring(0, 16));
		}
		model.addAttribute("message", message);
		
		return "/message/message";
		
	}
	
	@RequestMapping("/message/request")
	public String mesrequest(HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		
		ArrayList<ReserveVO_y> resInfo = service.resInfo(userId);
		model.addAttribute("resInfo", resInfo);

		return "/message/mesRequest";
		
	}
	
	@ResponseBody
	@RequestMapping("/message/requestO/{reserveNo}/{messageId}")
	public ArrayList<ReserveVO_y> requestO(@PathVariable int reserveNo, @PathVariable String messageId, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		System.out.println(service.resCheck(reserveNo, userId));
		if(service.resCheck(reserveNo, userId) == 0) {
			ArrayList<ReserveVO_y> resInfo = null;
			return resInfo;
		}
		service.requestO(reserveNo, messageId);
		
		ArrayList<ReserveVO_y> resInfo = service.resInfo(userId);
		
		return resInfo;
	}
	@ResponseBody
	@RequestMapping("/message/requestX/{reserveNo}/{messageId}")
	public ArrayList<ReserveVO_y> requestX(@PathVariable int reserveNo, @PathVariable String messageId, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sid");
		if(service.resCheck(reserveNo, userId) == 0) {
			ArrayList<ReserveVO_y> resInfo = null;
			return resInfo;
		}
		service.requestX(reserveNo, messageId);
		
		ArrayList<ReserveVO_y> resInfo = service.resInfo(userId);
		
		return resInfo;
	}
	
	@RequestMapping("/message/requestInfo/{reserveNo}")
	public String requestInfo(@PathVariable int reserveNo, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		
		ReserveVO_y requestInfo = service.requestInfo(reserveNo, userId);
		
		model.addAttribute("requestInfo", requestInfo);
		
		return "/message/requestInfo";
	}
	@RequestMapping("/message/requestInfo2/{reserveNo}")
	public String requestInfo2(@PathVariable int reserveNo, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		
		ReserveVO_y requestInfo = service.requestInfo(reserveNo, userId);
		
		model.addAttribute("requestInfo", requestInfo);
		
		return "/message/requestInfo2";
	}
}
