package com.neighborCabinet.project.dao;

import java.util.ArrayList;

import com.neighborCabinet.project.model.RentHistoryVO;

public interface IRentHistoryDAO {
	public ArrayList<RentHistoryVO> listBeforeHistory();
	public ArrayList<RentHistoryVO> listCurrentHistory();
	public ArrayList<RentHistoryVO> listAllHistory();
	
//	닉네임 조회 메서드 추가
	
}
