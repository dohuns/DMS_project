package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;
@Service
public class MemberServiceFindPw_ck implements MemberService{

	@Autowired
	private MemberDAO dao;

	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO) map.get("dto");
		if (dao.findPw(dto) != null) {
			return true;
		}
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO) map.get("dto");
		return dao.findId(dto).getM_id();
	}

	@Override
	public int execute_Int(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO) map.get("dto");
		return dao.findPw_change(dto);
	}

}