package com.KG.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.MemberDTO;
import com.KG.service.admin.AdminChkListServImpl;
import com.KG.service.admin.AdminInsertServImpl;
import com.KG.service.admin.AdminSearchServImpl;
import com.KG.service.admin.AdminSelectServImpl;
import com.KG.service.admin.AdminService;
import com.KG.service.admin.AdminUpdServImpl;

@Controller
public class AdminController {
	AdminService adminServ;

	// 회원 목록
	@RequestMapping("admin")
	public String adminPage(Model model) {
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

	// 회원 관리 > 회원 추가 페이지
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
		return "redirect:admin";
	}

	// 회원 관리 > 회원 수정 페이지
	@RequestMapping("updMember")
	public String updMember(Model model, String m_id) {
		model.addAttribute("m_id", m_id);
		adminServ = (AdminSelectServImpl) AC.ac.getBean("adminSelectServImpl");
		adminServ.execute(model);
		return "admin/updMember";
	}

	// 회원 관리 > 회원 정보 수정 진행
	@RequestMapping("updChkMember")
	public String updChkMember(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminUpdServImpl) AC.ac.getBean("adminUpdServImpl");
		adminServ.execute(model);
		return "redirect:admin";
	}

	// 회원 관리 > 회원 삭제
	@RequestMapping("delMember")
	public String delMember() {
		return "admin/delMember";
	}
}
