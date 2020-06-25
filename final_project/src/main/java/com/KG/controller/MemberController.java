package com.KG.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemberServiceLogin_ck;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class MemberController {
	
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
    
	@Autowired
	MemberServiceLogin_ck memberservice;
	
	@RequestMapping("/")
	public String Home() {
		return "home";
	}
	@RequestMapping("membership")
	public String member() {
		return "member/membership";
	}
	
	// mailSending 코드
    @RequestMapping( value = "membership_ck", method =RequestMethod.POST , produces = "application/json;charset=utf-8")
    @ResponseBody
    public String mailSending(MemberDTO dto, HttpServletRequest request, HttpServletResponse response_email) throws Exception {

    	ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(dto);
    	System.out.println(dto.getM_email());
        Random r = new Random();
        int dice = r.nextInt(4589362) + 49311; //이메일로 받는 인증코드 부분 (난수)
        
        String setfrom = "zlt02141@gamil.com";
        String tomail = dto.getM_email(); // 받는 사람 이메일
        String title = "회원가입 인증 이메일 입니다."; // 제목
        String content = " 인증번호는 " +dice+ " 입니다. ";
        try {
            MimeMessage message = mailSender.createMimeMessage();
            MimeMessageHelper messageHelper = new MimeMessageHelper(message, true, "UTF-8");

            messageHelper.setFrom(setfrom); // 보내는사람 생략하면 정상작동을 안함
            messageHelper.setTo(tomail); // 받는사람 이메일
            messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
            messageHelper.setText(content); // 메일 내용
            
            mailSender.send(message);
        } catch (Exception e) {System.out.println(e);}
        
        response_email.setContentType("text/html; charset=UTF-8");
        return strJson;
    }
    
    @RequestMapping("login")
    public String login() {
    	return "login/login";
    }
    
    @RequestMapping("login_Ck")
    public String login_Ck(Model model , HttpSession session, MemberDTO dto) {
    	model.addAttribute("session",session);
    	model.addAttribute("dto",dto);
    	System.out.println(dto);
    	try {
			memberservice.execute_Str(model);
		} catch (Exception e) {
		}
    	return "redirect:main";
    }
    @RequestMapping("main")
    public String main() {
    	return "login/main";
    }

    @RequestMapping("findId")
	public String findId() {
		return "login/findId";
	}
    
    @RequestMapping("findId_ck")
	public String findId_ck() {
		return "login/findId";
	}

    @RequestMapping("findPw")
    public String findPw() {
    	return "login/findPw";
    }

    @RequestMapping("findPw_ck")
    public String findPw_ck() {
    	return "login/findPw";
    }
    
}
