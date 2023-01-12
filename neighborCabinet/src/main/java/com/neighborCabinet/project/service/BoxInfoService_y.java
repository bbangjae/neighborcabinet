package com.neighborCabinet.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IBoxInfoDAO_y;
import com.neighborCabinet.project.model.BoxInfoVO_y;

@Service
public class BoxInfoService_y implements IBoxInfoService_y {
	
	@Autowired
	@Qualifier("IBoxInfoDAO_y")
	IBoxInfoDAO_y dao;

	@Override
	public ArrayList<BoxInfoVO_y> type_AList() {
		// TODO Auto-generated method stub
		return dao.type_AList();
	}

	@Override
	public ArrayList<BoxInfoVO_y> type_BList() {
		// TODO Auto-generated method stub
		return dao.type_BList();
	}
	
	

}
