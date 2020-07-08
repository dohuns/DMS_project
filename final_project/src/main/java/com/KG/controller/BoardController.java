package com.KG.controller;

import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoaCatListServImpl;
import com.KG.service.board.BoaUserInfoServImpl;
import com.KG.service.board.BoardCateListServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.BoardWriteServImpl;
import com.KG.service.member.MemberService;

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
//			유저 닉네임으로 회원정보 가져오기
			model.addAttribute("session", session);
			boaServ = (BoaUserInfoServImpl) AC.ac.getBean("boaUserInfoServImpl");
			boaServ.execute_Boo(model);
			boaServ.execute_Int(model);
		} catch (Exception e) {
		}
		try {
//			게시판 list 가져오기
			boaServ = (BoaCatListServImpl) AC.ac.getBean("boaListServImpl");
			boaServ.execute_Str(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "default/sidebar";
	}

	// 게시글 목록
	@RequestMapping("/board/list")
	public String board_list(Model model, BoardDTO dto) {

		model.addAttribute("dto", dto);
		boaServ = (BoaCatListServImpl) AC.ac.getBean("boaListServImpl");
		boaServ.execute_Boo(model);

		return "board/list";
	}

	// 글쓰기 페이지
	@RequestMapping("/board/write")
	public String board_write(Model model, BoardDTO dto) {

		model.addAttribute("dto", dto);
		System.out.println("cate : " + dto.getB_category());
		System.out.println("arti : " + dto.getB_article());
		boaServ = (BoardCateListServImpl) AC.ac.getBean("boardCateListServImpl");
		boaServ.execute_Boo(model);
		return "board/write";
	}

	// 글쓰기 저장
	@RequestMapping("/board/write_save")
	public String board_wrtieSave(Model model, BoardDTO dto) {

		model.addAttribute("dto", dto);
		boaServ = (BoardWriteServImpl) AC.ac.getBean("boardWriteServImpl");
		boaServ.execute_Boo(model);

		return "redirect:/board/list";
	}
}
