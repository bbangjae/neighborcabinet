package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IRentalregDAO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.rentalregVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

@Service
public class RentalregService implements IRentalService {

    @Autowired
    @Qualifier("IRentalregDAO")
    IRentalregDAO reg;

    @Override
    public int rentalreg(PlaceInfoVO PlaceInfo) {
        return reg.rentalreg(PlaceInfo);
    }

/*
    @Override
    public int rentalreg(rentalregVO vo)  {
        return reg.rentalreg(vo);
    }
*/
}
