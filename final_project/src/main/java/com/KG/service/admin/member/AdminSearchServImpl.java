package com.KG.service.admin.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminSearchServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> modelMap = model.asMap();
		MemberDTO memberDTO = (MemberDTO) modelMap.get("dto");
		String searchOption = (String) modelMap.get("searchOption");
		String keyword = (String) modelMap.get("keyword");
		int pageNum = memberDTO.getPageNum();
		int start = pageNum * 15 + 1;
		int end = pageNum * 15 + 15;

		// 검색된 회원수 계산
		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("searchOption", searchOption);
		hash.put("keyword", keyword);

		int getRankCount = adminDAO.getSearchCount(hash);
		hash.put("getRankCount", getRankCount);

		// 페이징 처리 후 데이터 출력
		hash.put("start", start);
		hash.put("end", end);

		model.addAttribute("searchList", adminDAO.searchList(hash));
		model.addAttribute("getRankCount", getRankCount);
		model.addAttribute("totalNum", (getRankCount % 15 == 0 ? getRankCount / 15 : getRankCount / 15 + 1) );
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
