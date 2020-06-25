package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;

@Service
public class MemberChkIdServiceImpl implements MemberService{
	
	@Autowired
	MemberDAO dao;
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		
		String m_id = (String)map.get("m_id");
		
		dao.chk_id(m_id);
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

}
