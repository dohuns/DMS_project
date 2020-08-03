package com.KG.service.customer;

import org.springframework.ui.Model;

import com.KG.dto.CustomerDTO;

public interface CustomerService {

	public void execute(Model model);

	public CustomerDTO customerList(Model model);

	public int chkList(Model model);
}
