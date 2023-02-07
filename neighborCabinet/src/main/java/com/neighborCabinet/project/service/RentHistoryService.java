package com.neighborCabinet.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IRentHistoryDAO;
import com.neighborCabinet.project.model.RentHistoryVO;

@Service
public class RentHistoryService implements IRentHistoryService {
	@Autowired
	IRentHistoryDAO dao;

	@Override
	public ArrayList<RentHistoryVO> listAllHistory(RentHistoryVO searchVO) {
		return dao.listAllHistory(searchVO);
	}

}
