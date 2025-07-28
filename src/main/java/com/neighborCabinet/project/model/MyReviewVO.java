package com.neighborCabinet.project.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class MyReviewVO {
    int reviewNo;
    String reviewContent;
    int reviewGrade;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date reviewDate;
    String userId;
    String pNo;
    String userNickName;
    String pAddress1;
    String pAddress2;
    String pWriteTitle;
    
    public String getpAddress1() {
		return pAddress1;
	}

	public void setpAddress1(String pAddress1) {
		this.pAddress1 = pAddress1;
	}

	public String getpAddress2() {
		return pAddress2;
	}

	public void setpAddress2(String pAddress2) {
		this.pAddress2 = pAddress2;
	}

	public String getpWriteTitle() {
		return pWriteTitle;
	}

	public void setpWriteTitle(String pWriteTitle) {
		this.pWriteTitle = pWriteTitle;
	}

    public int getReviewNo() {
        return reviewNo;
    }

    public void setReviewNo(int reviewNo) {
        this.reviewNo = reviewNo;
    }

    public String getReviewContent() {
        return reviewContent;
    }

    public void setReviewContent(String reviewContent) {
        this.reviewContent = reviewContent;
    }

    public int getReviewGrade() {
        return reviewGrade;
    }

    public void setReviewGrade(int reviewGrade) {
        this.reviewGrade = reviewGrade;
    }

    public Date getReviewDate() {
        return reviewDate;
    }

    public void setReviewDate(Date reviewDate) {
        this.reviewDate = reviewDate;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getpNo() {
        return pNo;
    }

    public void setpNo(String pNo) {
        this.pNo = pNo;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }
}

