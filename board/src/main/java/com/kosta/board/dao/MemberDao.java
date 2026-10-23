package com.kosta.board.dao;

import org.apache.ibatis.annotations.Param;

import com.kosta.board.dto.Member;

public interface MemberDao {
	void insertMember(Member member) throws Exception;
	Member selectMember(@Param("id")String id) throws Exception;
	void updatePassword(@Param("id") String id, @Param("password") String password) throws Exception;
}
