package com.KG.service.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;

@Service
public class AdminSelectServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		String m_id = (String) map.get("m_id");
		System.out.println("Impl " + m_id);
		model.addAttribute("infoList", adminDAO.selectInfoList(m_id));
	}

}
