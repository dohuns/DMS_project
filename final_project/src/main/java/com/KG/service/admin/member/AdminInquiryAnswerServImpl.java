package com.KG.service.admin.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.context.annotation.SessionScope;

import com.KG.dao.CustomerDAO;
import com.KG.dto.CustomerDTO;
import com.KG.service.customer.CustomerService;

@Service
public class AdminInquiryAnswerServImpl implements CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		CustomerDTO customerDTO = (CustomerDTO) map.get("dto");		// 문의글 정보

		// 글 번호로 비밀번호 조회
		customerDTO.setCus_pw(customerDAO.selectPwAnswer(customerDTO.getCus_num()));
		customerDTO.setCus_nick((String) map.get("cus_nick"));
		customerDTO.setCus_pub("close");

		// 답글 등록
		customerDAO.adminInquiryAnswer(customerDTO);
		// 기존 문의글 reNum 변경 : 글 번호와 그룹 값이 일치하는 데이터의 상태값을 변경
		customerDAO.updateSetReNum(customerDTO.getCus_num());
	}

	@Override
	public CustomerDTO customerList(Model model) {
		return null;
	}

	@Override
	public int chkList(Model model) {
		return 0;
	}

}
