package com.kosta.board.service;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.board.dto.Member;

public interface MemberService {
	void join(Member member, MultipartFile profile) throws Exception;
	Member login(String id, String password) throws Exception;
	boolean checkMemberId(String id) throws Exception;
	void updatePassword(String id, String newPassword) throws Exception;
}
