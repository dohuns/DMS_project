package com.KG.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.dto.CustomerDTO;
import com.KG.service.customer.CustomerContentServImpl;
import com.KG.service.customer.CustomerDeleteServImpl;
import com.KG.service.customer.CustomerInquiryServImpl;
import com.KG.service.customer.CustomerListServImpl;
import com.KG.service.customer.CustomerMyInquiryServImpl;
import com.KG.service.customer.CustomerPwChkServImpl;
import com.KG.service.customer.CustomerSearchServImpl;
import com.KG.service.customer.CustomerService;
import com.KG.service.customer.CustomerUpdServImpl;

@Controller
public class CustomerController {
	CustomerService customerServ;

	// 고객센터 메인 페이지
	@RequestMapping("customerMain")
	public String customerMain(Model model, CustomerDTO dto) {
		model.addAttribute("dto", dto);
		customerServ = (CustomerListServImpl) AC.ac.getBean("customerListServImpl");
		customerServ.execute(model);
		return "customer/customerMain";
	}

	// 고객센터 내 문의글 보기
	@RequestMapping("myInquiryList")
	public String myInquiryList(Model model, HttpSession session, CustomerDTO dto) {
		model.addAttribute("session", session);
		model.addAttribute("dto", dto);
		customerServ = (CustomerMyInquiryServImpl) AC.ac.getBean("customerMyInquiryServImpl");
		customerServ.execute(model);
		return "customer/myInquiryList";
	}

	// 고객센터 게시글 작성
	@RequestMapping("inquiry")
	public String inquiry(Model model, int cus_categoryNum) {
		model.addAttribute("cus_categoryNum", cus_categoryNum);
		return "customer/inquiry";
	}

	@RequestMapping("inquiryChk")
	public String inquiryChk(Model model, CustomerDTO dto) {
		model.addAttribute("dto", dto);
		customerServ = (CustomerInquiryServImpl) AC.ac.getBean("customerInquiryServImpl");
		customerServ.execute(model);
		return "redirect:customerMain";
	}

	// 고객센터 문의글 확인
	@RequestMapping("inquiryContent")
	public String inquiryContent(Model model, int cus_num) {
		model.addAttribute("cus_num", cus_num);
		customerServ = (CustomerContentServImpl) AC.ac.getBean("customerContentServImpl");
		customerServ.execute(model);
		return "customer/inquiryContent";
	}

	// 고객센터 닉네임 검색
	@RequestMapping("inquirySearch")
	public String inquirySearch(Model model, CustomerDTO dto, String cus_nick) {
		model.addAttribute("dto", dto);
		model.addAttribute("cus_nick", cus_nick);
		customerServ = (CustomerSearchServImpl) AC.ac.getBean("customerSearchServImpl");
		customerServ.execute(model);
		return "customer/inquirySearch";
	}

	// 문의글 삭제(비밀번호 확인 후 삭제 진행)
	@RequestMapping("deleteChk")
	public String deleteInquiry(Model model, int cus_num, String inputPw) {
		model.addAttribute("cus_num", cus_num);
		model.addAttribute("inputPw", inputPw);
		customerServ = (CustomerPwChkServImpl) AC.ac.getBean("customerPwChkServImpl");

		if((customerServ.chkList(model)) == 1) {
			customerServ = (CustomerDeleteServImpl) AC.ac.getBean("customerDeleteServImpl");
			customerServ.execute(model);
			return "redirect:customerMain";
		}
		return "customer/message";
	}

	// 문의글 수정
	@RequestMapping("inquiryUpdate")
	public String inquiryUpdate(Model model, int cus_num) {
		model.addAttribute("cus_num", cus_num);
		customerServ = (CustomerContentServImpl) AC.ac.getBean("customerContentServImpl");
		customerServ.execute(model);
		return "customer/inquiryUpdate";
	}

	@RequestMapping("updateChk")
	public String updatePwChk(Model model, CustomerDTO dto) {
		model.addAttribute("dto", dto);
		model.addAttribute("cus_num", dto.getCus_num());
		customerServ = (CustomerUpdServImpl) AC.ac.getBean("customerUpdServImpl");
		customerServ.execute(model);
		return "redirect:inquiryContent";
	}

	// 비밀글 확인
	@RequestMapping("contentPwChk")
	public String contentPwChk(Model model, int cus_num, String inputPw) {
		model.addAttribute("inputPw", inputPw);
		model.addAttribute("cus_num", cus_num);
		customerServ = (CustomerPwChkServImpl) AC.ac.getBean("customerPwChkServImpl");

		if((customerServ.chkList(model)) == 1) {
			return "redirect:inquiryContent";
		}
			return "customer/message";
	}




}
