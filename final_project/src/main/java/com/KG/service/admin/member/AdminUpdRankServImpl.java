package com.KG.service.admin.member;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.AdminDAO;
import com.KG.dto.MemberDTO;

@Service
public class AdminUpdRankServImpl implements AdminService {
	@Autowired
	AdminDAO adminDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();

		List<String> arrIdx = (List<String>) map.get("m_idChk");
		int m_rankNum = (int) map.get("m_rankNum");
		for(int i = 0; i < arrIdx.size(); i++) {
			MemberDTO dto = new MemberDTO();
			dto.setM_id(arrIdx.get(i));
			dto.setM_rankNum(m_rankNum);
			dto.setM_rank( (m_rankNum == 1 ? "관리자" :
							m_rankNum == 2 ? "스탭" :
							m_rankNum == 3 ? "일반회원" :
							m_rankNum == 4 ? "대기회원" : "탈퇴회원" ));
			adminDAO.updRank(dto);
		}
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
