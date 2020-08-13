package com.KG.service.admin.member;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CustomerDAO;
import com.KG.dto.CustomerDTO;
import com.KG.service.customer.CustomerService;

@Service
public class AdminMainListServImpl implements CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	@Override
	public void execute(Model model) {
		// 답변 대기
		model.addAttribute("adminWaitList", customerDAO.adminMainList(0));
		// 답변 보류
		model.addAttribute("adminHoldList", customerDAO.adminMainList(2));
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
