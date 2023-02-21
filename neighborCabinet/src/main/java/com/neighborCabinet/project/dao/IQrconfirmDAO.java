package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.RentHistoryVO;

public interface IQrconfirmDAO {
	// QR인증
   public int QRconfirm(RentHistoryVO rentVO);

}
