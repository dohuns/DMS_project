package com.KG.service.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminChkListServImpl implements AdminService {
	@Autowired
	private AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		model.addAttribute("memberList", adminDAO.memberList());
		model.addAttribute("memberCount", adminDAO.getMemberCount());
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
