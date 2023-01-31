package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.MemberVO;
import com.neighborCabinet.project.model.UsermodifyVO;

public interface IUsermodifyDAO {
	
	public UsermodifyVO memberGetDetail(String userId);
	
	// 회원정보 수정
	public int memberModify(UsermodifyVO member);
	
	// 회원정보 삭제
	public int memberDelete(String userId);

}
 