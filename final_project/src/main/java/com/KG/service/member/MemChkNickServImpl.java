package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;

@Service
public class MemChkNickServImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		String m_nick = (String)map.get("m_nick");
		
		String result = memberDAO.chkNick(m_nick);
		System.out.println("dao 결과 : " + result );
		if(result == null) {
			return true;
		}
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
