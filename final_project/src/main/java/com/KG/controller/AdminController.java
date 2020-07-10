package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.MemberDTO;
import com.KG.service.admin.member.AdminChkListServImpl;
import com.KG.service.admin.member.AdminDelServImpl;
import com.KG.service.admin.member.AdminInsertServImpl;
import com.KG.service.admin.member.AdminRankServImpl;
import com.KG.service.admin.member.AdminSearchServImpl;
import com.KG.service.admin.member.AdminSelectServImpl;
import com.KG.service.admin.member.AdminService;
import com.KG.service.admin.member.AdminUpdServImpl;

@Controller
public class AdminController {
	AdminService adminServ;

	// 회원 목록
	@RequestMapping("admin")
	public String adminPage(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.execute(model);
		return "admin/adminMain";
	}

	// 회원 등급별 목록 출력
	@RequestMapping("adminRankList")
	public String adminRankList(Model model, int m_rankNum) {
		model.addAttribute("m_rankNum", m_rankNum);
		adminServ = (AdminRankServImpl) AC.ac.getBean("adminRankServImpl");
		adminServ.execute(model);
		return "admin/adminRankList";
	}

	// 회원 전체 목록 출력
	@RequestMapping("adminSelectList")
	public String adminSelectList(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.execute(model);
		return "admin/adminSelectList";
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
	public String delMember(Model model, String m_id) {
		model.addAttribute("m_id", m_id);
		adminServ = (AdminDelServImpl) AC.ac.getBean("adminDelServImpl");
		adminServ.execute(model);
		return "redirect:admin";
	}

}
