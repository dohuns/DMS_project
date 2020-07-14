package com.KG.service.board;

import org.springframework.ui.Model;

public interface BoardService {
	
	public boolean execute_Boo(Model model);
	public String execute_Str(Model model);
	public int execute_Int(Model model);

}
