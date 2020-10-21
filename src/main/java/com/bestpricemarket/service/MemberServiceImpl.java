package com.bestpricemarket.service;

import javax.inject.Inject;

import com.bestpricemarket.domain.MemberVO;
import com.bestpricemarket.persistence.MemberDAO;

public class MemberServiceImpl implements MemberService{

	//DB와 연결 (의존주입)
	@Inject
	private MemberDAO mdao;
	
	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("회원가입메서드 테스트");
	}

}
