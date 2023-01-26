package com.neighborCabinet.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class DealHistoryVO {
	private int dealNo;
	private String dealPlace;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date receiptDate;
	private String userName;
	private String dealStart;
	private String dealEnd;
	private String dealObject;
	private String pickup;
	
	public String getDealObject() {
		return dealObject;
	}
	public void setDealObject(String dealObject) {
		this.dealObject = dealObject;
	}
	public String getDealStart() {
		return dealStart;
	}
	public void setDealStart(String dealStart) {
		this.dealStart = dealStart;
	}
	public String getDealEnd() {
		return dealEnd;
	}
	public void setDealEnd(String dealEnd) {
		this.dealEnd = dealEnd;
	}
	private String dealState;

	public int getDealNo() {
		return dealNo;
	}
	public void setDealNo(int dealNo) {
		this.dealNo = dealNo;
	}
	public String getDealPlace() {
		return dealPlace;
	}
	public void setDealPlace(String dealPlace) {
		this.dealPlace = dealPlace;
	}
	public Date getReceiptDate() {
		return receiptDate;
	}
	public void setReceiptDate(Date receiptDate) {
		this.receiptDate = receiptDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getDealState() {
		return dealState;
	}
	public void setDealState(String dealState) {
		this.dealState = dealState;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	
	
}
