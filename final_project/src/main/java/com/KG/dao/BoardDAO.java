package com.KG.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.BoardDTO;

@Repository
public class BoardDAO {
	@Autowired
	@Qualifier("sqlSessionBoard")
	private SqlSession sqlSession;
	public static final String namespace = "com.KG.mybatis.myMapper";

	// 카테고리 리스트
	public List<BoardDTO> categoryList() {
		return sqlSession.selectList(namespace + ".categoryList");
	}

	// 아티클 리스트
	public List<BoardDTO> articleList() {
		return sqlSession.selectList(namespace + ".articleList");
	}

}
