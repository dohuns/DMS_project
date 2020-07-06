package com.KG.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.BoardDTO;
import com.KG.dto.MemberDTO;

@Repository
public class BoardDAO {
	@Autowired
	@Qualifier("sqlSessionBoard")
	private SqlSession sqlSession;
	public static final String namespace = "com.KG.mybatis.myMapper";

	// 사이드바 정보
	public MemberDTO userInfo(String m_nick) {
		return sqlSession.selectOne(namespace + ".userInfo", m_nick);
	}
	
	// 사이드바 작성 게시글 수
	public int boardCount(String m_nick) {
		return sqlSession.selectOne(namespace + ".boardCount", m_nick);
	}

	// 사이드바 작성 댓글 수
	public int replyCount(String m_nick) {
		return sqlSession.selectOne(namespace + ".replyCount", m_nick);
	}

	// 카테고리 리스트
	public List<BoardDTO> categoryList() {
		return sqlSession.selectList(namespace + ".categoryList");
	}

	// 아티클 리스트
	public List<BoardDTO> articleList() {
		return sqlSession.selectList(namespace + ".articleList");
	}
	
	
	public List<BoardDTO> list(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace + ".list" , boardDTO);
	}
	
	
	public List<BoardDTO> cateList(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace + ".cateList", boardDTO);
	}

}
