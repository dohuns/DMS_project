package com.KG.service.admin;


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

}
