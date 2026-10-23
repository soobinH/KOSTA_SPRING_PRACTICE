package com.kosta.board.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.kosta.board.dto.Article;


@Mapper
//알아서 만들어줌 impl을 굳이 만들지 않아도됌 
@Repository 
// @Param("")-> XML에 사용한 #{}여기랑 똑같아야함 
//알아서 찾아감
public interface ArticleDao {
	Integer insertArticle(Article article) throws Exception;
	Article selectArticle(@Param("num")Integer num) throws Exception;
	void updateArticle(Article article) throws Exception;
	List<Article> selectArticleList(@Param("row")Integer row) throws Exception;
	Integer selectArticleCnt() throws Exception;
	void updateArticleViewCnt(@Param("num")Integer num) throws Exception;
	void deleteArticle(@Param("num")Integer num) throws Exception;
	Map<String, Object> selectArticleWithMember(@Param("num")Integer num) throws Exception;
	List<Map<String,Object>> selectArticleWithMemberList(@Param("keyword")String keyword,@Param("type")String type,@Param("row")Integer row) throws Exception;
	Integer selectArticleWithMemberCnt(@Param("keyword")String keyword,@Param("type")String type) throws Exception;
}
