package com.KG.service.member;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;
@Service
public class MemPwChangServImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

//	비밀번호 찾기 페이지 회원정보 확인
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		HttpSession session = (HttpSession) map.get("session");

		memberDTO.setM_id((String) session.getAttribute("m_id"));
		
		session.setAttribute("m_id", memberDAO.loginck(memberDTO).getM_id());
		session.setAttribute("m_name", memberDAO.loginck(memberDTO).getM_name());
		session.setAttribute("m_email", memberDAO.loginck(memberDTO).getM_email());
		return false;
	}

//	비밀번호 찾기 시 아이디 값 확인
	@Override
	public String execute_Str(Model model) {
		return null;
	}

//	새로운 비밀번호 저장
	@Override
	public int execute_Int(Model model) {
		return 0;
	}

}
