package com.neighborCabinet.project.model;

public class MapVO {
	private int pNo;
	private String pWriteTitle;
	private String pWriteSub;
	private String pPlaceTitle;
	private String pPlaceInfo;
	private String pBoxInfo;
	private String pCautionInfo;
	private String pAddress1;
	private String pImage;
	private String pTime;
	/*
	 * @DateTimeFormat(pattern = "yyyy-MM-dd") private Date mapDate;
	 */
	/* private String pickup; */
	public int getpNo() {
		return pNo;
	}
	public void setpNo(int pNo) {
		this.pNo = pNo;
	}
	public String getpWriteTitle() {
		return pWriteTitle;
	}
	public void setpWriteTitle(String pWriteTitle) {
		this.pWriteTitle = pWriteTitle;
	}
	public String getpWriteSub() {
		return pWriteSub;
	}
	public void setpWriteSub(String pWriteSub) {
		this.pWriteSub = pWriteSub;
	}


	public String getpPlaceTitle() {
		return pPlaceTitle;
	}
	public void setpPlaceTitle(String pPlaceTitle) {
		this.pPlaceTitle = pPlaceTitle;
	}
	public String getpPlaceInfo() {
		return pPlaceInfo;
	}
	public void setpPlaceInfo(String pPlaceInfo) {
		this.pPlaceInfo = pPlaceInfo;
	}
	public String getpBoxInfo() {
		return pBoxInfo;
	}
	public void setpBoxInfo(String pBoxInfo) {
		this.pBoxInfo = pBoxInfo;
	}
	public String getpCautionInfo() {
		return pCautionInfo;
	}
	public void setpCautionInfo(String pCautionInfo) {
		this.pCautionInfo = pCautionInfo;
	}

	public String getpAddress1() {
		return pAddress1;
	}

	public void setpAddress1(String pAddress1) {
		this.pAddress1 = pAddress1;
	}

	public String getpImage() {
		return pImage;
	}
	public void setpImage(String pImage) {
		this.pImage = pImage;
	}

	public String getpTime() {
		return pTime;
	}

	public void setpTime(String pTime) {
		this.pTime = pTime;
	}
}
