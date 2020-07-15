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

	// 회원 전체 목록
	public List<MemberDTO> memberList() {
		return sqlSession.selectList(namespace + ".selectMemberList");
	}

	// 등급별 목록
	public List<MemberDTO> rankList(int m_rankNum) {
		return sqlSession.selectList(namespace + ".selectRankList", m_rankNum);
	}

	// 회원 수
	public int getMemberCount() {
		return sqlSession.selectOne(namespace + ".getMemberCount");
	}

	// 등급별 회원 수
	public int getRankCount(int m_rankNum) {
		return sqlSession.selectOne(namespace + ".getRankCount", m_rankNum);
	}

	// 회원 정보 추가
	public int insertMember(MemberDTO dto) {
		return sqlSession.insert(namespace + ".insertMember", dto);
	}

	// 회원 정보 출력 : 수정 회원
	public MemberDTO selectInfoList(String m_id) {
		return sqlSession.selectOne(namespace + ".selectInfoList", m_id);
	}

	// 회원 정보 수정
	public int updateMember(MemberDTO dto) {
		return sqlSession.update(namespace + ".updateMember", dto);
	}

	// 회원 정보 삭제
	public int deleteMember(String m_id) {
		return sqlSession.delete(namespace + ".deleteMember", m_id);
	}
}
