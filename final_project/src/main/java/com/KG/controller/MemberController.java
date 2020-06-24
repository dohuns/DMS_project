package com.KG.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.Random;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.KG.service.member.MemberService;

@Controller
public class MemberController {

	@Autowired
	JavaMailSender mailSender;
	MemberService memberService;
	
	
	@RequestMapping("member/eamil")
	public String email() {
		return "member/email";
	}
	
	@PostMapping("member/email_certify")
	public ModelAndView certify(HttpServletResponse response,
			HttpServletRequest request, String e_mail) throws IOException {
		
		Random random = new Random();
		int dice = random.nextInt(4589362) + 49311; // 이메일로 받을 인증코드 난수
		
		String fromMail = "gkgk586@gmail.com"; // 보내는 사람 이메일
		String tomail = request.getParameter("e_mail"); // 받는 사람 이메일
		String title = "회원가입 인증 이메일 입니다"; // 이메일 제목
		
		System.out.println("tomail : " + tomail);
		System.out.println("mailSender : " + mailSender);
		
		String content = //이메일 내용
		System.getProperty("line.separator") + // 한줄씩 간격을 주는 코드
		System.getProperty("line.separator") +
		"안녕하세요 회원님 저희 홈페이지를 찾아주셔서 감사합니다." +
		System.getProperty("line.separator") + 
		System.getProperty("line.separator") +
		"인증번호는 " + dice + "입니다." +
		System.getProperty("line.separator") +
		System.getProperty("line.separator") +
		"받으신 인증번호를 홈페이지에 입력해 주시면 다음으로 넘어갑니다.";
		
		try {
			MimeMessage message = mailSender.createMimeMessage();
			MimeMessageHelper messageHelper = new MimeMessageHelper(message, true , "UTF-8");
			
			messageHelper.setFrom(fromMail); // 보내는 사람 생략x
			messageHelper.setTo(tomail); // 받는사람 
			messageHelper.setSubject(title); // 메일 제목 생략o
			messageHelper.setText(content); // 메일 내용
			
			mailSender.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("member/certify_page");
		mv.addObject("dice" , dice);
		System.out.println("mv : " + mv);
		
		response.setContentType("text/html; charset=UTF-8");
		PrintWriter pw = response.getWriter();
		pw.println("<script>alert('이메일이 발송되었습니다. 인증번호를 입력해주세요.');</script>");
		pw.flush();
		
		return mv;
	}
	
	@RequestMapping("member/certify_page")
	public String certify_page() {
		return "member/certify_page";
	}
	
}
