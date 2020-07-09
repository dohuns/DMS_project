package com.KG.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.MemberDTO;

@Repository
public class AdminDAO {

	@Autowired
	@Qualifier("sqlSessionAdmin")
	private SqlSession sqlSession;

	// mapper.xml의 상단 값과 일치해야 함
	public static final String namespace = "com.KG.mybatis.myMapper";

	// 메인 페이지 > 회원 목록
	public List<MemberDTO> memberList() {
		return sqlSession.selectList(namespace + ".selectMemberList");
	}

	// 회원 관리 페이지 > 회원 검색
	public List<MemberDTO> searchList(Map<String, Object> map) {
		return sqlSession.selectList(namespace + ".selectSearchList", map);
	}

	// 회원 관리 페이지 > 일반 회원 검색
	public List<MemberDTO> normalList() {
		return sqlSession.selectList(namespace + ".selectNormalList");
	}

	// 회원 관리 페이지 > 대기 회원 검색
	public List<MemberDTO> waitList() {
		return sqlSession.selectList(namespace + ".selectWaitList");
	}

	// 회원 관리 페이지 > 회원 추가
	public int insertMember(MemberDTO dto) {
		return sqlSession.insert(namespace + ".insertMember", dto);
	}

	// 회원 관리 페이지 > 회원 수정 (정보 출력)
	public MemberDTO selectInfoList(String m_id) {
		return sqlSession.selectOne(namespace + ".selectInfoList", m_id);
	}

	// 회원 관리 페이지 > 회원 수정
	public int updateMember(MemberDTO dto) {
		return sqlSession.update(namespace + ".updateMember", dto);
	}

	// 회원 관리 페이지 > 회원 삭제
	public int deleteMember(String m_id) {
		return sqlSession.delete(namespace + ".deleteMember", m_id);
	}
}
