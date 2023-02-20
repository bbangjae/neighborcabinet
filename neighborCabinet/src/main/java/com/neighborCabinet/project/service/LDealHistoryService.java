package com.neighborCabinet.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.ILDealHistoryDAO;
import com.neighborCabinet.project.model.LDealHistoryVO;

@Service
public class LDealHistoryService implements ILDealHistoryService {
	@Autowired
	ILDealHistoryDAO dao;
				
	@Override
	public ArrayList<LDealHistoryVO> LlistAllDeal(String userId) {
		return dao.LlistAllDeal(userId);
	}

}
