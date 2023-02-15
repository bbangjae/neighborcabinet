package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.BoxmodifyVO;

public interface IBoxmodifyDAO {
	public BoxmodifyVO boxStock(String userId);
	
	public int boxModify(BoxmodifyVO boxmodify);
}
