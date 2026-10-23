package com.kosta.board.service;

import java.io.File;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletContext;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.kosta.board.dao.ArticleDao;
import com.kosta.board.dto.Article;
import com.kosta.board.util.PageInfo;

@Service
public class ArticleServiceImpl implements ArticleService {

	@Autowired
	private ArticleDao articleDao;

	@Autowired
	private ServletContext servletContext;

	@Override
	public Integer writeArticle(Article article, MultipartFile ifile, MultipartFile dfile) throws Exception {

		// 1. 이미지 파일 저장
		if (ifile != null && !ifile.isEmpty()) {

			String IUPLOAD = servletContext.getInitParameter("iupload");

			File uploadDir = new File(IUPLOAD);

			// 이미지 저장 폴더 생성
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			String fileName = new File(ifile.getOriginalFilename().replace("\\", "/")).getName();

			File upFile = new File(uploadDir, fileName);

			ifile.transferTo(upFile);

			article.setImageFilename(fileName);
		}

		// 2. 첨부파일 저장
		if (dfile != null && !dfile.isEmpty()) {

			String DUPLOAD = servletContext.getInitParameter("dupload");

			File uploadDir = new File(DUPLOAD);

			// 첨부파일 저장 폴더 생성
			if (!uploadDir.exists()) {
				uploadDir.mkdirs();
			}

			String fileName = new File(dfile.getOriginalFilename().replace("\\", "/")).getName();

			File upFile = new File(uploadDir, fileName);

			dfile.transferTo(upFile);

			article.setDownloadFilename(fileName);
		}

		// 3. 게시글 DB 저장
		articleDao.insertArticle(article);

		return article.getNum();
	}

	@Override
	public Map<String, Object> detailArticle(Integer num) throws Exception {
		articleDao.updateArticleViewCnt(num);
		return articleDao.selectArticleWithMember(num);
	}

	@Override
	public void deleteArticle(Integer num) throws Exception {
		articleDao.deleteArticle(num);

	}

	@Override
	public void modifyArticle(Article article, MultipartFile ifile, MultipartFile dfile) throws Exception {

		// 1. 기존 게시글 확인
		Article oldArticle = articleDao.selectArticle(article.getNum());

		if (oldArticle == null) {
			throw new Exception("게시글이 존재하지 않습니다.");
		}

		// 2. 작성자 확인
		if (!oldArticle.getWriter().equals(article.getWriter())) {
			throw new SecurityException("수정 권한이 없습니다.");
		}

		// 3. 새 이미지가 있다면 저장
		if (ifile != null && !ifile.isEmpty()) {
			String fileName = saveUploadedFile(ifile, "iupload");
			article.setImageFilename(fileName);
		}

		// 4. 새 첨부파일이 있다면 저장
		if (dfile != null && !dfile.isEmpty()) {
			String fileName = saveUploadedFile(dfile, "dupload");
			article.setDownloadFilename(fileName);
		}

		// 5. 게시글 수정
		articleDao.updateArticle(article);

		System.out.println("게시글 수정 완료: " + article.getNum());
	}

// 파일 저장 공통 메서드
	private String saveUploadedFile(MultipartFile file, String pathKey) throws Exception {

		String uploadPath = servletContext.getInitParameter(pathKey);

		if (uploadPath == null || uploadPath.isEmpty()) {
			throw new Exception("업로드 경로 설정이 없습니다.");
		}

		File uploadDir = new File(uploadPath);

		if (!uploadDir.exists() && !uploadDir.mkdirs()) {
			throw new Exception("업로드 폴더 생성 실패");
		}

		if (!uploadDir.isDirectory()) {
			throw new Exception("업로드 경로가 폴더가 아닙니다.");
		}

		String originalName = file.getOriginalFilename();

		if (originalName == null || originalName.isEmpty()) {
			throw new Exception("파일 이름이 없습니다.");
		}

		// 경로를 제거하고 파일명만 사용
		String fileName = originalName.replace("\\", "/");
		fileName = fileName.substring(fileName.lastIndexOf('/') + 1);

		// 같은 이름의 파일 충돌 방지
		fileName = java.util.UUID.randomUUID() + "_" + fileName;

		File upFile = new File(uploadDir, fileName);
		file.transferTo(upFile);

		return fileName;
	}

	@Override
	public List<Map<String, Object>> articleList(PageInfo pageInfo, String keyword, String type) throws Exception {
		Integer allCnt = articleDao.selectArticleWithMemberCnt(keyword, type);
		Integer allPage = (int) Math.ceil((double) allCnt / 10);
		Integer startPage = (pageInfo.getCurPage() - 1) / 10 * 10 + 1;
		Integer endPage = startPage + 10;
		if (endPage > allPage)
			endPage = allPage;

		pageInfo.setAllPage(allPage);
		pageInfo.setStartPage(startPage);
		pageInfo.setEndPage(endPage);

		Integer row = (pageInfo.getCurPage() - 1) * 10;

		return articleDao.selectArticleWithMemberList(keyword, type, row);
	}

	@Override
	public Boolean isHeart(Integer articleNum, String memberId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public Boolean toggleHeart(Integer articleNum, String memberId) throws Exception {
		// TODO Auto-generated method stub
		return null;
	}

}
