package com.neighborCabinet.project.service;

import java.util.ArrayList;
import java.util.Map;

import com.neighborCabinet.project.model.PageVO;
import com.neighborCabinet.project.model.RentHistoryVO;

public interface IRentHistoryService {
	public ArrayList<RentHistoryVO> listAllHistory(RentHistoryVO searchVO);
	public int getListCnt(RentHistoryVO searchVO);
	public Map<String, Object> listAllHistory(PageVO searchVO);
}
