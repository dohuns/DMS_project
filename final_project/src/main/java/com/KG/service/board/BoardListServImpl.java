package com.KG.service.board;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;

@Service
public class BoardListServImpl implements BoardService{

	BoardDAO dao;
	
	@Override
	public boolean execute(Model model) {
		
//		model.addAttribute("list" , dao.list());
		
		return false;
	}
	
}
