package com.neighborCabinet.project.dao;

import java.util.ArrayList;

import com.neighborCabinet.project.model.MapVO;
import com.neighborCabinet.project.model.PlaceInfoVO;

public interface IMapDAO {
	//지도 정보 전체 조회
	public ArrayList<MapVO> listAllMap();
}
