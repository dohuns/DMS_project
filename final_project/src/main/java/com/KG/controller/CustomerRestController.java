package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.service.customer.CustomerPwChkServImpl;
import com.KG.service.customer.CustomerService;

@RestController
public class CustomerRestController {
	CustomerService customerServ;

	@RequestMapping(value = "CusUpdPwChk", produces = "application/json;charset=utf-8")
	public int updateChk(Model model, String inputPw , int cus_num) {
		model.addAttribute("inputPw", inputPw);
		model.addAttribute("cus_num", cus_num);
		customerServ = (CustomerPwChkServImpl) AC.ac.getBean("customerPwChkServImpl");
		return customerServ.chkList(model);
	}
}
