package com.KG.service.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

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
		BoardDTO boardDTO = (BoardDTO) map.get("dto");
		HttpSession session = (HttpSession)map.get("session");
		
		boardDTO.setB_nick((String)session.getAttribute("m_nick"));
		boardDTO.setB_id((String)session.getAttribute("m_id"));
		
		boardDAO.boardWrite(boardDTO);
		
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
