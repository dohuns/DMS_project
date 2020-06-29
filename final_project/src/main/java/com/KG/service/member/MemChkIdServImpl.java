package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;

@Service
public class MemChkIdServImpl implements MemberService{
	
	@Autowired
	MemberDAO memberDAO;
	
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		String m_id = (String)map.get("m_id");
		String id = memberDAO.chk_id(m_id);
		if(id == null) {
			return false;
		}
		return true;
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
