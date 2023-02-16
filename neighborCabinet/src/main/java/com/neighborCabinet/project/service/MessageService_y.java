package com.neighborCabinet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IMessageDAO_y;
import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.messageAllVO_y;

@Service
public class MessageService_y implements IMessageService_y {
	
	@Autowired
	@Qualifier("IMessageDAO_y")
	IMessageDAO_y dao;
	
	@Override
	public ArrayList<ReserveVO_y> resInfo(String userId) {
		
		return dao.resInfo(userId);
	}

	@Override
	public ReserveDetailVO_y requestInfo(String resNo, String userId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resNo", resNo);
		map.put("userId", userId);
		return dao.requestInfo(map);
	}

	@Override
	public void requestO(String resNo, String messageId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resNo", resNo);
		map.put("messageId", messageId);
		
		dao.requestO(map);
		dao.requestOMessage(map);
		
	}

	@Override
	public void requestX(String resNo, String messageId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resNo", resNo);
		map.put("messageId", messageId);
		dao.requestX2(map);
		dao.requestX(map);
		dao.requestXMessage(map);
		
	}

	@Override
	public ArrayList<messageAllVO_y> messageAll(String userId) {
		
		return dao.messageAll(userId);
	}

	@Override
	public int resCheck(String resNo, String userId) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("resNo", resNo);
		map.put("userId", userId);
		return dao.resCheck(map);
	}

}
