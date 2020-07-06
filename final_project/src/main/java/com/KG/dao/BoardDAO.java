package com.KG.dao;

import java.util.HashMap;
import java.util.List;

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
	/////////////////////////// 사이드바 /////////////////////////////////
	// 카테고리 리스트
	public List<BoardDTO> categoryList() {
		return sqlSession.selectList(namespace + ".categoryList");
	}

	// 아티클 리스트
	public List<BoardDTO> articleList() {
		return sqlSession.selectList(namespace + ".articleList");
	}
	
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
	////////////////////////////////////////////////////////////////////
	
	
	///////////////// 글 목록 ////////////////////////
	// 게시물 목록
	public List<BoardDTO> list(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".list" , hash);
	}
	// 게시물 목록 개수
	public int getCount(BoardDTO boardDTO) {
		return sqlSession.selectOne(namespace + ".getCount", boardDTO);
	}
	
	// 게시물 목록(전체 글)
	public List<BoardDTO> listAll(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".listAll" , hash);
	}
	// 게시물 목록 개수(전체 글)
	public int getCountAll() {
		return sqlSession.selectOne(namespace+".getCountAll");
	}
	/////////////////////////////////////////////
	
	
	
	/////////////////// 글 쓰기 //////////////////////////
	// 게시판 목록(카테고리로 분류)
	public List<BoardDTO> cateList(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace + ".cateList", boardDTO);
	}
	// 게시글 쓰기(저장)
	public int boardWrite(BoardDTO boardDTO) {
		return sqlSession.insert(namespace + ".boardWrite", boardDTO);
	}
	////////////////////////////////////////////////
	
	
	
	
	////////////////// 검색 //////////////////////////
	
	//제목 + 내용으로 검색
	public List<BoardDTO> TCsearch(String b_content) {
		return sqlSession.selectList(namespace + ".TCsearch" , b_content);
	}
//	// 제목으로 검색
//	public List<BoardDTO> Tsearch(String b_content) {
//		return sqlSession.selectList(namespace + ".Tsearch" , b_content);
//	}
//	// 작성자로 검색
//	public List<BoardDTO> Wsearch(String b_content) {
//		return sqlSession.selectList(namespace + ".Wsearch" , b_content);
//	}
	
	////////////////////////////////////////////////

}
