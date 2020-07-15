package com.KG.dao;



import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.BoardDTO;

@Repository
public class AdminSidebarDAO {
	@Autowired
	@Qualifier("sqlSessionSideAdmin")
	private SqlSession sqlSession;

	// mapper.xml의 상단 값과 일치해야 함
	public static final String namespace = "com.KG.mybatis.myMapper";

	// category 중복확인
	public BoardDTO chkcategory(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace + ".chkcategory", boardDTO);
	}
	
	// category 추가
	public int inscategory(BoardDTO boardDTO) {
		return sqlSession.insert(namespace + ".inscategory", boardDTO);
	}

	// category 수정
	public int updcategory(BoardDTO boardDTO) {
		return sqlSession.update(namespace + ".updcategory", boardDTO);
	}
	
	// category 삭제
	public int delcategory(BoardDTO boardDTO) {
		sqlSession.update(namespace + ".delcategoryDown", boardDTO);
		return sqlSession.delete(namespace + ".delcategory", boardDTO);
	}
	
	// article 중복확인
	public BoardDTO chkarticle(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace + ".chkarticle", boardDTO);
	}

	// article 추가
	public int insarticle(BoardDTO boardDTO) {
		return sqlSession.insert(namespace + ".insarticle", boardDTO);
	}
	
	// article 수정
	public int updarticle(BoardDTO boardDTO) {
		return sqlSession.update(namespace + ".updarticle", boardDTO);
	}
	
	// article 삭제
	public int delarticle(BoardDTO boardDTO) {
		sqlSession.update(namespace + ".delarticleDown", boardDTO);
		return sqlSession.delete(namespace + ".delarticle", boardDTO);
	}
	
	// category 순서 저장
	public int ordercategory(BoardDTO boardDTO) {
		return sqlSession.update(namespace + ".ordercategory", boardDTO);
	}
	
	// article 순서 저장
	public int orderarticle(BoardDTO boardDTO) {
		return sqlSession.update(namespace + ".orderarticle", boardDTO);
	}
}
