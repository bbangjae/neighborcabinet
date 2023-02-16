package com.neighborCabinet.project.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IBoxOrderDAO_y;
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

@Service
public class BoxOrderService_y implements IBoxOrderService_y {
	
	@Autowired
	@Qualifier("IBoxOrderDAO_y")
	IBoxOrderDAO_y dao;

	@Override
	public ArrayList<BoxInfoVO_y> type_AList() {
		
		return dao.type_AList();
	}

	@Override
	public ArrayList<BoxInfoVO_y> type_BList() {
		
		return dao.type_BList();
	}

	@Override
	public ShippingVO_y shippingInfo(String userId) {
		
		return dao.shippingInfo(userId);
	}

	@Override
	public void insert_OrdList(OrderListVO_y vo) {
		dao.insert_OrdList(vo);
	}

	@Override
	public void insert_OrdDetail(OrderListVO_y vo) {
		dao.insert_OrdDetail(vo);
	}

	@Override
	public MemberVO senderInfo(String userId) {
		
		return dao.senderInfo(userId);
	}

	@Override
	public PlaceInfoVO placeInfo(int pNo) {
		return dao.placeInfo(pNo);
	}

	@Override
	public ArrayList<ReviewOListVO_y> reviewOList(String userId) {
		
		return dao.reviewOList(userId);
	}

	@Override
	public void reviewReg(HashMap<String, Object> map) {
		dao.reviewReg(map);
		dao.reviewCom(map);
	}

	@Override
	public void insert_res(ReserveVO_y re) {
		dao.insert_res(re);
		
	}

	@Override
	public void insert_resD(ReserveDetailVO_y reD) {
		dao.insert_resD(reD);
		
	}

	@Override
	public ArrayList<MyReviewVO> myReview(String userId, int start) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("start", start);
		
		return dao.myReview(map);
	}

	@Override
	public MemberVO memberInfo(String userId) {
		
		return dao.memberInfo(userId);
	}

	@Override
	public int myreviewCnt(String userId) {
		
		return dao.myreviewCnt(userId);
	}

	@Override
	public void reviewdelete(String userId, int reviewNo) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("reviewNo", reviewNo);
		
		dao.reviewdelete(map);
		
	}

	@Override
	public int reviewCheck(String userId, String resNo) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("resNo", resNo);
		
		return dao.reviewCheck(map);
	}

	@Override
	public ReserveVo reserveInfo(int reserveNo) {
		
		return dao.reserveInfo(reserveNo);
	}

	@Override
	public int reserveCnt(int reserveNo, String userId) {
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		map.put("userId", userId);
		map.put("reserveNo", reserveNo);
		
		return dao.reserveCnt(map);
	}

	@Override
	public int reviewpNo(String resNo) {
		
		return dao.reviewpNo(resNo);
	}


}
