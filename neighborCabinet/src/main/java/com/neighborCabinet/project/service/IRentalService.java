package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.BoxVO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.boxtypeVO;

import java.util.ArrayList;

public interface IRentalService {

    int rentalreg(PlaceInfoVO PlaceInfo) throws Exception;
    public ArrayList<BoxVO> boxreg(String userId);
    int boxPreg(boxtypeVO boxtype);

    int boxDate(boxtypeVO boxtype);


}
