package com.KG.service.customer;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CustomerDAO;
import com.KG.dto.CustomerDTO;

@Service
public class CustomerMainServImpl implements CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	@Override
	public void execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession) map.get("session");
		String cus_id = (String) session.getAttribute("m_id");
		model.addAttribute("inquiryList", customerDAO.selectInquiry(cus_id));
	}

	@Override
	public CustomerDTO customerList(Model model) {
		return null;
	}

}
