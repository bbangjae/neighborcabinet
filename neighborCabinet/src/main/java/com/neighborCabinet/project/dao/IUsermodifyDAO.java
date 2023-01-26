package com.neighborCabinet.project.dao;

import org.apache.ibatis.annotations.Mapper;

import com.neighborCabinet.project.model.UsermodifyVO;

@Mapper
public interface IUsermodifyDAO {
	
	public UsermodifyVO viewMember(String userId);
	
	// 게시물 수정
	public static void updateInfo(UsermodifyVO vo) {
		// TODO Auto-generated method stub
		
	}
	
	// 게시물 삭제
	public void deleteInfo(UsermodifyVO vo);

}
