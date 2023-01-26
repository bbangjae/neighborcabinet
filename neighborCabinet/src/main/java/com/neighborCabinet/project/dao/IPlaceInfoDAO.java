package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReviewVO;

import java.util.ArrayList;

public interface IPlaceInfoDAO {
    public PlaceInfoVO detailViewPlace(String pNo) ;
    public ArrayList<QaVO> showViewQA(String pNo);
    public ArrayList<ReviewVO> showViewReview(String pNo);
}
