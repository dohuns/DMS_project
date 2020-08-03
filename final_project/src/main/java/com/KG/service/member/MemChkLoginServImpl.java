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

//	내정보 비밀번호 확인
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		HttpSession session = (HttpSession) map.get("session");

		memberDTO.setM_id((String) session.getAttribute("m_id"));

		if (memberDAO.loginck(memberDTO).getM_pw().equals(memberDTO.getM_pw())) {
			return true;
		} else {
			return false;
		}
	}

//	로그인 확인 및 세션 생성
	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		HttpSession session = (HttpSession) map.get("session");

		if (memberDAO.loginck(memberDTO).getM_id().equals(memberDTO.getM_id())
				&& memberDAO.loginck(memberDTO).getM_pw().equals(memberDTO.getM_pw())
				&& memberDAO.loginck(memberDTO).getM_rankNum() != 5) {
			session.setAttribute("m_nick", memberDAO.loginck(memberDTO).getM_nick());
			session.setAttribute("m_id", memberDAO.loginck(memberDTO).getM_id());
			session.setAttribute("m_rankNum", memberDAO.loginck(memberDTO).getM_rankNum());
		} else {
			return "실패";
		}
		return "성공";
	}

//	내정보 확인
	@Override
	public int execute_Int(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		HttpSession session = (HttpSession) map.get("session");
		memberDTO.setM_id((String) session.getAttribute("m_id"));

		session.setAttribute("m_id", memberDAO.loginck(memberDTO).getM_id());
		session.setAttribute("m_name", memberDAO.loginck(memberDTO).getM_name());
		session.setAttribute("m_nick", memberDAO.loginck(memberDTO).getM_nick());
		session.setAttribute("m_birth", memberDAO.loginck(memberDTO).getM_birth());
		session.setAttribute("m_picture", memberDAO.loginck(memberDTO).getM_picture());
		session.setAttribute("m_email", memberDAO.loginck(memberDTO).getM_email());
		return 0;
	}

}
