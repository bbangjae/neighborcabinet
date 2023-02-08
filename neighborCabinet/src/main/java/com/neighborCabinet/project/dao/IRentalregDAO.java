package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.*;

import java.util.ArrayList;

public interface IRentalregDAO {

    int rentalreg(PlaceInfoVO PlaceInfo) throws Exception;

    public ArrayList<BoxVO> boxreg(String userId);

}
