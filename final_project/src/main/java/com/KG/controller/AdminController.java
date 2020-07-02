package com.KG.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.service.admin.AdminChkListServImpl;
import com.KG.service.admin.AdminService;

@Controller
public class AdminController {
	@Autowired
	AdminService adminServ;

	// 관리자 페이지 > 회원 목록
	@RequestMapping("admin")
	public String adminPage() {
		return "redirect:admin_chkList";
	}

	// 관리자 페이지 > 회원 목록 출력
	@RequestMapping("admin_chkList")
	public String adminChkList(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.adminList(model);
		return "admin/memberList";
	}
}
