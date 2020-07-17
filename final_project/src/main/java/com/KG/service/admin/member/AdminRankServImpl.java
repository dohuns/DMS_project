package com.KG.service.admin.member;

import java.util.HashMap;
import java.util.List;
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
		MemberDTO memberDTO = (MemberDTO) map.get("dto");

		int m_rankNum = memberDTO.getM_rankNum();
		int pageNum = memberDTO.getPageNum();
		int getRankCount = adminDAO.getRankCount(m_rankNum);

		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", pageNum * 15 + 1);
		hash.put("end", pageNum * 15 + 15);
		hash.put("m_rankNum", m_rankNum);

		model.addAttribute("rankList", adminDAO.rankList(hash));
		model.addAttribute("getRankCount", getRankCount);
		model.addAttribute("totalNum", (getRankCount % 15 == 0 ? getRankCount / 15 : getRankCount / 15 + 1) );
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
