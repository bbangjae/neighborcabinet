package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IRentalregDAO;
import com.neighborCabinet.project.model.BoxVO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.boxtypeVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

@Service
public class RentalregService implements IRentalService {

    @Autowired
    @Qualifier("IRentalregDAO")
    IRentalregDAO reg;

    @Override
    public int rentalreg(PlaceInfoVO PlaceInfo) throws Exception {
        return reg.rentalreg(PlaceInfo);
    }

    @Override
    public ArrayList<BoxVO> boxreg(String userId) {
        return reg.boxreg(userId);
    }
    @Override
    public int boxPreg(boxtypeVO boxtype) {
        return reg.boxPreg(boxtype);
    }

    @Override
    public int boxDate(boxtypeVO boxtype) {
        return reg.boxDate(boxtype);
    }

    @Override
    public List<PlaceInfoVO> placeList(String sid) {
        return reg.placeList(sid);
    }

    @Override
    public void placemodi(PlaceInfoVO placeInfoVO) {
         reg.placemodi(placeInfoVO);
    }

    @Override
    public void placedelete(String sid) {
         reg.placedelete(sid);
    }

    @Override
    public void deleteboxtype(int pNo) {
        reg.deleteboxtype(pNo);

    }

    @Override
    public void deleteplace(int pNo) {
        reg.deleteplace(pNo);

    }


}
