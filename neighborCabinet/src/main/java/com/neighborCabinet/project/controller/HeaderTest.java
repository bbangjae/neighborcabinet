package com.neighborCabinet.project.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HeaderTest {
	
	@RequestMapping("/head")
	public String head() {
		return "/layout/head";
	}
}
