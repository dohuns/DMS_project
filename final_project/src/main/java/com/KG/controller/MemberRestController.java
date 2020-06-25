package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.service.member.MemberChkIdServiceImpl;
import com.KG.service.member.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MemberRestController {

	
	MemberService memberService;
	
	@GetMapping(value = "overlapId" , produces = "application/json; charset=UTF-8")
	public String chk_id(String m_id, Model model) throws JsonProcessingException {
		System.out.println("h1");
		
		model.addAttribute("m_id" , m_id);
		
		memberService = (MemberChkIdServiceImpl)AC.ac.getBean("memberChkIdServiceImpl");
		
		boolean flag = memberService.execute_Boo(model);
		
		if(flag) {
			return "true";
		}
		
		return "false";
	}

}
