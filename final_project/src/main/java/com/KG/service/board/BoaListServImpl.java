package com.KG.service.board;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;

@Service
public class BoaListServImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;

	@Override
	public boolean execute_Boo(Model model) {
		return false;
	}

//	사이드바 리스트 출력
	@Override
	public String execute_Str(Model model) {
		model.addAttribute("boardCate", boardDAO.categoryList());
		model.addAttribute("boardArt", boardDAO.articleList());
		System.out.println("list 페이지");
		return "성공";
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

}
