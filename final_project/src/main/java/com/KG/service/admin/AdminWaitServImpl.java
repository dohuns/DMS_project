package com.KG.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminWaitServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		model.addAttribute("waitList", adminDAO.waitList());
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
