package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomerController {

	@RequestMapping("customerMain")
	public String customerMain(Model model) {
		return "customer/customerMain";
	}
}
