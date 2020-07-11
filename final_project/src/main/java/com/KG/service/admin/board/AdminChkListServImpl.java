package com.KG.service.admin.board;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;

@Service
public class AdminChkListServImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void adminList(Model model) {
		model.addAttribute("memberList", adminDAO.memberList());
	}

	@Override
	public boolean execute_Boo(Model model) {
		// TODO Auto-generated method stub
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
