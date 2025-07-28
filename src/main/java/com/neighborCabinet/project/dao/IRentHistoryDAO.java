package com.neighborCabinet.project.dao;

import java.util.ArrayList;
import java.util.Map;

import com.neighborCabinet.project.model.PageVO;
import com.neighborCabinet.project.model.RentHistoryVO;

public interface IRentHistoryDAO {
	/*
	 * public ArrayList<RentHistoryVO> listBeforeHistory();
	 * public ArrayList<RentHistoryVO> listCurrentHistory();
	 * 코드 변경되어 필요없어진 부분
	 */
	public ArrayList<RentHistoryVO> listAllHistory(RentHistoryVO searchVO);
	public int getListCnt(RentHistoryVO searchVO);
	public Map<String, Object> listAllHistory(PageVO searchVO);
	
	
}
