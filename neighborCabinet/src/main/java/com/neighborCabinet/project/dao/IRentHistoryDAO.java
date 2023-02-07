package com.neighborCabinet.project.dao;

import java.util.ArrayList;

import com.neighborCabinet.project.model.RentHistoryVO;

public interface IRentHistoryDAO {
	/*
	 * public ArrayList<RentHistoryVO> listBeforeHistory(); public
	 * ArrayList<RentHistoryVO> listCurrentHistory();
	 * 코드 변경되어 필요없어진 부분
	 */
	public ArrayList<RentHistoryVO> listAllHistory(RentHistoryVO searchVO);
	
//	닉네임 조회 메서드 추가
	
}
