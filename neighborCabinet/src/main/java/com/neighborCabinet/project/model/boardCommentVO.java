package com.neighborCabinet.project.model;

public class boardCommentVO {

    private int cNo;
    private int boNo;
    private  String cContent;
    private String cWriter;
    private String cTime;

    public int getcNo() {
        return cNo;
    }

    public void setcNo(int cNo) {
        this.cNo = cNo;
    }

    public int getBoNo() {
        return boNo;
    }

    public void setBoNo(int boNo) {
        this.boNo = boNo;
    }

    public String getcContent() {
        return cContent;
    }

    public void setcContent(String cContent) {
        this.cContent = cContent;
    }

    public String getcWriter() {
        return cWriter;
    }

    public void setcWriter(String cWriter) {
        this.cWriter = cWriter;
    }

    public String getcTime() {
        return cTime;
    }

    public void setcTime(String cTime) {
        this.cTime = cTime;
    }
}
