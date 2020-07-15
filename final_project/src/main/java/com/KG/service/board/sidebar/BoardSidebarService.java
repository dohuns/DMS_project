package com.KG.service.board.sidebar;

import java.util.List;

import org.springframework.ui.Model;

import com.KG.dto.BoardDTO;

public interface BoardSidebarService {
	
	public boolean execute_Boo(Model model);
	public String execute_Str(Model model);
	public int execute_Int(Model model);
	public List<BoardDTO> execute_List(Model model);

}
