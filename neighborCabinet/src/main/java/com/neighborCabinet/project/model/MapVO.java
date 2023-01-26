package com.neighborCabinet.project.model;

import java.util.Date;

import org.springframework.format.annotation.DateTimeFormat;

public class MapVO {
	private int postNo;
	private String postImage;
	private String userName;
	private String mapPlace;
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date mapDate;
	private String mapTitle;
	private String boxType;
	private String boxQty;
	private String pickup;
	public int getPostNo() {
		return postNo;
	}
	public void setPostNo(int postNo) {
		this.postNo = postNo;
	}
	public String getPostImage() {
		return postImage;
	}
	public void setPostImage(String postImage) {
		this.postImage = postImage;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getMapPlace() {
		return mapPlace;
	}
	public void setMapPlace(String mapPlace) {
		this.mapPlace = mapPlace;
	}
	public Date getMapDate() {
		return mapDate;
	}
	public void setMapDate(Date mapDate) {
		this.mapDate = mapDate;
	}
	public String getMapTitle() {
		return mapTitle;
	}
	public void setMapTitle(String mapTitle) {
		this.mapTitle = mapTitle;
	}
	public String getBoxType() {
		return boxType;
	}
	public void setBoxType(String boxType) {
		this.boxType = boxType;
	}
	public String getBoxQty() {
		return boxQty;
	}
	public void setBoxQty(String boxQty) {
		this.boxQty = boxQty;
	}
	public String getPickup() {
		return pickup;
	}
	public void setPickup(String pickup) {
		this.pickup = pickup;
	}
	
	
}
