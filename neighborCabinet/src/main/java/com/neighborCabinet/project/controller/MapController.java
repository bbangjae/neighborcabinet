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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

import com.neighborCabinet.project.model.MapVO;
import com.neighborCabinet.project.service.MapService;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

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
		System.out.println();
		JSONArray mapAddress = new JSONArray();
		for(int i=0;i<listAllMap.size();i++) {
			HashMap<String, Object> map = macService.addToxy(listAllMap.get(i).getpAddress1());
			JSONObject jo = new JSONObject(map);
			jo.put("wT",listAllMap.get(i).getpWriteTitle());
			jo.put("pNo",listAllMap.get(i).getpNo());
			mapAddress.put(jo);
			}

		request.setAttribute("mA",mapAddress);
		model.addAttribute("listAllMap", listAllMap);
		return "map/Map";

	}
	@RequestMapping("/map/SearchForm/{kw}")
	public String mapSearchForm(Model model,
					  @PathVariable int kw,
					  HttpServletRequest request) {
		ArrayList<MapVO> listAllMap = mapService.listAllMap();
		JSONArray mapAddress = new JSONArray();
		for(int i=0;i<listAllMap.size();i++) {
			HashMap<String, Object> map = macService.addToxy(listAllMap.get(i).getpAddress1());
			JSONObject jo = new JSONObject(map);
			jo.put("wT",listAllMap.get(i).getpWriteTitle());
			jo.put("pNo",listAllMap.get(i).getpNo());
			mapAddress.put(jo);
		}
		request.setAttribute("mA",mapAddress);
		model.addAttribute("listAllMap", listAllMap);
		model.addAttribute("kw",kw);
		return "map/MapSearch";
	}
	@RequestMapping("/map/SearchForm2/{kw2}")
	public String mapSearchForm2(Model model,
								@PathVariable String kw2,
								HttpServletRequest request) {
		ArrayList<MapVO> listAllMap = mapService.listAllMap();
		JSONArray mapAddress = new JSONArray();
		for(int i=0;i<listAllMap.size();i++) {
			HashMap<String, Object> map = macService.addToxy(listAllMap.get(i).getpAddress1());
			JSONObject jo = new JSONObject(map);
			jo.put("wT",listAllMap.get(i).getpWriteTitle());
			jo.put("pNo",listAllMap.get(i).getpNo());
			mapAddress.put(jo);
		}

		request.setAttribute("mA",mapAddress);
		model.addAttribute("listAllMap", listAllMap);
		model.addAttribute("kw2", kw2);

		return "map/MapSearch2";
	}
	@ResponseBody
	@RequestMapping("/map/Search")
	public int mapSearch(@RequestParam("searchInput") String searchInput){
		int result;
		result= mapService.searchPlace(searchInput);
		return result;
	}

}
