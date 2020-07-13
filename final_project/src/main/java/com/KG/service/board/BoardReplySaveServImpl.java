package com.KG.service.board;

import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoardReplySaveServImpl implements BoardService{
	
	@Autowired
	BoardDAO dao;

	@Override
	public boolean execute_Boo(Model model) {
		
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO)map.get("dto");
		
		BoardDTO getDTO = dao.showBoard(dto.getB_num());
		
		HttpSession session = (HttpSession)map.get("session");
		dto.setB_id((String)session.getAttribute("m_id"));
		dto.setB_nick((String)session.getAttribute("m_nick"));
		dto.setB_reNum(getDTO.getB_reNum());
		dto.setB_sortNum(getDTO.getB_sortNum());
		
		dao.replySave(dto);
		
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

