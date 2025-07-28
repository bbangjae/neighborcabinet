package com.neighborCabinet.project.dao;

import java.util.HashMap;

import com.neighborCabinet.project.model.RentHistoryVO;

public interface IQrconfirmDAO {
	// QR인증
   public int QRconfirm(RentHistoryVO rentVO);
   
   public int dealFinish(HashMap<String, Object> param);
   

}
