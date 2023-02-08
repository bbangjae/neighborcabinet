package com.neighborCabinet.project.model;

public class BoxVO {
    private int BoxNo ;
    private String BoxType ;
    private String BoxQty;
    private String BoxPrice;
    private String userId;


    public int getBoxNo() {
        return BoxNo;
    }

    public void setBoxNo(int boxNo) {
        BoxNo = boxNo;
    }

    public String getBoxType() {
        return BoxType;
    }

    public void setBoxType(String boxType) {
        BoxType = boxType;
    }

    public String getBoxPrice() {
        return BoxPrice;
    }

    public void setBoxPrice(String boxPrice) {
        BoxPrice = boxPrice;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBoxQty() {
        return BoxQty;
    }

    public void setBoxQty(String boxQty) {
        BoxQty = boxQty;
    }

}
