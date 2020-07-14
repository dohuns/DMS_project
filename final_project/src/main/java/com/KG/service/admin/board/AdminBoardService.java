package com.KG.service.admin.board;

import org.springframework.ui.Model;

public interface AdminBoardService {

	// 회원 전체 목록
	public void adminList(Model model);
	public boolean execute_Boo(Model model);
	public String execute_Str(Model model);
	public int execute_Int(Model model);
}
