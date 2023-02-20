package com.neighborCabinet.project.service;

import java.util.ArrayList;

import com.neighborCabinet.project.model.MapVO;
import com.neighborCabinet.project.model.PlaceInfoVO;

public interface IMapService {
	public ArrayList<MapVO> listAllMap();
	public int searchPlace(String keyword);
}
