package com.kosta.board.service;

import java.util.List;
import java.util.Map;

import javax.servlet.http.Part;

import org.springframework.web.multipart.MultipartFile;

import com.kosta.board.dto.Article;
import com.kosta.board.util.PageInfo;

public interface ArticleService {
	// 湲��옉�꽦
	Integer writeArticle(Article article, MultipartFile ifile, MultipartFile dfile) throws Exception;

	// 湲��긽�꽭
	Map<String, Object> detailArticle(Integer num) throws Exception;

	// 湲��궘�젣
	void deleteArticle(Integer num) throws Exception;

	// 湲��닔�젙
	void modifyArticle(Article article, MultipartFile ifile, MultipartFile dfile) throws Exception;

	// 湲�紐⑸줉(�럹�씠吏�)
	List<Map<String, Object>> articleList(PageInfo pageInfo, String keyword, String type) throws Exception;

	Boolean isHeart(Integer articleNum, String memberId) throws Exception;

	Boolean toggleHeart(Integer articleNum, String memberId) throws Exception;
}
