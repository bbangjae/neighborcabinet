package com.neighborCabinet.project.controller;

import java.util.ArrayList;
import java.util.HashMap;

import com.neighborCabinet.project.service.MapAddressChangeService;
import org.json.JSONArray;
import org.json.JSONObject;
import org.json.simple.parser.JSONParser;
import org.json.simple.parser.ParseException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neighborCabinet.project.model.MapVO;
import com.neighborCabinet.project.service.MapService;

import javax.servlet.http.HttpServletRequest;

import static org.apache.logging.log4j.message.MapMessage.MapFormat.JSON;

@Controller
public class MapController {
	@Autowired
	MapService mapService;
	MapAddressChangeService macService;
	@RequestMapping("/map")
	public String map(Model model,
					  HttpServletRequest request) {
		ArrayList<MapVO> listAllMap = mapService.listAllMap();

		JSONArray mapAddress = new JSONArray();
		for(int i=0;i<listAllMap.size();i++) {
			HashMap<String, Object> map = macService.addToxy(listAllMap.get(i).getpAddress1());
			JSONObject jo = new JSONObject(map);
			mapAddress.put(jo);
		}

		request.setAttribute("mA",mapAddress);
		model.addAttribute("listAllMap", listAllMap);
		return "map/Map";

	}
}
