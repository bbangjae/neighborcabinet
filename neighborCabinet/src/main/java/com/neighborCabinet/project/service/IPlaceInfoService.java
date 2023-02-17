package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewVO;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPlaceInfoService {
    public PlaceInfoVO detailViewPlace(int pNo);

    public ArrayList<QaVO> showViewQA(int pNo);

    public void insertQa(QaVO vo);

    public ArrayList<ReviewVO> showViewReview(int pNo);

    public int reserve(ReserveVo vo);

    public HashMap<String, Object> showDate(HashMap<String, Object> map);

    public void updateDate(HashMap<String, Object> map);

    public HashMap<String, Object> showBoxtype(int pNo);
    public int imgCount(int pNo) ;
    public void qaDelete(int qaNo);
    public void qaUpdate(HashMap<String, Object> map);

}
