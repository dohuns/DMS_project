package com.KG.service.board;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoaCatListServImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
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
		return boardDAO.categoryList();
	}

}