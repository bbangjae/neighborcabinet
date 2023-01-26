package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IPlaceInfoDAO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.QaVO;
import com.neighborCabinet.project.model.ReviewVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
    public ArrayList<ReviewVO> showViewReview(String pNo){return dao.showViewReview(pNo);}
}
