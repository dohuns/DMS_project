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
	SqlSession sqlSession;
	public static final String namespace = "com.KG.mybatis.myMapper";
	
	public List<BoardDTO> list(BoardDTO dto) {
		return sqlSession.selectList(namespace + ".list" , dto);
	}
	
	public List<BoardDTO> cateList(BoardDTO dto) {
		return sqlSession.selectList(namespace + ".cateList", dto);
	}
}
