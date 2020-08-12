package com.KG.dao;


import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.BoardDTO;
import com.KG.dto.CustomerDTO;
import com.KG.dto.MemberDTO;

@Repository
public class AdminDAO {
	@Autowired
	@Qualifier("sqlSessionAdmin")
	private SqlSession sqlSession;

	// mapper.xml의 상단 값과 일치해야 함
	public static final String namespace = "com.KG.mybatis.myMapper";

	// 회원 관리 : 회원 목록 출력
	public List<MemberDTO> memberList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectMemberList", hash);
	}

	// 회원 관리 : 회원 목록 출력 > 회원 수 계산
	public int memberCount(int m_rankNum) {
		return sqlSession.selectOne(namespace + ".selectMemberCount", m_rankNum);
	}

	// 회원 관리 : 회원 목록 출력 > 등급 변경
	public int updRank(MemberDTO dto) {
		return sqlSession.update(namespace + ".updateUpdRank", dto);
	}

	// 회원 관리 : 회원 목록 출력 > 삭제
	public int delRank(String m_id) {
		return sqlSession.update(namespace + ".updateDelRank", m_id);
	}

}
