package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IRentalregDAO;
import com.neighborCabinet.project.model.BoxVO;
import com.neighborCabinet.project.model.BoxpVO;
import com.neighborCabinet.project.model.PlaceInfoVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.ArrayList;

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
    public int boxPreg(BoxpVO Box) {
        return reg.boxPreg(Box);
    }


/*
    @Override
    public int rentalreg(rentalregVO vo)  {
        return reg.rentalreg(vo);
    }
*/
}
