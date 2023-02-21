package com.neighborCabinet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.MyReviewVO;
import com.neighborCabinet.project.model.OrderListVO_y;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.ReserveDetailVO_y;
import com.neighborCabinet.project.model.ReserveVO_y;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewOListVO_y;
import com.neighborCabinet.project.model.ShippingVO_y;

public interface IBoxOrderService_y {
	public ArrayList<BoxInfoVO_y> type_AList();
	public ArrayList<BoxInfoVO_y> type_BList();
	public ShippingVO_y shippingInfo(String userId);
	public void insert_OrdList(OrderListVO_y vo);
	public void insert_OrdDetail(OrderListVO_y vo);
	
	// 예약 결제 페이지
	public int reserveCnt(int reserveNo, String userId);
	public ReserveVO_y reserveInfo(int reserveNo); // 예약 정보 가져오기
	public String imgSrc(int pNo);
	public MemberVO senderInfo(String userId);
	public PlaceInfoVO placeInfo(int pNo);
	
	// 예약 결제 페이지(결제)
	public void insert_res(ReserveVO_y re);
	public void insert_resD(ReserveDetailVO_y reD);
	
	// 리뷰
	public MemberVO memberInfo(String userId); // 유저 정보
	public ArrayList<ReviewOListVO_y> reviewOList(String userId); //대여 완료 불러오기
	public ArrayList<MyReviewVO> myReview(String userId, int start); // 내 리뷰보기
	public int reviewCheck(String userId, int reserveNo);
	public void reviewReg(HashMap<String, Object> map); //리뷰 등록
	public void reviewdelete(String userId, int reviewNo); // 리뷰 삭제
	public int reviewpNo(int reserveNo); // reserve에서 pNo 값 가져오기
	
	//리뷰 페이징 카운트
	public int myreviewCnt(String userId);
}
