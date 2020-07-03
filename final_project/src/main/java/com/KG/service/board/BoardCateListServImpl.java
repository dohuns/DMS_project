package com.KG.service.board;

import java.util.List;
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
	public boolean execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		BoardDTO dto = (BoardDTO) map.get("dto");
		
		System.out.println("cate : " + dto.getB_category());
		
		List<BoardDTO> list = boardDAO.cateList(dto);
		for(BoardDTO dto2 : list) {
			System.out.println("ser : " + dto2.getB_article());
		}
		
		
		model.addAttribute("cate" , boardDAO.cateList(dto));
		
		return false;
	}
	
	

}
