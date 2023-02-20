package com.neighborCabinet.project.service;

import com.neighborCabinet.project.dao.IMemberDAO;
import com.neighborCabinet.project.model.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;

import java.util.HashMap;

@Service
public class MemberService implements IMemberService {
    @Autowired
    @Qualifier("IMemberDAO")
    IMemberDAO dao;

    @Autowired
    private PasswordEncoder passwordEncoder;


    @Override
    public String loginCheck(HashMap<String, Object> map) {
        String encodedPw = dao.loginCheck((String)map.get("id"));

        String result = "fail";
        // 암호화된 비밀번호와 입력해서 전달된 비밀번호와 일치하는지 확인
        if(encodedPw != null && passwordEncoder.matches((String)map.get("pwd"), encodedPw)) {
            result = "success";
        }
        // matches() : 평문과 암호화된 문장 비교
        return result;

    }

    @Override
    public void insertMember(MemberVO vo) {
        // 입력한 비밀번호를 암호화해서 저장
        // vo에서 비밀번호 가져와서 암호화한 후
        String encodedPassword = passwordEncoder.encode(vo.getUserPw());
        // 암호화된 비밀번호로 vo에 저장한 후 vo를 mapper에 보내서 db에 저장
        vo.setUserPw(encodedPassword); // vo에 암호화된 비밀번호 저장
        dao.insertMember(vo);

    }

    @Override
    public String userIdCheck(String userId) {
        return dao.userIdCheck(userId);
    }

    @Override
    public String getNickName(String userId) {
        return dao.getNickName(userId);
    }

    @Override
    public String findid(String name, String email) {
        return dao.findid(name,email);
    }


}
