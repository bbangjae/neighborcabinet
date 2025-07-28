package com.neighborCabinet.project.model;

// 박스 주문했을 때 주문 정보 모음
public class OrderListVO_y {
	private String ordNo;
	private String shipName;
	private String shipAddress1;
	private String shipAddress2;
	private String shipPhone;
	private String shipHope;
	private String userId;
	private String boxType;
	private int ordStatus;
	private int boxQty;
	private int selPrice;
	private int totalPrice;
	
	public String getOrdNo() {
		return ordNo;
	}
	public void setOrdNo(String ordNo) {
		this.ordNo = ordNo;
	}
	public String getShipName() {
		return shipName;
	}
	public void setShipName(String shipName) {
		this.shipName = shipName;
	}
	public String getShipAddress1() {
		return shipAddress1;
	}
	public void setShipAddress1(String shipAddress1) {
		this.shipAddress1 = shipAddress1;
	}
	public String getShipAddress2() {
		return shipAddress2;
	}
	public void setShipAddress2(String shipAddress2) {
		this.shipAddress2 = shipAddress2;
	}
	public String getShipPhone() {
		return shipPhone;
	}
	public void setShipPhone(String shipPhone) {
		this.shipPhone = shipPhone;
	}
	public String getShipHope() {
		return shipHope;
	}
	public void setShipHope(String shipHope) {
		this.shipHope = shipHope;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getBoxType() {
		return boxType;
	}
	public void setBoxType(String boxType) {
		this.boxType = boxType;
	}
	public int getOrdStatus() {
		return ordStatus;
	}
	public void setOrdStatus(int ordStatus) {
		this.ordStatus = ordStatus;
	}
	public int getBoxQty() {
		return boxQty;
	}
	public void setBoxQty(int boxQty) {
		this.boxQty = boxQty;
	}
	public int getSelPrice() {
		return selPrice;
	}
	public void setSelPrice(int selPrice) {
		this.selPrice = selPrice;
	}
	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	
}
