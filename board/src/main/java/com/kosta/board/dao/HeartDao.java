package com.kosta.board.dao;

import java.util.Map;

public interface HeartDao {
	Integer selectHeart(Map<String, Object> param) throws Exception;
	void insertHeart(Map<String, Object> param) throws Exception;
	void deleteHeart(Map<String, Object> param) throws Exception;
}
