package com.neighborCabinet.project.service;

import java.util.ArrayList;

import com.neighborCabinet.project.model.RentHistoryVO;

public interface IRentHistoryService {
	public ArrayList<RentHistoryVO> listAllHistory(RentHistoryVO searchVO);
	
//	닉네임 조회 서비스 추가
}
