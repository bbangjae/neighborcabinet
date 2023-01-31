package com.neighborCabinet.project.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Primary;
import org.springframework.stereotype.Service;

import com.neighborCabinet.project.dao.IUsermodifyDAO;
import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.UsermodifyVO;

@Service @Primary
public class UsermodifyService implements IUsermodifyService{
	@Autowired
	IUsermodifyDAO dao;

	@Override
	public UsermodifyVO memberGetDetail(String userId) throws Exception {
		return dao.memberGetDetail(userId);
	}
	
	@Override
	public int memberDelete(String userId){
		return dao.memberDelete(userId);
		
	}

	@Override
	public int memberModify(UsermodifyVO member) throws Exception {
		return dao.memberModify(member);
	}

}
