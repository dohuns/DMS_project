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

	// (관리자 페이지)
	// 서비스 관리 : 문의 내역 출력
	public List<CustomerDTO> adminInquiryList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectAdminInquiryList", hash);
	}

	// 서비스 관리 : 문의 내역 출력 > 항목 수 계산
	public int adminInquiryCount(int cus_categoryNum) {
		return sqlSession.selectOne(namespace + ".selectAdminInquiryCount", cus_categoryNum);
	}

	// 서비스 관리 : 문의글 확인 > 답글 보류 선택
	public int adminInquiryHold(int cus_num) {
		return sqlSession.update(namespace + ".updateReNumHold", cus_num);
	}

	// 서비스 관리 : 문의글 확인 > 답글 등록 선택
	public int adminInquiryAnswer(CustomerDTO dto) {
		return sqlSession.update(namespace + ".updateReNumAnswer", dto);
	}

	// 서비스 관리 : 문의글 확인 > 답글 등록 선택 > 글 번호로 비밀번호 조회
	public String selectPwAnswer(int cus_num) {
		return sqlSession.selectOne(namespace + ".selectPwAnswer", cus_num);
	}

	// 서비스 관리 : 문의글 확인 > 답글 등록 선택 > 해당 문의글 답글 완료 처리
	public int updateSetReNum(int cus_group) {
		return sqlSession.update(namespace + ".updateSetReNum", cus_group);
	}


	// (회원 페이지)
	// 고객센터 : 전체 문의글 조회
	public List<CustomerDTO> customerList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectCustomerList", hash);
	}

	// 고객센터 : 전체 문의글 개수
	public int customerCount() {
		return sqlSession.selectOne(namespace + ".selectCustomerCount");
	}

	// 고객센터 : 문의글 작성
	public int insertInquiry(CustomerDTO dto) {
		return sqlSession.insert(namespace + ".insertInquiry", dto);
	}

	// 고객센터 : 문의글 확인
	public CustomerDTO inquiryContent(int cus_num) {
		return sqlSession.selectOne(namespace + ".selectInquiryContent", cus_num);
	}

	// 고객센터 : 문의글 확인 > 비밀번호 확인
	public String customerPwChk(int cus_num) {
		return sqlSession.selectOne(namespace + ".customerPwChk", cus_num);
	}

	// 고객센터 : 문의글 확인 > 문의글 삭제
	public int deleteInquiry(int cus_num) {
		return sqlSession.delete(namespace + ".deleteInquiry", cus_num);
	}

	// 고객센터 : 문의글 확인 > 문의글 수정
	public int updateInquiry(CustomerDTO dto) {
		return sqlSession.update(namespace + ".updateInquiry", dto);
	}

	// 고객센터 : 문의내역 조회 (아이디 조회)
	public List<CustomerDTO> selectInquiry(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectInquiry", hash);
	}

	// 고객센터 : 문의내역 조회 > 문의내역 개수 조회
	public int selectInquiryCount(String cus_id) {
		return sqlSession.selectOne(namespace + ".selectInquiryCount", cus_id);
	}

	// 고객센터 : 검색 > 닉네임 조회
	public List<CustomerDTO> inquirySearchList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectInquirySearch", hash);
	}

	// 고객센터 : 검색 > 조회결과 개수
	public int selectSearchCount(String cus_nick) {
		return sqlSession.selectOne(namespace + ".selectSearchCount", cus_nick);
	}
}
