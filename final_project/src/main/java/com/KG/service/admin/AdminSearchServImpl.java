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
		if(searchOption.equals("m_rank")) {
			if(keyword.contains("관") || keyword.contains("리") || keyword.contains("자")) {
				map.put("keyword", "1");
			} else if(keyword.contains("스") || keyword.contains("탭")) {
				map.put("keyword", "2");
			} else if(keyword.contains("일") || keyword.contains("반")) {
				map.put("keyword", "3");
			} else if(keyword.contains("대") || keyword.contains("기")) {
				map.put("keyword", "4");
			} else {
				map.put("keyword", keyword);
			}
		} else {
			map.put("keyword", keyword);
		}

		model.addAttribute("searchList", adminDAO.searchList(map));
	}

}
