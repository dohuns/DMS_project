package com.KG.service.board;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;

@Service
public class BoardSearchServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		String b_search = (String)map.get("b_search");
		String b_content = (String)map.get("b_content");
		System.out.println("con : " + b_content);
		if(b_search.equals("title&content")) {
			model.addAttribute("searchList", boardDAO.TCsearch(b_content));
		} else if (b_search.equals("title")) {
//			boardDAO.Tsearch(b_content);
		} else {
//			boardDAO.Wsearch(b_content);
		}
		
		
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}
	
}
