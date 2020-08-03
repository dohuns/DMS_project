package com.KG.service.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminRankUpdServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		int m_rankNum = (Integer) map.get("m_rankNum");
		List<String> arrIdx = (List<String>) map.get("m_idChk");
		for(int i = 0; i < arrIdx.size(); i++) {
			MemberDTO dto = new MemberDTO();
			dto.setM_id(arrIdx.get(i));
			dto.setM_rankNum(m_rankNum);
			if(m_rankNum == 1) {
				dto.setM_rank("관리자");
			} else if(m_rankNum == 2) {
				dto.setM_rank("스탭");
			} else if(m_rankNum == 3) {
				dto.setM_rank("일반회원");
			} else if(m_rankNum == 4) {
				dto.setM_rank("대기회원");
			} else {
				dto.setM_rank("탈퇴회원");
			}
			System.out.println("adminrank : " + dto.getM_id() + ", " + dto.getM_rank() + ", " + dto.getM_rankNum());
			adminDAO.updRankMember(dto);
		}
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
