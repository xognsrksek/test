package com.bestpricemarket.persistence;

import com.bestpricemarket.domain.MemberVO;

public interface MemberDAO {
	
	// 회원가입
	public void joinMember(MemberVO vo);
	
	// 회원 정보 조회 - ID,PW정보에 해당하는 사용자 정보
	public MemberVO readMemberWithIDPW(String id,String pw) throws Exception;
}
