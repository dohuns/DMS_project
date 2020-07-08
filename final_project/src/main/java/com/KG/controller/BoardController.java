package com.KG.controller;


import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoaUserInfoServImpl;
import com.KG.service.board.BoardCateListServImpl;
import com.KG.service.board.BoardModSaveServImpl;
import com.KG.service.board.BoardModifyServImpl;
import com.KG.service.board.BoardSearchServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.BoardShowServImpl;
import com.KG.service.board.BoardWriteServImpl;

@Controller
public class BoardController {
	
	BoardService boaServ;
	
	@RequestMapping("movie")
	public String movie() {
		return "movie/home";
	}
	   // 사이드바 출력
	   @RequestMapping("sidebar")
	   public String sidebar(Model model, HttpSession session) {
	      try {
//	         유저 닉네임으로 회원정보 가져오기
	         model.addAttribute("session", session);
	         boaServ = (BoaUserInfoServImpl) AC.ac.getBean("boaUserInfoServImpl");
	         boaServ.execute_Boo(model);
	         boaServ.execute_Int(model);
	      } catch (Exception e) {
	      }
	      try {
//	         게시판 list 가져오기
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
		public String board_wrtieSave(Model model , BoardDTO dto, HttpSession session) throws UnsupportedEncodingException {
			
			String category = URLEncoder.encode(dto.getB_category() , "UTF-8");
			String article = URLEncoder.encode(dto.getB_article(), "UTF-8");
			
			
			model.addAttribute("dto" , dto);
			model.addAttribute("session" , session);
			boaServ = (BoardWriteServImpl)AC.ac.getBean("boardWriteServImpl");
			boaServ.execute_Boo(model);
			
			return "redirect:/board/list?b_category="+category+"&b_article="+article;
		}
		
		// 게시글 검색
		@RequestMapping("/board/search_list")
		public String search_list(Model model, 
					@RequestParam("b_search") String b_search,
					@RequestParam("b_content") String b_content,
					BoardDTO dto) {
			model.addAttribute("b_search", b_search);
			model.addAttribute("b_content",b_content);
			model.addAttribute("dto", dto);
			
			boaServ = (BoardSearchServImpl)AC.ac.getBean("boardSearchServImpl");
			boaServ.execute_Boo(model);
			
			return "board/search";
		}
		
		// 게시글 보기
		@RequestMapping("/board/show")
		public String show(Model model, @RequestParam("b_num") int b_num) {
			
			model.addAttribute("b_num" , b_num);
			
			boaServ = (BoardShowServImpl)AC.ac.getBean("boardShowServImpl");
			boaServ.execute_Boo(model);
			
			return "board/show";
		}
		
		// 게시글 수정 페이지
		@RequestMapping("/board/modify") 
		public String modify(Model model, @RequestParam("c_num") int b_num) {
			
			model.addAttribute("num" , b_num);
			
			boaServ = (BoardModifyServImpl)AC.ac.getBean("boardModifyServImpl");
			boaServ.execute_Boo(model);
			
			return "board/modify";
		}
		
		// 게시글 수정
		@RequestMapping("/board/modify_save")
		public String modify_save(Model model, BoardDTO dto) {
			model.addAttribute("dto" , dto);
			
			boaServ = (BoardModSaveServImpl)AC.ac.getBean("boardModSaveServImpl");
			boaServ.execute_Boo(model);
			
			int num = dto.getB_num();
			return "redirect:/board/show?b_num=" + num;
		}
}
