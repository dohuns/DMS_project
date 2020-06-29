package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;
import com.KG.dto.MemberDTO;

@Service
public class MemChkRegistServImpl implements MemberService{
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		
		MemberDTO dto = (MemberDTO)map.get("dto");
		
		dao.addMember(dto);
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}

	
	
}
