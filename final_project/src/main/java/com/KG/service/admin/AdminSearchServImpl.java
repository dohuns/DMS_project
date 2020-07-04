package com.KG.service.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;

@Service
public class AdminSearchServImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String searchOption = (String) map.get("searchOption");
		String keyword = (String) map.get("keyword");
		model.addAttribute("searchList", adminDAO.searchList(searchOption, keyword));
	}

}
