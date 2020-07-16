package com.KG.service.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminDelAllServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		List<String> arrIdx = (List<String>) map.get("m_idChk");
		for(int i = 0; i < arrIdx.size(); i++) {
			adminDAO.deleteMember(arrIdx.get(i));
		}
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
