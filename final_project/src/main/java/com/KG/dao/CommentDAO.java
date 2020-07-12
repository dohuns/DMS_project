package com.KG.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.CommentDTO;

@Repository
public class CommentDAO {

	@Autowired
	@Qualifier("sqlSessionComment")
	SqlSession sqlSession;
	public static final String namespace = "com.KG.mybatis.myMapper";
	
	// 댓글 작성
	public int commentSave(CommentDTO dto) {
		
		return sqlSession.insert(namespace + ".commentSave" , dto);
	}
	
	// 댓글 리스트
	public List<CommentDTO> commentList(CommentDTO dto) {
		return sqlSession.selectList(namespace + ".commentList" , dto); 
	}
	
	// 댓글 개수
	public int getCount(CommentDTO dto) {
		return sqlSession.selectOne(namespace + ".getCount" , dto);
	}
	
	// 대댓글 전 reNum올려주기
	public int ReComGroup(CommentDTO dto) {
		return sqlSession.selectOne(namespace + ".ReComGroup" , dto);
	}
	// 대댓글 달기
	public int ReComSave(CommentDTO dto) {
		return sqlSession.insert(namespace+".ReComSave" , dto);
	}
	
	// 댓글 삭제
	public int commentDelete(int comNum) {
		System.out.println("dao : " + comNum);
		return sqlSession.delete(namespace + ".commentDelete", comNum);
	}
} 
