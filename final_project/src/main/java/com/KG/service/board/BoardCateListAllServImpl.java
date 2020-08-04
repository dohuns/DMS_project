package com.KG.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;

@Service
public class BoardCateListAllServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public boolean execute_Boo(Model model) {
		model.addAttribute("cate" , boardDAO.cateListAll());
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		
		return "";
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}
	
	
	
	

}
