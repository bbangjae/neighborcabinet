package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewVO;
import org.json.JSONObject;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPlaceInfoService {
    PlaceInfoVO detailViewPlace(String pNo);
    ArrayList<QaVO> showViewQA(String pNo);
    void insertQa(QaVO vo);
    ArrayList<ReviewVO> showViewReview(String pNo);
    void reserve(ReserveVo vo);
    HashMap<String,Object> showDate(HashMap<String,Object> map);
    void updateDate (HashMap<String,Object> map);
    HashMap<String,Object> showBoxtype(String pNo);

}
