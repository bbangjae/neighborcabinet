package com.neighborCabinet.project.service;

import java.util.ArrayList;

import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.messageAllVO_y;

public interface IMessageService_y {
	public ArrayList<ReserveVO_y> resInfo(String userId); // 알림 온 res정보 가져오기
	public int resCheck(int reserveNo, String userId);
	public ReserveVO_y requestInfo(int reserveNo, String userId); // 예약자 정보 가져오기
	public void requestO(int reserveNo, String messageId); // 요청 수락
	public void requestX(int reserveNo, String messageId); // 요청 거절
	
	public ArrayList<messageAllVO_y> messageAll(String userId); // 자신의 모든 메시지 불러오기
	public int pNoSerch(int reserveNo);
	public void mesDelete(int mesNo);
	public void mesDeleteAll(String userId);
}
