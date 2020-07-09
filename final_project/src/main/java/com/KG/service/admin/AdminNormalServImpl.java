package com.KG.service.admin;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;

@Service
public class AdminNormalServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		model.addAttribute("normalList", adminDAO.normalList());
	}

}
