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

	// 회원 목록
	@RequestMapping("admin")
	public String adminPage() {
		return "redirect:admin_chkList";
	}

	// 회원 목록 출력
	@RequestMapping("admin_chkList")
	public String adminChkList(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.execute(model);
		return "admin/memberList";
	}

	// 회원 관리
	@RequestMapping("management")
	public String manageList() {
		return "admin/manageList";
	}

	// 회원 관리 > 회원 추가
	@RequestMapping("insMember")
	public String insMember() {
		return "admin/insMember";
	}
}
