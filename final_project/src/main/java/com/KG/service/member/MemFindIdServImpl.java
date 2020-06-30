package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;

@Service
public class MemFindIdServImpl implements MemberService {

	@Autowired
	private MemberDAO memberDAO;

//	아이디 찾기 페이지 회원정보 확인
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		if (memberDAO.findId(memberDTO) != null) {
			return true;
		}
		return false;
	}

//	아이디 찾기 후 아이디값 리턴
	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		model.addAttribute("m_id",memberDAO.findId(memberDTO).getM_id());
		return memberDAO.findId(memberDTO).getM_id();
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

}
