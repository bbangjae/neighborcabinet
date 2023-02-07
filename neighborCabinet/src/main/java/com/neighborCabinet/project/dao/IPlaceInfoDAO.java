package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewVO;
import org.json.JSONObject;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.ArrayList;
import java.util.HashMap;

public interface IPlaceInfoDAO {
    public PlaceInfoVO detailViewPlace(String pNo);

    public ArrayList<QaVO> showViewQA(String pNo);

    public void insertQa(QaVO vo);

    public ArrayList<ReviewVO> showViewReview(String pNo);

    public void reserve(ReserveVo vo);

    public HashMap<String, Object> showDate(HashMap<String, Object> map);

    public void updateDate(HashMap<String, Object> map);

    public HashMap<String, Object> showBoxtype(String pNo);
}
