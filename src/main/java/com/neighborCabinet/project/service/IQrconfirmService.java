package com.neighborCabinet.project.service;

import java.util.HashMap;

import com.neighborCabinet.project.model.RentHistoryVO;

public interface IQrconfirmService {
	
	public int QRconfirm(RentHistoryVO rentVO)throws Exception;	
	
	public int dealFinish(HashMap<String, Object> param)throws Exception;	

}
