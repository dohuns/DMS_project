package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
public class CustomerController {

	@RequestMapping("customerMain")
	public String customerMain(Model model) {
		return "customer/customerMain";
	}

	@RequestMapping("inquiry")
	public String inquiry(Model model, int cus_categoryNum) {
		model.addAttribute("cus_categoryNum", cus_categoryNum);
		return "customer/customerWrite";
	}
}
