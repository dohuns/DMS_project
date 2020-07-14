package com.KG.service.admin.member;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminUpdServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		MemberDTO dto = (MemberDTO) map.get("dto");
		if (dto.getM_rankNum() == 1) {
			dto.setM_rank("관리자");
		} else if (dto.getM_rankNum() == 2) {
			dto.setM_rank("스탭");
		} else if (dto.getM_rankNum() == 3) {
			dto.setM_rank("일반회원");
		} else {
			dto.setM_rank("대기회원");
		}
		adminDAO.updateMember(dto);
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
