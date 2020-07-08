package com.KG.service.board;

import java.util.List;
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
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		
//		boardDAO.boardWrite(dto.getB_title() , dto.getB_content());
		
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

	@Override
	public List<BoardDTO> execute_List(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	

}
