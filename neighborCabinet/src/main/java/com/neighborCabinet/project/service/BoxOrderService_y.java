package com.neighborCabinet.project.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IBoxOrderDAO_y;
import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.OrderListVO_y;
import com.neighborCabinet.project.model.Reserve_VO;
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
	public MemberVO reserInfo(String userId) {
		
		return dao.reserInfo(userId);
	}

	@Override
	public void insert_reserve(Reserve_VO vo) {
		dao.insert_reserve(vo);
		
	}

	


}
