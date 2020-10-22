package com.bestpricemarket.persistence;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAOImpl implements MemberDAO {

	//DB연결 (xml에서 만들어진 객체를 가져다 사용하고자함 = 의존 주입)
	@Inject
	//@Autowired
	private SqlSession sqlSession; //mapper위치까지 접근 가능 but mapper가 여러개일수있음 => mapper구분필요
	
	//mapper구분하는 값 namespace
	private static final String namespace = "com.bestpricemarket.mappers.memberMapper";
	
	//테스트
	@Override
	public String getTime() {
		String result = sqlSession.selectOne(namespace+".getTime"); //괄호안에 쿼리구문입력하기
		return result;
	}
	
}
