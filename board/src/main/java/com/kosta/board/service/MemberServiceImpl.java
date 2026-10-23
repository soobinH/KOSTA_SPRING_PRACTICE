package com.kosta.board.service;

import java.io.File;

import javax.servlet.ServletContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.board.dao.MemberDao;
import com.kosta.board.dao.MemberDaoImpl;
import com.kosta.board.dto.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberDao memberDao;

	@Autowired
	private ServletContext servletContext;

	public MemberServiceImpl() {
		memberDao = new MemberDaoImpl();
	}

	@Override
	public void join(Member member, MultipartFile profile) throws Exception {

		System.out.println("회원가입 서비스 실행");

		if (profile != null && !profile.isEmpty()) {

			String uploadPath = servletContext.getInitParameter("iupload");

			File uploadDir = new File(uploadPath);

			// 업로드 폴더 생성
			if (!uploadDir.exists()) {
				if (!uploadDir.mkdirs()) {
					throw new Exception("업로드 폴더 생성 실패");
				}
			}

			String originalName = profile.getOriginalFilename();

			if (originalName != null && !originalName.isEmpty()) {

				String fileName = new File(originalName.replace("\\", "/")).getName();

				File upFile = new File(uploadDir, fileName);

				profile.transferTo(upFile);

				member.setProfile(fileName);
			}
		}

		// DB에 회원 정보 저장
		System.out.println("DB 저장 시작");
		memberDao.insertMember(member);
		System.out.println("DB 저장 성공");
	}

	@Override
	public Member login(String id, String password) throws Exception {
		Member member = memberDao.selectMember(id);
		if (member == null)
			throw new Exception("아이디 오류");
		if (!member.getPassword().equals(password))
			throw new Exception("비밀번호 오류");
		member.setPassword("");
		return member;
	}

	@Override
	public boolean checkMemberId(String id) throws Exception {
		return memberDao.selectMember(id) != null;

	}

	@Override
	public void updatePassword(String id, String newPassword) throws Exception {
		// TODO Auto-generated method stub

	}

}
