package com.KG.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.service.member.MemberChkIdServiceImpl;
import com.KG.service.member.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MemberRestController {

	
	MemberService memberService;
	
	@GetMapping("chk_id")
	public boolean chk_id(String m_id) throws JsonProcessingException {
		boolean flag = true;
		System.out.println("h1");
		
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(m_id);
		
		memberService = (MemberChkIdServiceImpl)AC.ac.getBean("memberChkIdServiceImpl");
				
		
		return flag;
	}
}
