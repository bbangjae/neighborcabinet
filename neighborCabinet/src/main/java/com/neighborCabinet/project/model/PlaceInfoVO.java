package com.neighborCabinet.project.model;

public class PlaceInfoVO {
    int pNo ; //spaceNo
    String pWriteTitle;
    String pWriteSub; //spaceIntro
    private String pType; //spaceType
    private String pType_d;//spaceType_d
    private String food;//food
    private String pickup;//pickup
    String pPlaceTitle; //spaceName
    String pPlaceInfo; //spaceText
    private String pHp; //spaceHp
    private String pS_Time; // spaceTime
    private String pE_Time;// end
    private String pAddress1; // spaceAddress1
    private String pAddress2; // SpaceAddress2
    String pBoxInfo;
    String pCautionInfo; //spaceCaution
    String pImage;
    String userId;
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

    public String getpPlaceTitle() {
        return pPlaceTitle;
    }

    public void setpPlaceTitle(String pPlaceTitle) {
        this.pPlaceTitle = pPlaceTitle;
    }

    public String getpWriteSub() {
        return pWriteSub;
    }

    public void setpWriteSub(String pWriteSub) {
        this.pWriteSub = pWriteSub;
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

    public String getpType() {
        return pType;
    }

    public void setpType(String pType) {
        this.pType = pType;
    }

    public String getpType_d() {
        return pType_d;
    }

    public void setpType_d(String pType_d) {
        this.pType_d = pType_d;
    }

    public String getFood() {
        return food;
    }

    public void setFood(String food) {
        this.food = food;
    }

    public String getPickup() {
        return pickup;
    }

    public void setPickup(String pickup) {
        this.pickup = pickup;
    }

    public String getpHp() {
        return pHp;
    }

    public void setpHp(String pHp) {
        this.pHp = pHp;
    }

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

    public String getpImage() {
        return pImage;
    }

    public void setpImage(String pImage) {
        this.pImage = pImage;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getpS_Time() {
        return pS_Time;
    }

    public void setpS_Time(String pS_Time) {
        this.pS_Time = pS_Time;
    }

    public String getpE_Time() {
        return pE_Time;
    }

    public void setpE_Time(String pE_Time) {
        this.pE_Time = pE_Time;
    }
}
