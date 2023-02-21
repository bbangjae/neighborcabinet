package com.neighborCabinet.project.model;

public class RentHistoryVO extends PageVO{
	private int reserveNo;
	private String userId;
	private int pNo;
	private String pAddress1;
	private String reserveDate;
	private String senderPhone;
	private String receiver;
	private String sender;
	private String senderName;
	private String startTime;
	private String endTime;
	private int resState;
	private int pickup;
	private String searchKeyword; //검색 변수
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getReceiver() {
		return receiver;
	}
	public void setReceiver(String receiver) {
		this.receiver = receiver;
	}
	public int getPickup() {
		return pickup;
	}
	public void setPickup(int pickup) {
		this.pickup = pickup;
	}
	public int getResState() {
		return resState;
	}
	public void setResState(int resState) {
		this.resState = resState;
	}
	
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	public String getpAddress1() {
		return pAddress1;
	}
	public void setpAddress1(String pAddress1) {
		this.pAddress1 = pAddress1;
	}
	public String getStartTime() {
		return startTime;
	}
	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}
	public String getEndTime() {
		return endTime;
	}
	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	public String getSenderPhone() {
		return senderPhone;
	}
	public void setSenderPhone(String senderPhone) {
		this.senderPhone = senderPhone;
	}
	public String getSender() {
		return sender;
	}
	public void setSender(String sender) {
		this.sender = sender;
	}
	public String getSenderName() {
		return senderName;
	}
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	
	
}
