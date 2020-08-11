package com.KG.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.CustomerDTO;
import com.KG.dto.MemberDTO;
import com.KG.service.admin.member.AdminDelRankServImpl;
import com.KG.service.admin.member.AdminInquiryAnswerServImpl;
import com.KG.service.admin.member.AdminInquiryHoldServImpl;
import com.KG.service.admin.member.AdminInquiryListServImpl;
import com.KG.service.admin.member.AdminMemberListServImpl;
import com.KG.service.admin.member.AdminService;
import com.KG.service.admin.member.AdminUpdRankServImpl;
import com.KG.service.board.BoaAdminListServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.sidebar.BoaUserInfoServImpl;
import com.KG.service.board.sidebar.BoardSidebarService;
import com.KG.service.customer.CustomerContentServImpl;
import com.KG.service.customer.CustomerService;

@Controller
public class AdminController {
	AdminService adminServ;
	BoardService boardServ;
	CustomerService customerServ;
	BoardSidebarService boaSideServ;

	@RequestMapping("admin")
	public String admin(Model model) {
		boardServ = (BoaAdminListServImpl) AC.ac.getBean("boaAdminListServImpl");
		boardServ.execute_Boo(model);
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
	@RequestMapping("adminUpdRank")
	public String adminUpdRank(Model model, MemberDTO dto,
			@RequestParam("m_idChk") List<String> m_idChk) {
		model.addAttribute("m_idChk", m_idChk);
		model.addAttribute("m_rankNum", dto.getM_rankNum());
		adminServ = (AdminUpdRankServImpl) AC.ac.getBean("adminUpdRankServImpl");
		adminServ.execute(model);
		return "redirect:adminMemberList?m_rankNum=" + dto.getM_rankNum();
	}

	// 회원 관리 : 회원 목록 출력 > 삭제
	@RequestMapping("adminDelRank")
	public String adminDelList(Model model, MemberDTO dto,
			@RequestParam("m_idChk") List<String> m_idChk) {
		model.addAttribute("m_idChk", m_idChk);
		adminServ = (AdminDelRankServImpl) AC.ac.getBean("adminDelRankServImpl");
		adminServ.execute(model);
		return "redirect:adminMemberList?m_rankNum=" + dto.getM_rankNum();
	}

	// 회원 관리 : 회원 목록 출력 > 회원 정보 출력
	@RequestMapping("adminMemberInfo")
	public String adminMemberList(Model model, String cus_id) {
		model.addAttribute("id", cus_id);
		boaSideServ = (BoaUserInfoServImpl) AC.ac.getBean("boaUserInfoServImpl");
		boaSideServ.execute_Boo(model);
		return "admin/adminMemberInfo";
	}

	// 회원 관리 추가 예정 : 아이디 선택 시 해당 회원의 정보 출력 : 버튼 클릭 시 수정 가능

	// 서비스 관리 : 문의 내역 출력
	@RequestMapping("adminInquiryList")
	public String adminInquiryList(Model model, CustomerDTO dto) {
		model.addAttribute("dto", dto);
		adminServ = (AdminInquiryListServImpl) AC.ac.getBean("adminInquiryListServImpl");
		adminServ.execute(model);
		return "admin/adminInquiryList";
	}

	// 서비스 관리 : 문의글 확인
	@RequestMapping("adminInquiryContent")
	public String adminInquiryContent(Model model, int cus_num) {
		model.addAttribute("cus_num", cus_num);
		customerServ = (CustomerContentServImpl) AC.ac.getBean("customerContentServImpl");
		customerServ.execute(model);
		return "admin/adminInquiryContent";
	}

	// 서비스 관리 : 문의글 확인 > 답글 보류 선택
	@RequestMapping("adminInquiryHold")
	public String adminInquiryHold(Model model, int cus_num) {
		model.addAttribute("cus_num", cus_num);
		customerServ = (AdminInquiryHoldServImpl) AC.ac.getBean("adminInquiryHoldServImpl");
		customerServ.execute(model);
		return "redirect:adminInquiryContent?cus_num=" + cus_num;
	}

	// 서비스 관리 : 문의글 확인 > 답글 등록 선택 > 답글 화면
	@RequestMapping("adminInquiryAnswer")
	public String adminInquiryAnswer(Model model, CustomerDTO dto) {
		model.addAttribute("dto", dto);
		model.addAttribute("cus_num", dto.getCus_num());
		customerServ = (CustomerContentServImpl) AC.ac.getBean("customerContentServImpl");
		customerServ.execute(model);
		return "admin/adminInquiryAnswer";
	}

	// 서비스 관리 : 문의글 확인 > 답글 등록 선택 > 답글 저장
	@RequestMapping("adminInquiryAnswerChk")
	public String adminInquiryAnswerChk(Model model, CustomerDTO dto, HttpSession session) {
		model.addAttribute("dto", dto);
		model.addAttribute("cus_nick", session.getAttribute("m_nick"));
		customerServ = (AdminInquiryAnswerServImpl) AC.ac.getBean("adminInquiryAnswerServImpl");
		customerServ.execute(model);
		System.out.println("controller: " + dto.getCus_categoryNum());
		return "redirect:adminInquiryList?cus_categoryNum=" + dto.getCus_categoryNum();
	}




}
