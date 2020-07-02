package com.KG.dao;


import java.util.List;

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
}
