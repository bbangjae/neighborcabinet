package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.BoxmodifyVO;

public interface IBoxmodifyService {
	
	public BoxmodifyVO boxStock(String userId) throws Exception;
	
	public int boxModify(BoxmodifyVO boxmodify)throws Exception;
}
