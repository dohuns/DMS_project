package com.KG.service.admin.member;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CustomerDAO;
import com.KG.dto.CustomerDTO;
import com.KG.dto.MemberDTO;

@Service
public class AdminInquiryListServImpl implements AdminService {
	@Autowired
	CustomerDAO customerDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		CustomerDTO customerDTO = (CustomerDTO) map.get("dto");

		int pageNum = customerDTO.getPageNum();
		int cus_categoryNum = customerDTO.getCus_categoryNum();
		int pageCount = customerDAO.adminInquiryCount(cus_categoryNum);

		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", pageNum * 15 + 1);
		hash.put("end", pageNum * 15 + 15);
		hash.put("cus_categoryNum", cus_categoryNum);

		model.addAttribute("inquiryList", customerDAO.adminInquiryList(hash));
		model.addAttribute("totalNum", (pageCount % 15 == 0 ? pageCount / 15 : pageCount / 15 + 1));
	}

	@Override
	public MemberDTO memberList(Model model) {
		return null;
	}

}
