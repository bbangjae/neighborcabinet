package com.neighborCabinet.project.model;

import java.io.UnsupportedEncodingException;

import java.net.URLEncoder;

public class PageVO {

	private int pageIndex = 1; //현재 페이지
	private int pageUnit = 10; //페이지 개수
	private int pageSize = 10; //페이지 사이즈
	private int firstIndex = 1;
	private int recordCountPerPage = 10;
	private int totCnt = 0; //총 개수
	private int startDate = 0; //시작 데이터
	private int endDate = 0; //종료 데이터
	private boolean prev, next; //이전, 다음 버튼
	private int realEnd = 0; //페이징 마지막 숫자
	
	//콘솔에 떠서 추가한 부분
	/*
	 * private String searchKeyword; public String getSearchKeyword() { return
	 * searchKeyword; } public void setSearchKeyword(String searchKeyword) {
	 * this.searchKeyword = searchKeyword; }
	 */
	
	
	public int getPageIndex() {
		return pageIndex;
	}
	public void setPageIndex(int pageIndex) {
		this.pageIndex = pageIndex;
	}
	public int getPageUnit() {
		return pageUnit;
	}
	public void setPageUnit(int pageUnit) {
		this.pageUnit = pageUnit;
	}
	public int getPageSize() {
		return pageSize;
	}
	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	public int getFirstIndex() {
		return firstIndex;
	}
	public void setFirstIndex(int firstIndex) {
		this.firstIndex = firstIndex;
	}
	public int getRecordCountPerPage() {
		return recordCountPerPage;
	}
	public void setRecordCountPerPage(int recordCountPerPage) {
		this.recordCountPerPage = recordCountPerPage;
	}
	public int getTotCnt() {
		return totCnt;
	}
	public void setTotCnt(int totCnt) {
		this.totCnt = totCnt;
	}
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	public int getEndDate() {
		return endDate;
	}
	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}
	public boolean isPrev() {
		return prev;
	}
	public void setPrev(boolean prev) {
		this.prev = prev;
	}
	public boolean isNext() {
		return next;
	}
	public void setNext(boolean next) {
		this.next = next;
	}
	public int getRealEnd() {
		return realEnd;
	}
	public void setRealEnd(int realEnd) {
		this.realEnd = realEnd;
	}
	
	
}
