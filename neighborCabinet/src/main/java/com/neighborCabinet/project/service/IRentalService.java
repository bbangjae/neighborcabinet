package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.PlaceInfoVO;
import com.neighborCabinet.project.model.rentalregVO;
import org.springframework.stereotype.Service;

public interface IRentalService {

    int rentalreg(PlaceInfoVO PlaceInfo);
}
