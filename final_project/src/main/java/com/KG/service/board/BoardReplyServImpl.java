package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoardReplyServImpl implements BoardService{

	@Autowired
	BoardDAO dao;

	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		BoardDTO dto =(BoardDTO) map.get("dto");
		
		model.addAttribute("boardInfo" , dao.showBoard(dto.getB_num()));
		
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
