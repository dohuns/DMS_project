package com.KG.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.CustomerDTO;
import com.KG.dto.MemberDTO;
import com.KG.service.admin.member.AdminChkListServImpl;
import com.KG.service.admin.member.AdminDelAllServImpl;
import com.KG.service.admin.member.AdminDelServImpl;
import com.KG.service.admin.member.AdminInsertServImpl;
import com.KG.service.admin.member.AdminRankServImpl;
import com.KG.service.admin.member.AdminRankUpdServImpl;
import com.KG.service.admin.member.AdminSearchServImpl;
import com.KG.service.admin.member.AdminSelectServImpl;
import com.KG.service.admin.member.AdminService;
import com.KG.service.admin.member.AdminUpdServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.sidebar.BoaCatListServImpl;
import com.KG.service.board.sidebar.BoardSidebarService;
import com.KG.service.customer.CustomerAdminListServImpl;
import com.KG.service.customer.CustomerService;

@Controller
public class AdminController {
	AdminService adminServ;
	BoardService boardServ;
	CustomerService customerServ;
	BoardSidebarService boaSideServ;

	/////////////////////////////////////////////////////////////////////////////////////
	// 관리자 페이지 : 목록 출력
	@RequestMapping("admin")
	public String adminPage(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.execute(model);
		return "admin/adminMain";
	}

	// 전체 목록 출력
	@RequestMapping("adminSelectList")
	public String adminSelectList(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.execute(model);
		return "admin/adminSelectList";
	}

	// 등급별 목록 출력
	@RequestMapping("adminRankList")
	public String adminRankList(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminRankServImpl) AC.ac.getBean("adminRankServImpl");
		adminServ.execute(model);
		return "admin/adminRankList";
	}

	// 회원 정보 검색
	@RequestMapping("adminSearchList")
	public String adminSearchList(Model model, MemberDTO dto,
				@RequestParam(defaultValue = "m_id") String searchOption,
				@RequestParam(defaultValue = "") String keyword) {
		model.addAttribute("dto", dto);
		model.addAttribute("searchOption", searchOption);
		model.addAttribute("keyword", keyword);
		adminServ = (AdminSearchServImpl) AC.ac.getBean("adminSearchServImpl");
		adminServ.execute(model);
		return "admin/adminSearchList";
	}

	// 회원 등급 변경 출력
	@RequestMapping("adminUpdRank")
	public String adminUpdRank(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.execute(model);
		return "admin/adminUpdRank";
	}

	// 회원 등급 변경
	@RequestMapping("updChkRank")
	public String updChkRank(Model model, @RequestParam("m_idChk") List<String> m_idChk, int m_rankNum) {
		model.addAttribute("m_idChk", m_idChk);
		model.addAttribute("m_rankNum", m_rankNum);
		adminServ = (AdminRankUpdServImpl) AC.ac.getBean("adminRankUpdServImpl");
		adminServ.execute(model);
		return "redirect:adminUpdRank";
	}

	// 회원 정보 추가
	@RequestMapping("insChkMember")
	public String insChkMember(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminInsertServImpl) AC.ac.getBean("adminInsertServImpl");
		adminServ.execute(model);
		return "redirect:admin";
	}

	// 회원 정보 출력 : 수정
	@RequestMapping("updMember")
	public String updMember(Model model, String m_id) {
		model.addAttribute("m_id", m_id);
		adminServ = (AdminSelectServImpl) AC.ac.getBean("adminSelectServImpl");
		adminServ.execute(model);
		return "admin/updMember";
	}

	// 회원 정보 수정
	@RequestMapping("updChkMember")
	public String updChkMember(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminUpdServImpl) AC.ac.getBean("adminUpdServImpl");
		adminServ.execute(model);
		return "redirect:admin";
	}

	// 회원 정보 삭제
	@RequestMapping("delMember")
	public String delMember(Model model, String m_id, int m_rankNum) {
		model.addAttribute("m_id", m_id);
		adminServ = (AdminDelServImpl) AC.ac.getBean("adminDelServImpl");
		adminServ.execute(model);
		if(m_rankNum > 0) {
			return "redirect:adminRankList?pageNum=0&m_rankNum=" + m_rankNum;
		} else {
			return "redirect:adminSelectList";
		}
	}

	// 회원 정보 선택 삭제
	@RequestMapping("delAllMember")
	public String delAllMember(Model model, @RequestParam("m_idChk") List<String> m_idChk) {
		model.addAttribute("m_idChk", m_idChk);
		adminServ = (AdminDelAllServImpl) AC.ac.getBean("adminDelAllServImpl");
		adminServ.execute(model);
		return "redirect:adminUpdRank";
	}

	/////////////////////////////////////////////////////////////////////////////////////

	// 게시글 관리 > 고객센터
	@RequestMapping("adminCustomerMain")
	public String adminCustomerMain(Model model, CustomerDTO dto) {
		model.addAttribute("dto", dto);
		customerServ = (CustomerAdminListServImpl) AC.ac.getBean("customerAdminListServImpl");
		customerServ.execute(model);
		return "admin/adminCustomerMain";
	}

	/////////////////////////////////////////////////////////////////////////////////////
	// 관리자페이지 > 게시판 목록
	@RequestMapping("boardList")
	public String boardList(Model model) {
		return "admin/boardList";
	}
	
	// 관리자페이지 > 게시판 위치 수정
	@RequestMapping("boardChange")
	public String boardChange(Model model) {
		boaSideServ = (BoaCatListServImpl) AC.ac.getBean("boaCatListServImpl");
		model.addAttribute("category",boaSideServ.execute_Str(model));
		return "admin/boardChange";
	}
	
}
