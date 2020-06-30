package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;
@Service
public class MemFindPwServImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;

//	비밀번호 찾기 페이지 회원정보 확인
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		if (memberDAO.findPw(memberDTO) != null) {
			return true;
		}
		return false;
	}

//	비밀번호 찾기 시 아이디 값 확인
	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		return memberDAO.findId(memberDTO).getM_id();
	}

//	새로운 비밀번호 저장
	@Override
	public int execute_Int(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO memberDTO = (MemberDTO) map.get("memberDTO");
		return memberDAO.findPw_change(memberDTO);
	}

}
