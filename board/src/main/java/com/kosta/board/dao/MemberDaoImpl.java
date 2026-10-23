package com.kosta.board.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

import com.kosta.board.dto.Member;

public class MemberDaoImpl implements MemberDao {
	private SqlSessionTemplate sqlSession;

	public void setSqlSession(SqlSessionTemplate sqlSession) {
		this.sqlSession = sqlSession;
	}
	
	@Override
	public void insertMember(Member member) throws Exception {
		sqlSession.insert("mapper.member.insertMember", member);
	}

	@Override
	public Member selectMember(String id) throws Exception {
		return sqlSession.selectOne("mapper.member.selectMember", id);

	}

	@Override
	public void updatePassword(String id, String password) throws Exception {
		// TODO Auto-generated method stub
		
	}

}
