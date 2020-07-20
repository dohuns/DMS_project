package com.KG.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.MemberDTO;

@Repository
public class MemberDAO {
	@Autowired
	@Qualifier("sqlSession")
	private SqlSession sqlSession;
	public static final String namespace = "com.KG.mybatis.myMapper";

		
	// 아이디 중복검사
	public String chk_id(String m_id) {
		return sqlSession.selectOne(namespace + ".chk_id", m_id);
	}
	// 이메일 중복검사
	public String chkEmail(String email) {
		return sqlSession.selectOne(namespace + ".chkEmail" , email);
	}
	// 닉네임 중복검사
	public String chkNick(String nick) {
		return sqlSession.selectOne(namespace + ".chkNick" , nick);
	}

//	로그인 확인
	public MemberDTO loginck(MemberDTO memberDTO) {
		try {
			return sqlSession.selectOne(namespace + ".loginck", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	아이디 찾기 사용자 확인
	public MemberDTO findId(MemberDTO memberDTO) {
		try {
			return sqlSession.selectOne(namespace + ".findId", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	비밀번호 찾기 사용자 확인
	public MemberDTO findPw(MemberDTO memberDTO) {
		try {
			return sqlSession.selectOne(namespace + ".findPw", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

//	비밀번호 변경
	public int findPw_change(MemberDTO memberDTO) {
		try {
			return sqlSession.update(namespace + ".findPw_change", memberDTO);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return 0;
	}
	
	// 회원가입
	public int addMember(MemberDTO memberDTO) {
		return sqlSession.insert(namespace+".addMember",memberDTO);
	}
	
	// 이메일로 정보 가져오기
	public MemberDTO getMember(String email) {
		return sqlSession.selectOne(namespace + ".getMember" , email);
	}

}
