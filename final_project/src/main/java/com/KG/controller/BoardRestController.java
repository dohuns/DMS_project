package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoardService;

@RestController
public class BoardRestController {

	BoardService boaServ;

//	// 사이드바 출력
//	@RequestMapping("sidebar")
//	@ResponseBody
//	public void sidebar(Model model, BoardDTO boardDTO) {
//		boaServ = (BoaListServImpl) AC.ac.getBean("boaListServImpl");
//		boaServ.execute_Str(model);
//	}
}
