package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IPlaceInfoDAO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReserveVo;
import com.neighborCabinet.project.model.ReviewVO;
import org.json.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.HashMap;

@Service
public class PlaceInfoService implements IPlaceInfoService {
    @Autowired
    @Qualifier("IPlaceInfoDAO")
    private IPlaceInfoDAO dao;
    @Override
    public PlaceInfoVO detailViewPlace(String pNo) {
        return dao.detailViewPlace(pNo);
    }

    @Override
    public ArrayList<QaVO> showViewQA(String pNo){return dao.showViewQA(pNo);}

    @Override
    public void insertQa(QaVO vo){dao.insertQa(vo);}
    @Override
    public ArrayList<ReviewVO> showViewReview(String pNo){return dao.showViewReview(pNo);}
    @Override
    public void reserve(ReserveVo vo){dao.reserve(vo);}
    @Override
    public HashMap<String,Object> showDate(HashMap<String,Object> map){return dao.showDate(map);}
    @Override
    public void updateDate (HashMap<String,Object> map){dao.updateDate(map);}
    @Override
    public HashMap<String, Object> showBoxtype(String pNo) {return dao.showBoxtype(pNo);}
}
