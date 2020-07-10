package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.MemberDTO;
import com.KG.service.admin.member.AdminSelectServImpl;
import com.KG.service.admin.member.AdminService;

@RestController
public class AdminRestController {
	AdminService adminServ;

	// 회원 관리 > 수정
	@GetMapping(value = "updateMember", produces = "application/json; charset=UTF-8")
	public MemberDTO updateMember(Model model, String m_id) {
		model.addAttribute("m_id", m_id);
		adminServ = (AdminSelectServImpl) AC.ac.getBean("adminSelectServImpl");
		return adminServ.memberList(model);
	}

}
