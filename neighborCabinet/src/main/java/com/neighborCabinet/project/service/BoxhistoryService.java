package com.neighborCabinet.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IBoxhistoryDAO;
import com.neighborCabinet.project.model.boxHistoryVO;

@Service
public class BoxhistoryService implements IBoxhistoryService{
	@Autowired
	IBoxhistoryDAO dao;
				
	@Override
	public ArrayList<boxHistoryVO> listBoxHistory(String userId) {
		return dao.listBoxHistory(userId);
	}

}
