package com.KG.loginAPI;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;

@Service
public class overlapEmail {

	@Autowired
	MemberDAO dao;
	
	public boolean execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		String email = (String)map.get("email");
		if(dao.chkEmail(email) == null) {
			model.addAttribute("email" , email);
			return true;
		}
		return false;
	}
	
}
