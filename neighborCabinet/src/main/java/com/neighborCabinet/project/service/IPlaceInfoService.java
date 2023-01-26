package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReviewVO;

import java.util.ArrayList;

public interface IPlaceInfoService {
    PlaceInfoVO detailViewPlace(String pNo);
    ArrayList<QaVO> showViewQA(String pNo);
    ArrayList<ReviewVO> showViewReview(String pNo);
}
