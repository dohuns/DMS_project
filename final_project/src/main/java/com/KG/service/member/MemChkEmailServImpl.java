package com.KG.service.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.MemberDAO;

@Service
public class MemChkEmailServImpl implements MemberService{

	@Autowired
	MemberDAO memberDAO;
	
	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		
		String email  = (String)map.get("m_email");
		System.out.println("ser mail : " + email);
		
		String m_email = memberDAO.chkEmail(email);
		System.out.println("dao mail : " + m_email);
		
		if(m_email == null) {
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
