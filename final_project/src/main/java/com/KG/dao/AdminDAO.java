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
		return sqlSession.selectList(namespace + ".searchList", map);
	}

	// 회원 관리 페이지 > 회원 추가
	public int insertMember(MemberDTO dto) {
		System.out.println("DAO : " + dto.getM_rank());
		return sqlSession.insert(namespace + ".insertMember", dto);
	}

	// 회원 관리 페이지 > 회원 수정 (정보 출력)
	public MemberDTO selectInfoList(String m_id) {
		System.out.println("Controller " + m_id);
		return sqlSession.selectOne(namespace + ".selectInfoList", m_id);
	}
}
