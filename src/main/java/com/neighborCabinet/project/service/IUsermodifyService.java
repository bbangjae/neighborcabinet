package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.UsermodifyVO;

public interface IUsermodifyService {
	
	public UsermodifyVO memberGetDetail(String userId) throws Exception;
	
	// 회원정보 수정
	public int memberModify(UsermodifyVO Member) throws Exception;
	
	// 회원정보 삭제
	public int memberDelete(String userId);

}
  