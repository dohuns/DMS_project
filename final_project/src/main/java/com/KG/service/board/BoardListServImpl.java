package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoardListServImpl implements BoardService{

	@Autowired
	BoardDAO dao;
	
	@Override
	public boolean execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("dto");
		
		model.addAttribute("list" , dao.list(dto));
		
		return false;
	}
	
}
