package com.KG.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KG.dto.MemberDTO;

@Repository
public class MemberDAO {
	
	private final String namespace="com.KG.mybatis.myMapper";
	
	@Autowired
	SqlSession session;
	
	public String chk_id(String m_id) {
		return session.selectOne(namespace+".chkId",m_id);
	}
	
	public int addMember(MemberDTO dto) {
		return session.insert(namespace+".addMember",dto);
	}

}
