package com.neighborCabinet.project.dao;

import java.util.ArrayList;

import com.neighborCabinet.project.model.LDealHistoryVO;

public interface ILDealHistoryDAO {
	public ArrayList<LDealHistoryVO> LlistAllDeal(String userId);
}
