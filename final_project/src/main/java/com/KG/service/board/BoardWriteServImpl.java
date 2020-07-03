package com.KG.service.board;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
@Service
public class BoardWriteServImpl implements BoardService{

	@Autowired
	BoardDAO boardDAO;
	
	@Override
	public boolean execute(Model model) {

		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("dto");
		
//		boardDAO.boardWrite(dto.getB_title() , dto.getB_content());
		
		return false;
	}
	
	

}
