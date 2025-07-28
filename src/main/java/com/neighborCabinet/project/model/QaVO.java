package com.neighborCabinet.project.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class QaVO {
    int qaNo;
    String qaContent;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date qaDate;
    String userId;
    String pNo;
    String userNickName;

    public String getQaContent() {
        return qaContent;
    }

    public void setQaContent(String qaContent) {
        this.qaContent = qaContent;
    }

    public Date getQaDate() {
        return qaDate;
    }

    public void setQaDate(Date qaDate) {
        this.qaDate = qaDate;
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

    public int getQaNo() {
        return qaNo;
    }

    public void setQaNo(int qaNo) {
        this.qaNo = qaNo;
    }

    public String getUserNickName() {
        return userNickName;
    }

    public void setUserNickName(String userNickName) {
        this.userNickName = userNickName;
    }
}

