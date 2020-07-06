package com.KG.service.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;

@Service
public class MemChkLoginServImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

	@Override
	public boolean execute_Boo(Model model) {
		return false;
	}

//	로그인 확인 및 세션 생성
	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		HttpSession session = (HttpSession) map.get("session");
		if (memberDAO.loginck(memberDTO).getM_id().equals(memberDTO.getM_id()) && memberDAO.loginck(memberDTO).getM_pw().equals(memberDTO.getM_pw())) {
			session.setAttribute("m_nick", memberDAO.loginck(memberDTO).getM_nick());
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
