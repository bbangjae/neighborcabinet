package com.neighborCabinet.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IUsermodifyDAO;
import com.neighborCabinet.project.model.UsermodifyVO;

@Service
public class UsermodifyService implements IUsermodifyService{
	@Autowired
	@Qualifier("IUsermodifyDAO")
	IUsermodifyDAO dao;

	public UsermodifyVO viewMember(String userId){
		return dao.viewMember(userId);
	}
	
	@Override
	public void deleteInfo(UsermodifyVO vo){
		dao.deleteInfo(vo);
		
	}

	@Override
	public void updateInfo(UsermodifyVO vo) {
		// TODO Auto-generated method stub
		
	}

}
