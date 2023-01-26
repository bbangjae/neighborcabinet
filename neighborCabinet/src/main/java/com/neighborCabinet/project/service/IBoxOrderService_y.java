package com.neighborCabinet.project.service;

import java.util.ArrayList;

import com.neighborCabinet.project.model.BoxInfoVO_y;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.OrderListVO_y;
import com.neighborCabinet.project.model.Reserve_VO;
import com.neighborCabinet.project.model.ShippingVO_y;

public interface IBoxOrderService_y {
	public ArrayList<BoxInfoVO_y> type_AList();
	public ArrayList<BoxInfoVO_y> type_BList();
	public ShippingVO_y shippingInfo(String userId);
	public void insert_OrdList(OrderListVO_y vo);
	public void insert_OrdDetail(OrderListVO_y vo);
	public MemberVO reserInfo(String userId);
	public MemberVO regIdInfo(String userId); // 여기 바꿔야돼
	public void insert_reserve(Reserve_VO vo);
}
