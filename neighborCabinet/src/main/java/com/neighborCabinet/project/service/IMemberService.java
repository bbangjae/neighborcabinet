package com.neighborCabinet.project.service;

import com.neighborCabinet.project.model.MemberVO;

import java.util.HashMap;


public interface IMemberService {
    public String loginCheck(HashMap<String, Object> map);
    public void insertMember(MemberVO vo);
    public String userIdCheck(String userId);// 아이디 중복 확인

}
