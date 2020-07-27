package com.KG.service.admin.member;

import org.springframework.ui.Model;

import com.KG.dto.MemberDTO;


public interface AdminService {

	public void execute(Model model);

	public MemberDTO memberList(Model model);
}
