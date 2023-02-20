package com.neighborCabinet.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class RentHistoryVO extends PageVO{
	private int reserveNo;
	
	
	public int getReserveNo() {
		return reserveNo;
	}
	public void setReserveNo(int reserveNo) {
		this.reserveNo = reserveNo;
	}
	private String userId;
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	private int pNo;
	
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	private String rentPlace;
	//@DateTimeFormat(pattern = "yyyy-MM-dd")
	private String reserveDate;
	
	
	public String getReserveDate() {
		return reserveDate;
	}
	public void setReserveDate(String reserveDate) {
		this.reserveDate = reserveDate;
	}
	private String userName;
	private String rentTime;
	private String resState;
	private String pickup;
	private String searchKeyword; //검색 변수
	
	public String getSearchKeyword() {
		return searchKeyword;
	}
	public void setSearchKeyword(String searchKeyword) {
		this.searchKeyword = searchKeyword;
	}
	public String getRentPlace() {
		return rentPlace;
	}
	public void setRentPlace(String rentPlace) {
		this.rentPlace = rentPlace;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getRentTime() {
		return rentTime;
	}
	public void setRentTime(String rentTime) {
		this.rentTime = rentTime;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	public String getResState() {
		return resState;
	}
	public void setResState(String resState) {
		this.resState = resState;
	}
}
