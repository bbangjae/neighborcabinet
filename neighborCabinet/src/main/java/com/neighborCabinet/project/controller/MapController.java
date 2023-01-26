package com.neighborCabinet.project.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neighborCabinet.project.model.MapVO;
import com.neighborCabinet.project.service.MapService;

@Controller
public class MapController {
	@Autowired
	MapService mapService;
	
	@RequestMapping("/map")
	public String map(Model model) {
		ArrayList<MapVO> listAllMap = mapService.listAllMap();
		model.addAttribute("listAllMap", listAllMap);
		return "map/exMap";
	}
}
