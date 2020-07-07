package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoardService;

@RestController
public class BoardRestController {

	BoardService boaServ;
	
	@GetMapping("/board/testAjax")
	public String testAjax(Model model) {
		boaServ = (BoaListServImpl)AC.ac.getBean("boaListServImpl");
		boaServ.execute_Str(model);
		
		return "";
	}

}
