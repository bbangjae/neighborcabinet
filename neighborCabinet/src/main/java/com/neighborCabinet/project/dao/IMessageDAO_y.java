package com.neighborCabinet.project.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.messageAllVO_y;

public interface IMessageDAO_y {
	public ArrayList<ReserveVO_y> resInfo(String userId); // 알림 온 res정보 가져오기
	public int resCheck(HashMap<String, Object> map); // 정보 수정 할 수 있는 사람인지 체크
	public ReserveDetailVO_y requestInfo(HashMap<String, Object> map); // 예약자 정보 가져오기
	public void requestO(int reserveNo); // 요청 수락
	public void requestOMessage(HashMap<String, Object> map); // 요청 수락 메시지
	public void requestX(int reserveNo); // 요청 거절
	public void requestXMessage(HashMap<String, Object> map); // 요청 거절 메시지
	
	public ArrayList<messageAllVO_y> messageAll(String userId); // 자신의 모든 메시지 불러오기
	
}
