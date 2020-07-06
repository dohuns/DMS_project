package com.KG.dao;


import java.util.HashMap;
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
	public List<MemberDTO> searchList(String searchOption, String keyword) {
		Map<String, String> map = new HashMap<String, String>();
		map.put("searchOption", searchOption);
		if(searchOption.equals("m_rank")) {
			if(keyword.contains("관") || keyword.contains("리") || keyword.contains("자")) {
				map.put("keyword", "1");
			} else if(keyword.contains("스") || keyword.contains("탭")) {
				map.put("keyword", "2");
			} else if(keyword.contains("일") || keyword.contains("반")) {
				map.put("keyword", "3");
			} else if(keyword.contains("대") || keyword.contains("기")) {
				map.put("keyword", "4");
			} else {
				map.put("keyword", keyword);
			}
		} else {
			map.put("keyword", keyword);
		}
		return sqlSession.selectList(namespace + ".searchList", map);
	}

	// 회원 관리 페이지 > 회원 추가
	public int insertMember(MemberDTO dto) {
		return sqlSession.insert(namespace + ".insertMember", dto);
	}
}
