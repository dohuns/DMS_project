package com.KG.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MemberDAO {
	
	private static final String namespace="com.care.mybatis.myMapper";
	
	@Autowired
	SqlSession session;
	
	public String chk_id(String m_id) {
		return session.selectOne(namespace+".chk_id",m_id);
	}

}
