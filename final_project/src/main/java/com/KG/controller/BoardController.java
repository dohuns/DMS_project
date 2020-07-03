package com.KG.controller;


import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoardService;

@Controller
public class BoardController {
	
	BoardService boaServ;
	
	@RequestMapping("movie")
	public String movie() {
		return "movie/home";
	}
	//사이드바 출력
	@RequestMapping("sidebar")
	public String sidebar(Model model, BoardDTO boardDTO) {
		try {
			boaServ = (BoaListServImpl) AC.ac.getBean("boaListServImpl");
			boaServ.execute_Str(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "default/sidebar";
	}
}
