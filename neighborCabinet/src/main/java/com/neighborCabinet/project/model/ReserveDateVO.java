package com.neighborCabinet.project.model;

import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;

public class ReserveDateVO {
    int dNo;
    String pNo;
    String reserveDate;
    String hour0;

    public int getdNo() {
        return dNo;
    }

    public void setdNo(int dNo) {
        this.dNo = dNo;
    }

    public String getpNo() {
        return pNo;
    }

    public void setpNo(String pNo) {
        this.pNo = pNo;
    }

    public String getReserveDate() {
        return reserveDate;
    }

    public void setReserveDate(String reserveDate) {
        this.reserveDate = reserveDate;
    }

    public String getHour0() {
        return hour0;
    }

    public void setHour0(String hour0) {
        this.hour0 = hour0;
    }

}
