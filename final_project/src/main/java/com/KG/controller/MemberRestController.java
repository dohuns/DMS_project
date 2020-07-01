package com.KG.controller;

import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemChkEmailServImpl;
import com.KG.service.member.MemChkIdServImpl;
import com.KG.service.member.MemberService;
import com.KG.service.member.MemFindIdServImpl;
import com.KG.service.member.MemFindPwServImpl;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MemberRestController {
	@Autowired
	JavaMailSender mailSender; // 메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService memServ;

//	아이디 찾기 페이지 회원정보 확인 후 이메일 전송
	@RequestMapping(value = "findId_ck", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findId_ck(Model model, MemberDTO memberDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		try {
			memServ = (MemFindIdServImpl) AC.ac.getBean("memFindIdServImpl");
			memServ.execute_Boo(model);
			System.out.println(memServ.execute_Boo(model));
			if (memServ.execute_Boo(model) == true) {
				System.out.println(memberDTO.getM_email());
				return strJson;
			}
		} catch (Exception e) {
		}
		System.out.println("확인 실패");
		strJson = "실패";
		return strJson;
	}


//	비밀번호 찾기 페이지 회원정보 확인 후 이메일 전송
	@RequestMapping(value = "findPw_ck", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public String findPw_ck(Model model, MemberDTO memberDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(memberDTO);
		model.addAttribute("memberDTO", memberDTO);
		try {
			memServ = (MemFindPwServImpl) AC.ac.getBean("memFindPwServImpl");
			memServ.execute_Boo(model);
			System.out.println(memServ.execute_Boo(model));
			if (memServ.execute_Boo(model) == true) {
				System.out.println(memberDTO.getM_email());
				return strJson;
			}
		} catch (Exception e) {
		}
		System.out.println("확인 실패");
		strJson = "실패";
		return strJson;
	}

//	이메일 발송
	@RequestMapping(value = "send", method = RequestMethod.POST, produces = "application/json;charset=utf-8")
	@ResponseBody
	public int findPw_send(MemberDTO memberDTO, HttpServletRequest request, HttpServletResponse response_email)
			throws Exception {

		Random r = new Random();
		int dice = r.nextInt(4589362) + 49311; // 이메일로 받는 인증코드 부분 (난수)

		String tomail = memberDTO.getM_email(); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다."; // 제목
		String content = " 인증번호는 " + dice + " 입니다. ";
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setTo(tomail); // 받는사람 이메일
			messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			System.out.println(e);
		}

		response_email.setContentType("text/html; charset=UTF-8");
		return dice;
	}
	// 회원가입 페이지에서 아이디 중복체크
	@GetMapping(value = "overlapId", produces = "application/json; charset=UTF-8")
	public String chk_id(String m_id, Model model) throws JsonProcessingException {

		model.addAttribute("m_id", m_id);

		memServ = (MemChkIdServImpl) AC.ac.getBean("memChkIdServImpl");

		boolean flag = memServ.execute_Boo(model);

		if (flag) {
			return "true";
		}
		return "false";
	}
	
	// 이메일 중복 체크
	@GetMapping(value = "chkEmail", produces = "application/json; charset=UTF-8")
	public String chkEmail(@RequestParam("m_email") String m_email, Model model) {
		System.out.println("중복체크당");
		System.out.println("con mail : " + m_email);
		model.addAttribute("m_email" , m_email);
		
		memServ = (MemChkEmailServImpl)AC.ac.getBean("memChkEmailServImpl");
		
		boolean flag = memServ.execute_Boo(model);
		System.out.println("flag : " + flag);
		if(flag) {
			return "true";
		}
		return "false";
	}
}
