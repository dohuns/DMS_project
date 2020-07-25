package com.KG.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.dto.CustomerDTO;
import com.KG.service.customer.CustomerInquiryServImpl;
import com.KG.service.customer.CustomerListServImpl;
import com.KG.service.customer.CustomerMyInquiryServImpl;
import com.KG.service.customer.CustomerService;

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

	// 고객센터 메인 페이지2
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

}
