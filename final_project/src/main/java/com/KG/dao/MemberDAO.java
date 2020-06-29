package com.KG.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.KG.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSession sqlSession;
	public static final String namepasce = "com.KG.mybatis.myMapper";

	public String chk_id(String m_id) {
		return sqlSession.selectOne(namepasce + ".chk_id", m_id);
	}

	public MemberDTO loginck(MemberDTO memberDTO) {
		try {
			return sqlSession.selectOne(namepasce + ".loginck", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public MemberDTO findId(MemberDTO memberDTO) {
		try {
			return sqlSession.selectOne(namepasce + ".findId", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public MemberDTO findPw(MemberDTO memberDTO) {
		try {
			return sqlSession.selectOne(namepasce + ".findPw", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

	public int findPw_change(MemberDTO memberDTO) {
		try {
			return sqlSession.update(namepasce + ".findPw_change", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}

}
