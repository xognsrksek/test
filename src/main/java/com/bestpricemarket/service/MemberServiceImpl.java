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
	
	@Override
	public void insertMember(MemberVO vo) {
		System.out.println("회원가입메서드 테스트");
	}

}
