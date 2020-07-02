package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.service.board.BoardListServImpl;
import com.KG.service.board.BoardService;

@Controller
public class BoardController {
	
	BoardService serv;
	
	// 영화 메인 페이지
	@RequestMapping("/movie")
	public String movie() {
		return "movie/home";
	}
	
	// 게시글 목록
	@RequestMapping("/movie/movie_list")
	public String movie_list(Model model) {
		
		
		serv = (BoardListServImpl)AC.ac.getBean("movieListServImpl");
		
		     
		return "movie/list";
	}
	
}
