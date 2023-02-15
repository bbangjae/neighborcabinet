package com.neighborCabinet.project.model;

import java.lang.ref.SoftReference;
import java.util.Date;

public class NboardVO {

    private int boNo;
    private String boTitle;
    private String boContent;
    private String boWriter;
    private String boTime;
    private String boCategory;

    public int getBoNo() {
        return boNo;
    }

    public void setBoNo(int boNo) {
        this.boNo = boNo;
    }

    public String getBoTitle() {
        return boTitle;
    }

    public void setBoTitle(String boTitle) {
        this.boTitle = boTitle;
    }

    public String getBoContent() {
        return boContent;
    }

    public void setBoContent(String boContent) {
        this.boContent = boContent;
    }

    public String getBoWriter() {
        return boWriter;
    }

    public void setBoWriter(String boWriter) {
        this.boWriter = boWriter;
    }

    public String getBoTime() {
        return boTime;
    }

    public void setBoTime(String boTime) {
        this.boTime = boTime;
    }

    public String getBoCategory() {
        return boCategory;
    }

    public void setBoCategory(String boCategory) {
        this.boCategory = boCategory;
    }
}
