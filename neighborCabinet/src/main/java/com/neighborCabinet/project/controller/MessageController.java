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
	
	@RequestMapping("/message/requestO/{reserveNo}/{messageId}")
	public String requestO(@PathVariable int reserveNo, @PathVariable String messageId, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		System.out.println(service.resCheck(reserveNo, userId));
		if(service.resCheck(reserveNo, userId) == 0) {
			return "/index";
		}
		service.requestO(reserveNo, messageId);
		
		return "redirect:/message";
	}
	@RequestMapping("/message/requestX/{resNo}/{messageId}")
	public String requestX(@PathVariable int reserveNo, @PathVariable String messageId, HttpSession session, Model model) {
		String userId = (String) session.getAttribute("sid");
		if(service.resCheck(reserveNo, userId) == 0) {
			return "/index";
		}
		service.requestX(reserveNo, messageId);
		
		return "redirect:/message";
	}
	
	@RequestMapping("/message/requestInfo/{reserveNo}")
	public String requestInfo(@PathVariable int reserveNo, HttpSession session, Model model) {
		
		String userId = (String) session.getAttribute("sid");
		
		ReserveDetailVO_y requestInfo = service.requestInfo(reserveNo, userId);
		
		model.addAttribute("requestInfo", requestInfo);
		
		return "/message/requestInfo";
	}
}
