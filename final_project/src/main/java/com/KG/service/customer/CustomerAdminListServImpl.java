package com.KG.service.customer;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CustomerDAO;
import com.KG.dto.CustomerDTO;

@Service
public class CustomerAdminListServImpl implements CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	// 관리자 페이지 > 고객센터 내역 조회
	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		CustomerDTO customerDTO = (CustomerDTO) map.get("dto");

		int pageNum = customerDTO.getPageNum();
		int cus_categoryNum = customerDTO.getCus_categoryNum();
		int pageCount = customerDAO.getCustomerCount(cus_categoryNum);

		HashMap<String, Object> hash = new HashMap<String, Object>();
		hash.put("start", pageNum * 15 + 1);
		hash.put("end", pageNum * 15 + 15);
		hash.put("cus_categoryNum", cus_categoryNum);

		model.addAttribute("customerList", customerDAO.customerList(hash));
		model.addAttribute("pageCount", pageCount);
		model.addAttribute("totalNum", (pageCount % 15 == 0 ? pageCount / 15 : pageCount / 15 + 1));
	}

	@Override
	public CustomerDTO customerList(Model model) {
		return null;
	}

	@Override
	public int chkList(Model model) {
		return 0;
	}

}
