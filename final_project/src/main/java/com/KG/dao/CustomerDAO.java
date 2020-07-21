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

	// 고객센터 게시글 목록
	public List<CustomerDTO> customerList(HashMap<String, Object> hash) {
		return sqlSession.selectList(namespace + ".selectCustomerList", hash);
	}

	// 고객센터 게시글 개수
	public int getCustomerCount(int cus_reNum) {
		return sqlSession.selectOne(namespace + ".selectCustomerCount", cus_reNum);
	}
}
