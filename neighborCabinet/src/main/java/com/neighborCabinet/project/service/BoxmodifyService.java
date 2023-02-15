package com.neighborCabinet.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IBoxmodifyDAO;
import com.neighborCabinet.project.model.BoxmodifyVO;

@Service @Primary
public class BoxmodifyService implements IBoxmodifyService{
	@Autowired
	IBoxmodifyDAO dao;
	
	@Override
	public BoxmodifyVO boxStock(String userId) throws Exception{
		return dao.boxStock(userId);
	}
	
	@Override
	public int boxModify(BoxmodifyVO boxmodify)throws Exception{
		return dao.boxModify(boxmodify);
	}


}
