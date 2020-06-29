package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.MemberDTO;
import com.KG.service.member.MemChkRegistServImpl;
import com.KG.service.member.MemChkIdServImpl;
import com.KG.service.member.MemberService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class MemberRestController {

	
	MemberService memServ;
	
	@GetMapping(value = "overlapId" , produces = "application/json; charset=UTF-8")
	public String chk_id(String m_id, Model model) throws JsonProcessingException {
		
		model.addAttribute("m_id" , m_id);
		
		memServ = (MemChkIdServImpl)AC.ac.getBean("memChkIdServImpl");
		
		boolean flag = memServ.execute_Boo(model);
		
		if(flag) {
			return "true";
		}
		
		return "false";
	}
	 

	
	
}
