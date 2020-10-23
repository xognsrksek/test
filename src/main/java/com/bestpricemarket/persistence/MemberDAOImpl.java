package com.bestpricemarket.persistence;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.bestpricemarket.domain.MemberVO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	//DB연결
	@Inject
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요
	
	private static final String namespace = "com.bestpricemarket.mappers.memberMapper";

	//회원가입
	@Override
	public void joinMember(MemberVO vo) {
		System.out.println("DAO: 회원가입");
		sqlSession.insert(namespace+".joinMember", vo);
	}

	//회원정보읽기
	@Override
	public MemberVO readMemberWithIDPW(String id, String pw) throws Exception {
		Map<String, String> paramMap = new HashMap<String, String>();
		paramMap.put("id", id);
		paramMap.put("pw", pw);
		
		System.out.println("DAO: 로그인- "+paramMap);
		return sqlSession.selectOne(namespace+".readMemberWithIDPW", paramMap);	
	}
	
	
}
