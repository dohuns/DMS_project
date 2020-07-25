package com.KG.dao;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Repository;

import com.KG.dto.CustomerDTO;

@Repository
public class CustomerDAO {

	@Autowired
	@Qualifier("sqlSessionCustomer")
	private SqlSession sqlSession;

	public static final String namespace = "com.KG.mybatis.myMapper";

	// 관리자 페이지 : 고객센터 목록별 문의글 목록
	public List<CustomerDTO> customerList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectCustomerList", hash);
	}

	// 관리자 페이지 : 고객센터 목록별 문의글 개수
	public int getCustomerCount(int cus_categoryNum) {
		return sqlSession.selectOne(namespace + ".selectCustomerCount", cus_categoryNum);
	}

	/////////////////////////////////////////////////////////////////////////////////////
	// 회원 페이지 > 고객센터 : 전체 문의글 출력
	public List<CustomerDTO> AllCustomerList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".AllCustomerList", hash);
	}

	// 회원 페이지 > 고객센터 : 전체 문의글 개수
	public int AllCustomerCount() {
		return sqlSession.selectOne(namespace + ".AllCustomerCount");
	}

	// 회원 페이지 > 고객센터 : 1:1문의 접수
	public int insertInquiry(CustomerDTO dto) {
		return sqlSession.insert(namespace + ".insertInquiry", dto);
	}

	// 회원 페이지 > 고객센터 : 회원별 문의내역 조회(아이디 조회)
	public List<CustomerDTO> selectInquiry(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectInquiry", hash);
	}

	// 회원 페이지 > 고객센터 : 회원별 문의내역 개수 조회
	public int getInquiryCount(String cus_id) {
		return sqlSession.selectOne(namespace + ".selectInquiryCount", cus_id);
	}

}
