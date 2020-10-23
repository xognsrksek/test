package com.bestpricemarket.service;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.persistence.MemberDAO;

@Service
public class MemberServiceImpl implements MemberService{

	//DB와 연결 (의존주입)
	@Inject
	//@Autowired
	private MemberDAO mdao;

	// 회원가입
	@Override
	public void joinMember(MemberVO vo) {
		mdao.joinMember(vo);		
		System.out.println("S: 회원가입");
	}

	// 로그인
	@Override
	public MemberVO loginMember(MemberVO vo) {
		MemberVO returnVO = null;
		try {
			returnVO = mdao.readMemberWithIDPW(vo.getId(), vo.getPw());
			System.out.println("S: 로그인 아디: "+vo.getId()+" 비번: "+vo.getPw());
		} catch (Exception e) {
			e.printStackTrace();
			returnVO = null; //실행하다 문제가 생겼을때 해당 데이터를 보내지않겠다는 의미 = 예외처리
		}
		return returnVO; 
	}
	


}
