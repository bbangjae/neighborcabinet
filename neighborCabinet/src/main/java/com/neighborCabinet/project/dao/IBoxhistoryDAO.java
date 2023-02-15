package com.neighborCabinet.project.dao;

import java.util.ArrayList;

import com.neighborCabinet.project.model.boxHistoryVO;

public interface IBoxhistoryDAO {
	public ArrayList<boxHistoryVO> listBoxHistory(boxHistoryVO boxVO);
}
