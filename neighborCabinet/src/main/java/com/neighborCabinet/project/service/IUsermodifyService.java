package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.UsermodifyVO;

public interface IUsermodifyService {
	
		public UsermodifyVO viewMember(String userId);
	
		// 게시물 수정
		public void updateInfo(UsermodifyVO vo);
		
		// 게시물 삭제
		public void deleteInfo(UsermodifyVO vo);

}
