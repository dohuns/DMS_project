package com.KG.service.customer;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CustomerDAO;
import com.KG.dto.CustomerDTO;

@Service
public class CustomerPwChkServImpl implements CustomerService {
	@Autowired
	CustomerDAO customerDAO;

	@Override
	public void execute(Model model) {
		
	}

	@Override
	public CustomerDTO customerList(Model model) {
		return null;
	}

	@Override
	public int chkList(Model model) {
		Map<String, Object> map = model.asMap();
		int cus_num = (Integer) map.get("cus_num");
		String inputPw = (String) map.get("inputPw");
		String dbPw = customerDAO.customerPwChk(cus_num);

		if(dbPw.equals(inputPw)) {
			return 1;
		} else {
			return 0;
		}
	}
}
