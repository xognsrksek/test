package com.bestpricemarket.service;

import org.springframework.beans.factory.annotation.Autowired;

import com.bestpricemarket.domain.MemberVO;

public interface MemberService {
	// 회원 가입 (일반회원가입테이블에 sns계정 컬럼 추가하기)
	// 일반적으로는 DAO랑 같은 메소드명을 사용하여 일관성을 유지한다
	
	public void insertMember(MemberVO vo);
}
