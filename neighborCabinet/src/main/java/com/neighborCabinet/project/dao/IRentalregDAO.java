package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.*;

import java.util.ArrayList;
import java.util.List;

public interface IRentalregDAO {

    int rentalreg(PlaceInfoVO PlaceInfo) throws Exception;

    public ArrayList<BoxVO> boxreg(String userId);
    int boxPreg(boxtypeVO boxtype);

    int boxDate(boxtypeVO boxtype);

    List<PlaceInfoVO> placeList(String sid) ;

    public void placemodi(PlaceInfoVO placeInfoVO);

    public int placedelete(String sid);

    public void deleteboxtype(int pNo);

    public void deleteplace(int pNo);

    public void deletereserveDate(int pNo);



}
