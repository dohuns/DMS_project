package com.KG.loginAPI;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;

@Service
public class autoLogin {

	@Autowired
	MemberDAO dao;
	
	public void execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		String email = (String)map.get("email");
		
		MemberDTO dto =  dao.getMember(email);
		session.setAttribute("m_id", dto.getM_id());
		session.setAttribute("m_nick", dto.getM_nick());
		
		
				
	}
	
}
