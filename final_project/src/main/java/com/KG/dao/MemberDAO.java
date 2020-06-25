package com.KG.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KG.dto.MemberDTO;


@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	public static final String namepasce = "com.care.mybatis.myMapper";

	public MemberDTO loginck(MemberDTO dto) {
		try {
			return sqlSession.selectOne(namepasce + ".loginck", dto);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}
	
}
