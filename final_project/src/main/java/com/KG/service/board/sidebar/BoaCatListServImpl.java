package com.KG.service.board.sidebar;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.service.board.BoardService;

@Service
public class BoaCatListServImpl implements BoardSidebarService {

	@Autowired
	BoardDAO boardDAO;


//	사이드바 리스트 출력
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		BoardDTO boardDTO = (BoardDTO) map.get("boardDTO");
		model.addAttribute("list" , boardDAO.sidebarlist(boardDTO));
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		model.addAttribute("boardCate", boardDAO.categoryList());
		model.addAttribute("boardArt", boardDAO.articleList());
		return "성공";
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

	@Override
	public List<BoardDTO> execute_List(Model model) {
		return boardDAO.categoryList();
	}

}
