package com.neighborCabinet.project.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

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
		
		String userId = (String) session.getAttribute("sid");
		
		ArrayList<ReserveVO_y> resInfo = service.resInfo(userId);
		
		model.addAttribute("resInfo", resInfo);
		
		ArrayList<messageAllVO_y> message = service.messageAll(userId);
		
		model.addAttribute("message", message);
		
		return "/message/message";
	}
	
	@RequestMapping("/message/requestO/{resNo}/{messageId}")
	public String requestO(@PathVariable String resNo, @PathVariable String messageId, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		System.out.println(service.resCheck(resNo, userId));
		if(service.resCheck(resNo, userId) == 0) {
			return "/index";
		}
		service.requestO(resNo, messageId);
		
		return "redirect:/message";
	}
	@RequestMapping("/message/requestX/{resNo}/{messageId}")
	public String requestX(@PathVariable String resNo, @PathVariable String messageId, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sid");
		if(service.resCheck(resNo, userId) == 0) {
			return "/index";
		}
		service.requestX(resNo, messageId);
		
		return "redirect:/message";
	}
	
	@RequestMapping("/message/requestInfo/{resNo}")
	public String requestInfo(@PathVariable String resNo, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		
		ReserveDetailVO_y requestInfo = service.requestInfo(resNo, userId);
		
		model.addAttribute("requestInfo", requestInfo);
		
		return "/message/requestInfo";
	}
}
