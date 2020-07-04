package com.KG.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoardCateListServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.BoardWriteServImpl;

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
	
	// 게시글 목록
		@RequestMapping("/board/list")
		public String board_list(Model model , BoardDTO dto) {
			
			model.addAttribute("dto" , dto);
			boaServ = (BoaListServImpl)AC.ac.getBean("boaListServImpl");
			boaServ.execute_Boo(model);
			     
			return "board/list";
		}
		
		// 글쓰기 페이지
		@RequestMapping("/board/write")
		public String board_write(Model model , BoardDTO dto) {
			
			model.addAttribute("dto", dto);
			boaServ = (BoardCateListServImpl)AC.ac.getBean("boardCateListServImpl");
			boaServ.execute_Boo(model);
			return "board/write";
		}
		
		// 글쓰기 저장 
		@RequestMapping("/board/write_save")
		public String board_wrtieSave(Model model , BoardDTO dto) throws UnsupportedEncodingException {
			
			String category = URLEncoder.encode(dto.getB_category() , "UTF-8");
			String article = URLEncoder.encode(dto.getB_article(), "UTF-8");
			
			
			model.addAttribute("dto" , dto);
			boaServ = (BoardWriteServImpl)AC.ac.getBean("boardWriteServImpl");
			boaServ.execute_Boo(model);
			
			return "redirect:/board/list?b_category="+category+"&b_article="+article;
		}
}
