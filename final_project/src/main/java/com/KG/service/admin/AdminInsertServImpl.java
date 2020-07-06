package com.KG.service.admin;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminInsertServImpl implements AdminService {
	@Autowired
	AdminDAO dao;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		// 문자열로 받아왔기때문에 ""안에 넣어주셔야 합니다!
		MemberDTO dto = (MemberDTO)map.get("dto");
		dao.insertMember(dto);
	}

}
