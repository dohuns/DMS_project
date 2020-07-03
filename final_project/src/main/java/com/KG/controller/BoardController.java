package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoardCateListServImpl;
import com.KG.service.board.BoardListServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.BoardWriteServImpl;

@Controller
public class BoardController {
	
	BoardService serv;
	
	
	// 게시글 목록
	@RequestMapping("/board/list")
	public String board_list(Model model , BoardDTO dto) {
		
		model.addAttribute("dto" , dto);
		
		serv = (BoardListServImpl)AC.ac.getBean("boardListServImpl");
		serv.execute(model);
		     
		return "board/list";
	}
	
	// 글쓰기 페이지
	@RequestMapping("/board/write")
	public String board_write(Model model , BoardDTO dto) {
		
		model.addAttribute("dto", dto);
		System.out.println("cate : " + dto.getB_category());
		System.out.println("arti : " + dto.getB_article());
		serv = (BoardCateListServImpl)AC.ac.getBean("boardCateListServImpl");
		serv.execute(model);
		return "board/write";
	}
	
	// 글쓰기 저장 
	@RequestMapping("/board/write_save")
	public String board_wrtieSave(Model model , BoardDTO dto) {
		
		model.addAttribute("dto" , dto);
		
		serv = (BoardWriteServImpl)AC.ac.getBean("boardWriteServImpl");
		serv.execute(model);
		
		return "redirect:/board/list";
	}
	
}
