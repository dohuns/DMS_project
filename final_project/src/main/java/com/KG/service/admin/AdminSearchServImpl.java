package com.KG.service.admin;

import java.util.HashMap;
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
		Map<String, Object> modelMap = model.asMap();
		String searchOption = (String) modelMap.get("searchOption");
		String keyword = (String) modelMap.get("keyword");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("searchOption", searchOption);
		map.put("keyword", keyword);

		model.addAttribute("searchList", adminDAO.searchList(map));
	}

}
