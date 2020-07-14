package com.KG.service.admin.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminRankServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int m_rankNum = (Integer) map.get("m_rankNum");
		model.addAttribute("rankList", adminDAO.rankList(m_rankNum));
		model.addAttribute("getRankCount", adminDAO.getRankCount(m_rankNum));
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
