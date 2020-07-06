package com.KG.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.MemberDTO;
import com.KG.service.admin.AdminChkListServImpl;
import com.KG.service.admin.AdminInsertServImpl;
import com.KG.service.admin.AdminSearchServImpl;
import com.KG.service.admin.AdminService;

@Controller
public class AdminController {
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

	// 회원 관리 > 검색 결과 출력
	@RequestMapping("searchMember")
	public String searchMember(Model model,
								@RequestParam(defaultValue = "m_id") String searchOption,
								@RequestParam(defaultValue = "") String keyword) {
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		adminServ = (AdminSearchServImpl) AC.ac.getBean("adminSearchServImpl");
		adminServ.execute(model);
		return "admin/manageList";
	}

	// 회원 관리 > 회원 추가
	@RequestMapping("insMember")
	public String insMember() {
		return "admin/insMember";
	}

	// 회원관리 > 회원 추가 진행
	@RequestMapping("insChkMember")
	public String insChkMember(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminInsertServImpl) AC.ac.getBean("adminInsertServImpl");
		adminServ.execute(model);
		return "redirect:admin_chkList";
	}

	// 회원 관리 > 회원 수정
	@RequestMapping("updMember")
	public String updMember() {
		return "admin/updMember";
	}

	// 회원 관리 > 회원 삭제
	@RequestMapping("delMember")
	public String delMember() {
		return "admin/delMember";
	}
}
