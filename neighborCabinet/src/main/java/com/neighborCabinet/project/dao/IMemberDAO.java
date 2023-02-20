package com.neighborCabinet.project.dao;

import com.neighborCabinet.project.model.MemberVO;

public interface IMemberDAO {

    public String loginCheck(String id);
    public void insertMember(MemberVO vo);
    public String userIdCheck(String userId);// 아이디 중복 확인
    public String getNickName(String userId);

    public String findid(String name, String email);




}
