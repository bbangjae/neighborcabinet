package com.neighborCabinet.project.service;

import java.util.ArrayList;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IRentHistoryDAO;
import com.neighborCabinet.project.model.PageVO;
import com.neighborCabinet.project.model.RentHistoryVO;

@Service
public class RentHistoryService implements IRentHistoryService {
	@Autowired
	IRentHistoryDAO dao;

	@Override
	public ArrayList<RentHistoryVO> listAllHistory(RentHistoryVO searchVO) {
		return dao.listAllHistory(searchVO);
	}
	
	@Override
	public int getListCnt(RentHistoryVO searchVO) {
		return dao.getListCnt(searchVO);
	}

	@Override
	public Map<String, Object> listAllHistory(PageVO searchVO) {
		return dao.listAllHistory(searchVO);
	}

	

}
