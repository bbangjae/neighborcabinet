package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IPlaceInfoDAO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class PlaceInfoService implements IPlaceInfoService {
    @Autowired
    @Qualifier("IPlaceInfoDAO")
    private IPlaceInfoDAO dao;
    @Override
    public PlaceInfoVO detailViewPlace(String pNo) {
        return dao.detailViewPlace(pNo);
    }
}
