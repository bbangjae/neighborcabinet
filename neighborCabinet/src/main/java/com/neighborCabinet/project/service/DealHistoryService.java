package com.neighborCabinet.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IDealHistoryDAO;
import com.neighborCabinet.project.model.DealHistoryVO;

@Service
public class DealHistoryService implements IDealHistoryService {
	@Autowired
	IDealHistoryDAO dao;

	@Override
	public ArrayList<DealHistoryVO> listAllDeal() {
		return dao.listAllDeal();
	}

}
