package com.KG.controller;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemberService;
import com.KG.service.member.MemberServiceFindId_ck;
import com.KG.service.member.MemberServiceFindPw_ck;
import com.KG.service.member.MemberServiceLogin_ck;

@Controller
public class MemberController {

	MemberService ser;

	@RequestMapping("/")
	public String Home() {
		return "home";
	}

//	회원가입
	@RequestMapping("membership")
	public String member() {
		return "member/membership";
	}

//	로그인페이지
	@RequestMapping("login")
	public String login() {
		return "login/login";
	}

//	로그인 확인
	@RequestMapping("login_Ck")
	public String login_Ck(Model model, HttpSession session, MemberDTO dto) {
		model.addAttribute("session", session);
		model.addAttribute("dto", dto);
		try {
			ser = (MemberServiceLogin_ck) AC.ac.getBean("memberServiceLogin_ck");
			ser.execute_Str(model);
		} catch (Exception e) {
		}
		return "redirect:main";
	}

//	메인
	@RequestMapping("main")
	public String main() {
		return "login/main";
	}

//	아이디 찾기
	@RequestMapping("findId")
	public String findId() {
		return "login/findId";
	}

	@RequestMapping("findId_end")
	public String findId_end(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		try {
			ser = (MemberServiceFindId_ck) AC.ac.getBean("memberServiceFindId_ck");
			ser.execute_Str(model);
		} catch (Exception e) {
		}
		return "login/findId_end";
	}

	@RequestMapping("findPw")
	public String findPw() {
		return "login/findPw";
	}
	
	@RequestMapping("findPw_end")
	public String findPw_end(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		try {
			ser = (MemberServiceFindPw_ck) AC.ac.getBean("memberServiceFindPw_ck");
			ser.execute_Str(model);
		} catch (Exception e) {
		}
		return "login/findPw_end";
	}

	@RequestMapping("findPw_end_save")
	public String findPw_end_save(Model model, MemberDTO dto) {
		model.addAttribute("dto", dto);
		try {
			ser = (MemberServiceFindPw_ck) AC.ac.getBean("memberServiceFindPw_ck");
			ser.execute_Int(model);
		} catch (Exception e) {
		}
		return "login/login";
	}

}
