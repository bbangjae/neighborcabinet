package com.neighborCabinet.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IQrconfirmDAO;
import com.neighborCabinet.project.model.RentHistoryVO;

@Service @Primary
public class QrconfirmService implements IQrconfirmService {
	@Autowired
    IQrconfirmDAO dao;


	@Override
	public int QRconfirm(RentHistoryVO rentVO) throws Exception {
		return dao.QRconfirm(rentVO);
	}

}
