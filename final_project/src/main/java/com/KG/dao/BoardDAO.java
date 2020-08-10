package com.KG.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.BoardDTO;
import com.KG.dto.LikeDTO;
import com.KG.dto.MemberDTO;

@Repository
public class BoardDAO {
	@Autowired
	@Qualifier("sqlSessionBoard")
	private SqlSession sqlSession;
	public static final String namespace = "com.KG.mybatis.myMapper";
	/////////////////////////// 사이드바 /////////////////////////////////
	
	// 사이드바 리스트
	public List<BoardDTO> sidebarlist(BoardDTO boardDTO) {
		return sqlSession.selectList(namespace + ".sidebarlist" , boardDTO);
	}
	
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
	
	
	
	/////////////////////////// 나의 활동 /////////////////////////////////
	// 내가 쓴 게시글
		public List<BoardDTO> userBoardList(HashMap<String, Object> hash) {
			return sqlSession.selectList(namespace + ".userBoardList", hash);
		}

	// 내가 쓴 게시글 카운터
	public int userBoardListCount(String b_id) {
		return sqlSession.selectOne(namespace + ".userBoardListCount", b_id);
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
	// 게시물 목록(전체 글)
	public List<BoardDTO> listMainAll() {
		return sqlSession.selectList(namespace + ".listMainAll");
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
	// 게시판 목록(카테고리로 분류X)
	public List<BoardDTO> cateListAll() {
		return sqlSession.selectList(namespace + ".cateListAll");
	}
	// 게시글 쓰기(저장)
	public int boardWrite(BoardDTO boardDTO) {
		return sqlSession.insert(namespace + ".boardWrite", boardDTO);
	}
	////////////////////////////////////////////////
	
	
	
	
	////////////////// 전체 글 검색 //////////////////////////
	
	//제목 + 내용으로 검색
	public List<BoardDTO> TCsearchAll(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".TCsearchAll" , hash);
	}
	// 제목 + 내용검색 개수
	public int TCsearchCountAll(String b_content) {
		return sqlSession.selectOne(namespace + ".TCsearchCountAll" , b_content);
	}
	// 제목으로 검색
	public List<BoardDTO> TsearchAll(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".TsearchAll" , hash);
	}
	// 제목 개수
	public int TsearchCountAll(String b_content) {
		return sqlSession.selectOne(namespace + ".TsearchCountAll", b_content);
	}
	// 작성자로 검색
	public List<BoardDTO> WsearchAll(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".WsearchAll" , hash);
	}
	// 작성자 개수
	public int WsearchCountAll(String b_content) {
		return sqlSession.selectOne(namespace + ".WsearchCountAll", b_content);
	}
	
	////////////////////////////////////////////////
	
	/////////////////// 게시판 검색 ///////////////////
	// 제목 + 내용 검색
	public List<BoardDTO> TCsearch(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".TCsearch" , hash);
	}
	// 제목 + 내용 개수
	public int TCsearchCount(HashMap<String, Object> hash) { 
		return sqlSession.selectOne(namespace + ".TCsearchCount" , hash);
	}
	
	// 제목 검색
	public List<BoardDTO> Tsearch(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace +".Tsearch",hash);
	}
	// 제목 검색 개수
	public int TsearchCount(HashMap<String, Object> hash) {
		return sqlSession.selectOne(namespace + ".TsearchCount" , hash);
	}
	
	// 작성자 검색
	public List<BoardDTO> Wsearch(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".Wsearch", hash);
	}
	// 작성자 검색 개수
	public int WsearchCount(HashMap<String, Object> hash) {
		return sqlSession.selectOne(namespace + ".WsearchCount" , hash);
	} 
	///////////////////////////////////////////////

	// 게시글 조회수
	public void hitUp(int b_num) {
		sqlSession.update(namespace +".hitUp" , b_num);
	}
	
	// 게시글 상세보기
	public BoardDTO showBoard(int b_num) {
		return sqlSession.selectOne(namespace +".showBoard" , b_num);
	}
	
	// 게시판 전부 가져오기
	public List<BoardDTO> getArticle() {
		return sqlSession.selectList(namespace + ".getArticle");
	}
	
	// 게시글 수정
	public int modifyBoard(BoardDTO dto) {
		return sqlSession.update(namespace + ".modifyBoard" , dto);
	}
	
	// 게시글 삭제
	public int deleteBoard(BoardDTO dto) {
		return sqlSession.delete(namespace + ".deleteBoard", dto);
	}
	// 게시글 삭제 시 댓글도 전부 삭제
	public int deleteComment(BoardDTO dto) {
		return sqlSession.delete(namespace + ".deleteComment", dto);
	}
	
	// 답글 작성 저장
	public int replySave(BoardDTO dto) {
		
		sortNumPlus(dto);
		
		dto.setB_reNum(dto.getB_reNum() +1);
		dto.setB_sortNum(dto.getB_sortNum() +1);
		
		return sqlSession.insert(namespace + ".replySave" , dto);
	}
	
	// 답글 작성시 현재의 sortNum보다 큰애들 +1해주기
	public int sortNumPlus(BoardDTO dto) {
		return sqlSession.update(namespace + ".sortNumPlus", dto);
	}

	
	
	/////////////////////// 업로드 관련 ////////////////////////////////
	
	// 파일 업로드(글쓰기)
	public int insertFile(Map<String, Object> map) {
		return sqlSession.insert(namespace + ".insertFile" , map);
	}
	
	// 첨부파일 조회
	public List<Map<String, Object>> selectFileList(int f_boardNum) {
		System.out.println("번호 : " + f_boardNum);
		return sqlSession.selectList(namespace + ".selectFileList" , f_boardNum);
	}
	
	// 첨부파일 다운로드
	public Map<String, Object> selectFileInfo(int f_no) {
		return sqlSession.selectOne(namespace + ".selectFileInfo" , f_no);
	}
	
	// 첨부파일 수정 
	public int deleteFile(Map<String, Object> map) {
		return sqlSession.delete(namespace + ".deleteFile" , map);
	}
	
	// 게시글 삭제 시 첨부파일 삭제
	public int allFileDel(BoardDTO dto) {
		return sqlSession.delete(namespace + ".allFileDel" , dto);
	}
	///////////////////////////////////////////////////////////////

	
	
	// 추천(따봉) 추가
	public int addLike(LikeDTO dto) {
		return sqlSession.insert(namespace + ".addLike" , dto);
	}
	
	// 추천(따봉) 개수 
	public int likeCount(int boardNum) { 
		return sqlSession.selectOne(namespace + ".likeCount" , boardNum);
	}
	
	// 비추천(역따봉) 추가
	public int addUnlike(LikeDTO dto) {
		return sqlSession.insert(namespace + ".addUnlike" , dto);
	}
	
	// 비추천(역따봉) 개수
	public int unlikeCount(int boardNum) {
		return sqlSession.selectOne(namespace + ".unlikeCount" , boardNum);
	}
	
	// 추천(따봉) 취소
	public int deleteLike(LikeDTO dto) {
		return sqlSession.delete(namespace + ".deleteLike" , dto);
	}
	
	// 비추천(역따봉) 취소
	public int deleteUnlike(LikeDTO dto) {
		return sqlSession.delete(namespace + ".deleteUnlike" , dto);
	}
	
	// 추천 비추천 누른지 구분
	public String getLike(LikeDTO dto) {
		return sqlSession.selectOne(namespace + ".getLike" , dto);
	}

	// 추천 비추천 누른 멤버 확인(글번호)
	public List<Map<String, Object>> likeMemberList(int boardNum) {
		return sqlSession.selectList(namespace + ".likeMemberList" , boardNum);
	}
	
}
