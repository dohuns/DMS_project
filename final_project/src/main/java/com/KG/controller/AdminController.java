package com.KG.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.MemberDTO;
import com.KG.service.admin.member.AdminDelListServImpl;
import com.KG.service.admin.member.AdminMemberListServImpl;
import com.KG.service.admin.member.AdminService;
import com.KG.service.board.BoardService;
import com.KG.service.board.sidebar.BoardSidebarService;
import com.KG.service.customer.CustomerService;

@Controller
public class AdminController {
	AdminService adminServ;
	BoardService boardServ;
	CustomerService customerServ;
	BoardSidebarService boaSideServ;

	@RequestMapping("admin")
	public String admin(Model model) {
		return "admin/adminMain";
	}

	// 회원 관리 : 회원 목록 출력
	@RequestMapping("adminMemberList")
	public String adminMemberList(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminMemberListServImpl) AC.ac.getBean("adminMemberListServImpl");
		adminServ.execute(model);
		return "admin/adminMemberList";
	}

	// 회원 관리 : 회원 목록 출력 > 등급 변경

	// 회원 관리 : 회원 목록 출력 > 삭제
	@RequestMapping("adminDelList")
	public String adminDelList(Model model, MemberDTO dto,
				@RequestParam("m_idChk") List<String> m_idChk) {
		model.addAttribute("m_idChk", m_idChk);
		adminServ = (AdminDelListServImpl) AC.ac.getBean("adminDelListServImpl");
		adminServ.execute(model);
		return "redirect:adminMemberList?m_rankNum=" + dto.getM_rankNum();
	}




}
