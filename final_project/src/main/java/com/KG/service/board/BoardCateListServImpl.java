package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoardCateListServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("boardDTO");
		
		
		model.addAttribute("cate" , boardDAO.cateList(dto));
		
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}
	
	

}
