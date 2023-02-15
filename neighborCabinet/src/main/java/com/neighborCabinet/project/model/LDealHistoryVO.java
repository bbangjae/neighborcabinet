package com.neighborCabinet.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class LDealHistoryVO {
	private int ldealNo;
	private String userHP;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date lreceiptDate;
	private String userName;
	private String ldealStart;
	private String ldealEnd;
	private String ldealObject;
	private String lpickUp;
	public int getLdealNo() {
		return ldealNo;
	}
	public void setLdealNo(int ldealNo) {
		this.ldealNo = ldealNo;
	}
	public String getUserHP() {
		return userHP;
	}
	public void setUserHP(String userHP) {
		this.userHP = userHP;
	}
	public Date getLreceiptDate() {
		return lreceiptDate;
	}
	public void setLreceiptDate(Date lreceiptDate) {
		this.lreceiptDate = lreceiptDate;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLdealStart() {
		return ldealStart;
	}
	public void setLdealStart(String ldealStart) {
		this.ldealStart = ldealStart;
	}
	public String getLdealEnd() {
		return ldealEnd;
	}
	public void setLdealEnd(String ldealEnd) {
		this.ldealEnd = ldealEnd;
	}
	public String getLdealObject() {
		return ldealObject;
	}
	public void setLdealObject(String ldealObject) {
		this.ldealObject = ldealObject;
	}
	public String getLpickUp() {
		return lpickUp;
	}
	public void setLpickUp(String lpickUp) {
		this.lpickUp = lpickUp;
	}
	
	
	
	
}
