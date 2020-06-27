package com.KG.controller;

import java.util.Random;

import javax.inject.Inject;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemberService;
import com.KG.service.member.MemberServiceFindId_ck;
import com.KG.service.member.MemberServiceFindPw_ck;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MemberRestController {
	@Inject    //서비스를 호출하기 위해서 의존성을 주입
    JavaMailSender mailSender;     //메일 서비스를 사용하기 위해 의존성을 주입함.
	MemberService ser;
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
    
    
//	아이디 찾기 인증번호
    @RequestMapping( value = "findId_ck", method = RequestMethod.POST , produces = "application/json;charset=utf-8")
    @ResponseBody
    public String findId_ck(Model model, MemberDTO dto) throws JsonProcessingException {
    	ObjectMapper mapper = new ObjectMapper();
    	String strJson = mapper.writeValueAsString(dto);
    	model.addAttribute("dto", dto);
    	try {
    		ser = (MemberServiceFindId_ck) AC.ac.getBean("memberServiceFindId_ck");
    		ser.execute_Boo(model);
    		System.out.println(ser.execute_Boo(model));
    		if (ser.execute_Boo(model) == true) {
    			System.out.println(dto.getM_email());
    			return strJson;
    		}
    	} catch (Exception e) {
    	}
    	System.out.println("확인 실패");
    	strJson = "실패";
    	return strJson;
    }
    
    @RequestMapping( value = "findId_send", method =RequestMethod.POST , produces = "application/json;charset=utf-8")
    @ResponseBody
    public int findId_send(MemberDTO dto, HttpServletRequest request, HttpServletResponse response_email) throws Exception {
    	
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
    	return dice;
    }
    
//	비밀번호 찾기 인증번호
    @RequestMapping( value = "findPw_ck", method = RequestMethod.POST , produces = "application/json;charset=utf-8")
    @ResponseBody
    public String findPw_ck(Model model, MemberDTO dto) throws JsonProcessingException {
    	ObjectMapper mapper = new ObjectMapper();
    	String strJson = mapper.writeValueAsString(dto);
    	model.addAttribute("dto", dto);
    	try {
    		ser = (MemberServiceFindPw_ck) AC.ac.getBean("memberServiceFindPw_ck");
    		ser.execute_Boo(model);
    		System.out.println(ser.execute_Boo(model));
    		if (ser.execute_Boo(model) == true) {
    			System.out.println(dto.getM_email());
    			return strJson;
    		}
    	} catch (Exception e) {
    	}
    	System.out.println("확인 실패");
    	strJson = "실패";
    	return strJson;
    }
    
    @RequestMapping( value = "findPw_send", method =RequestMethod.POST , produces = "application/json;charset=utf-8")
    @ResponseBody
    public int findPw_send(MemberDTO dto, HttpServletRequest request, HttpServletResponse response_email) throws Exception {
    	
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
    	return dice;
    }
    
}
