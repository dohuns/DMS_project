package com.KG.service.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;

@Service
public class MemberServiceLogin_ck implements MemberService{

	@Autowired
	private MemberDAO dao;

	
	@Override
	public boolean execute_Boo(Model model) {
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO)map.get("dto");
		HttpSession session = (HttpSession)map.get("session");
		System.out.println("dao id"+dao.loginck(dto).getM_id());
		System.out.println("dao pw"+dao.loginck(dto).getM_pw());
		System.out.println("dto id"+dto.getM_id());
		System.out.println("dto pw"+dto.getM_pw());
		if (dao.loginck(dto).getM_id().equals(dto.getM_id())&&dao.loginck(dto).getM_pw().equals(dto.getM_pw())) {
			session.setAttribute("m_id", dto.getM_id());
		} else {
			System.out.println("실패");
		}
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

}
