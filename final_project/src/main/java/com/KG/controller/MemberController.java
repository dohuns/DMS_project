package com.KG.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.Session;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemberService;
import com.KG.service.member.MemFindIdServImpl;
import com.KG.service.member.MemFindPwServImpl;
import com.KG.service.member.MemChkLoginServImpl;
import com.KG.service.member.MemChkRegistServImpl;

@Controller
public class MemberController {
	@Autowired
	JavaMailSender mailSender;
	MemberService memServ;

//	메인페이지
	@RequestMapping("/")
	public String Home() {
		return "home";
	}

//	로그인페이지
	@RequestMapping("login")
	public String login() {
		return "login/login";
	}
	
	// 로그아웃
	@RequestMapping("logout")
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/";
	}
	
	
//	로그인 확인 후 세션 생성
	@RequestMapping("login_Ck")
	public String login_Ck(Model model, HttpSession session, MemberDTO memberDTO) {
		model.addAttribute("session", session);
		model.addAttribute("memberDTO", memberDTO);
		try {
			memServ = (MemChkLoginServImpl) AC.ac.getBean("memChkLoginServImpl");
			memServ.execute_Str(model);
		} catch (Exception e) {
		}
		return "redirect:/";
	}

//	아이디 찾기 페이지
	@RequestMapping("idInquiry")
	public String idInquiry() {
		return "login/idInquiry";
	}

//	아이디 찾기 결과창
	@RequestMapping("idInquiryChk")
	public String idInquiryChk(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberDTO);
		try {
			memServ = (MemFindIdServImpl) AC.ac.getBean("memFindIdServImpl");
			memServ.execute_Str(model);
		} catch (Exception e) {
		}
		return "login/idInquiryChk";
	}

//	비밀번호 찾기 페이지
	@RequestMapping("pwInquiry")
	public String pwInquiry() {
		return "login/pwInquiry";
	}

//	새로운 비밀번호 설정창
	@RequestMapping("pwInquiryChk")
	public String findPw_end(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberDTO);
		try {
			memServ = (MemFindPwServImpl) AC.ac.getBean("memFindPwServImpl");
			memServ.execute_Str(model);
		} catch (Exception e) {
		}
		return "login/pwInquiryChk";
	}

//	새로운 비밀번호 저장 후 로그인 페이지 이동
	@RequestMapping("findPw_end_save")
	public String findPw_end_save(Model model, MemberDTO memberDTO) {
		model.addAttribute("memberDTO", memberDTO);
		try {
			memServ = (MemFindPwServImpl) AC.ac.getBean("memFindPwServImpl");
			memServ.execute_Int(model);
		} catch (Exception e) {
		}
		return "login/login";
	}

	@RequestMapping("regist_email")
	public String regist_email() {
		return "member/regist_email";
	}

	@PostMapping("email_certify")
	public String certify(HttpServletResponse response, HttpServletRequest request, Model model) throws IOException {

		Random random = new Random();
		int dice = random.nextInt(4589362) + 49311; // 이메일로 받을 인증코드 난수

		String fromMail = "gkgk586@gmail.com"; // 보내는 사람 이메일
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		HttpSession session = request.getSession();
		session.setAttribute("email", tomail);
		String title = "회원가입 인증 이메일 입니다"; // 이메일 제목

		String content = // 이메일 내용
				System.getProperty("line.separator") + // 한줄씩 간격을 주는 코드
						System.getProperty("line.separator") + "안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다."
						+ System.getProperty("line.separator") + System.getProperty("line.separator") + "인증번호는 " + dice
						+ "입니다." + System.getProperty("line.separator") + System.getProperty("line.separator")
						+ "받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";

		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

			messageHelper.setFrom(fromMail); // 보내는 사람 생략x
			messageHelper.setTo(tomail); // 받는사람
			messageHelper.setSubject(title); // 메일 제목 생략o
			messageHelper.setText(content); // 메일 내용

			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		model.addAttribute("dice", dice);

		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		pw.flush();
		return "member/regist_emailChk";
	}

	@PostMapping("chk_certification/{dice}")
	public String chk_certification(@PathVariable String dice, String certificationNum, HttpServletResponse response,
			Model model, HttpSession session) throws IOException {

		System.out.println("입력 값 : " + certificationNum);
		System.out.println("인증 번호 : " + dice);

		if (certificationNum.equals(dice)) {
			String email = (String) session.getAttribute("email");
			model.addAttribute("email", email);

			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			pw.println("<script>alert('인증번호가 일치했습니다. 회원가입 페이지로 넘어갑니다.');</script>");
			pw.flush();
			System.out.println("맞았당!");
			return "member/regist";
		} else {
			response.setContentType("text/html; charset=UTF-8");
			PrintWriter pw = response.getWriter();
			System.out.println("틀렸당!");
			pw.println("<script>alert('인증번호가 일치하지 않습니다. 인증번호를 다시 입력해주세요.');</script>");
			return "redirect:chk_certification/{dice}";
		}
	}
	
//	회원가입
	@PostMapping("chk_reigst") 
	public String chk_reigst(Model model , MemberDTO memberDTO) {
		model.addAttribute("memberDTO" , memberDTO);
		
		memServ = (MemChkRegistServImpl)AC.ac.getBean("memChkRegistServImpl");
		
		memServ.execute_Boo(model);
		
		return "redirect:login";
	}
	
}
