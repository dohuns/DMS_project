package com.KG.controller;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.KG.dto.BoardDTO;
import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoardCateListServImpl;
import com.KG.service.board.BoardDeleteServImpl;
import com.KG.service.board.BoardFileDownServImpl;
import com.KG.service.board.BoardModSaveServImpl;
import com.KG.service.board.BoardModifyServImpl;
import com.KG.service.board.BoardReplySaveServImpl;
import com.KG.service.board.BoardReplyServImpl;
import com.KG.service.board.BoardSearchServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.BoardShowHitServImpl;
import com.KG.service.board.BoardShowServImpl;
import com.KG.service.board.BoardWriteServImpl;
import com.KG.service.board.sidebar.BoaCatListServImpl;
import com.KG.service.board.sidebar.BoaMyInfoServImpl;
import com.KG.service.board.sidebar.BoaUserBoardListServImpl;
import com.KG.service.board.sidebar.BoaUserInfoServImpl;
import com.KG.service.board.sidebar.BoardSidebarService;
import com.KG.service.comment.ComBoardListServImpl;
import com.KG.service.comment.ComListServImpl;
import com.KG.service.comment.CommentService;

@Controller
public class BoardController {

	BoardService boaServ;
	BoardSidebarService boaSideServ;
	CommentService comServ;
	
	@RequestMapping("movie")
	public String movie() {
		return "default/movieMain";
	}

	// 사이드바 출력
		@RequestMapping("sidebar")
		public String sidebar(Model model, HttpSession session) {
			try {
//		         유저 닉네임으로 회원정보 가져오기
				model.addAttribute("session", session);
				boaSideServ = (BoaMyInfoServImpl) AC.ac.getBean("boaMyInfoServImpl");
				boaSideServ.execute_Boo(model);
			} catch (Exception e) {
			}
			try {
//		         게시판 list 가져오기
				boaSideServ = (BoaCatListServImpl) AC.ac.getBean("boaCatListServImpl");
				boaSideServ.execute_Str(model);
			} catch (Exception e) {
				e.printStackTrace();
			}
			return "default/sidebar";
		}

		// 내가 쓴글 틀
		@RequestMapping("myList")
		public String myList(Model model, HttpSession session, HttpServletRequest request) {
			try {
//		         유저 닉네임으로 회원정보 가져오기
				model.addAttribute("id", request.getParameter("id"));
				model.addAttribute("session", session);
				boaSideServ = (BoaUserInfoServImpl) AC.ac.getBean("boaUserInfoServImpl");
				boaSideServ.execute_Boo(model);
			} catch (Exception e) {
			}
			return "board/myList";
		}
		
		// 내가 쓴 게시글 목록
		@RequestMapping("myWrite")
		public String myWrite(Model model, HttpSession session, BoardDTO boardDTO, HttpServletRequest request) {
			try {
//		         유저 닉네임으로 게시글 가져오기
				model.addAttribute("id", request.getParameter("id"));
				model.addAttribute("session", session);
				model.addAttribute("boardDTO", boardDTO);
				boaSideServ = (BoaUserBoardListServImpl) AC.ac.getBean("boaUserBoardListServImpl");
				boaSideServ.execute_Boo(model);
			} catch (Exception e) {
			}
			return "board/myWrite";
		}
		
		// 내가 쓴 댓글 목록
		@RequestMapping("myReply")
		public String myReply(Model model, HttpSession session, BoardDTO boardDTO, HttpServletRequest request) {
			try {
//		         유저 닉네임으로 게시글 가져오기
				model.addAttribute("id", request.getParameter("id"));
				model.addAttribute("session", session);
				model.addAttribute("boardDTO", boardDTO);
				comServ = (ComListServImpl) AC.ac.getBean("comListServImpl");
				comServ.execute(model);
			} catch (Exception e) {
			}
			return "board/myReply";
		}
		
		// 내가 쓴 댓글 게시글 목록
		@RequestMapping("myReplyWrite")
		public String myReplyWrite(Model model, HttpSession session, BoardDTO boardDTO, HttpServletRequest request) {
			try {
				model.addAttribute("id", request.getParameter("id"));
				model.addAttribute("session", session);
				model.addAttribute("boardDTO", boardDTO);
				comServ = (ComBoardListServImpl) AC.ac.getBean("comBoardListServImpl");
				comServ.execute(model);
			} catch (Exception e) {
			}
			return "board/myReplyWrite";
		}

//=======================================================================================	
	// 게시글 목록
	@RequestMapping("/board/list")
	public String board_list(Model model, BoardDTO dto) {

		model.addAttribute("dto", dto);
		boaServ = (BoaListServImpl) AC.ac.getBean("boaListServImpl");
		boaServ.execute_Boo(model);

		return "board/list";
	}

	// 글쓰기 페이지
	@RequestMapping("/board/write")
	public String board_write(Model model, BoardDTO dto) {

		model.addAttribute("dto", dto);
		boaServ = (BoardCateListServImpl) AC.ac.getBean("boardCateListServImpl");
		boaServ.execute_Boo(model);
		return "board/write";
	}
	// 글쓰기 저장
	@RequestMapping("/board/write_save")
	public String board_wrtieSave(Model model, BoardDTO dto,
			HttpSession session , MultipartHttpServletRequest mpRequest,
			HttpServletRequest request, HttpServletResponse response) throws UnsupportedEncodingException {

		String category = URLEncoder.encode(dto.getB_category(), "UTF-8");
		String article = URLEncoder.encode(dto.getB_article(), "UTF-8");

		model.addAttribute("dto", dto);
		model.addAttribute("session", session);
		model.addAttribute("mpRequest" , mpRequest);
		model.addAttribute("request" , request); 
		model.addAttribute("response" , response);
		
		boaServ = (BoardWriteServImpl) AC.ac.getBean("boardWriteServImpl");
		boaServ.execute_Boo(model);

		return "redirect:/board/list?b_category=" + category + "&b_article=" + article;
	}

	// 게시글 검색
	@RequestMapping("/board/search_list")
	public String search_list(Model model, @RequestParam("b_search") String b_search,
			@RequestParam("b_content") String b_content, BoardDTO dto) {
		model.addAttribute("b_search", b_search);
		model.addAttribute("b_content", b_content);
		model.addAttribute("dto", dto);

		boaServ = (BoardSearchServImpl) AC.ac.getBean("boardSearchServImpl");
		boaServ.execute_Boo(model);

		return "board/search";
	}

	// 게시글 보기
		@RequestMapping("/board/show")
		public String show(Model model, @RequestParam("b_num") int b_num, HttpServletResponse response,
				HttpServletRequest request, HttpSession session) {
			model.addAttribute("b_num", b_num);

			String m_id = (String) session.getAttribute("m_id");
			String cook = b_num + m_id;

//			조회수 증가
			int hit = 0;
			// 저장된 쿠키 불러오기
			Cookie[] cookies = request.getCookies();
			if (request.getCookies() != null) {
				for (int i = 0; i < cookies.length; i++) {
					Cookie cookieCk = cookies[i];
					if (cookieCk.getName().equals(cook)) {
						hit = 1;
					}
				}
			}
			if (hit == 0) {
				Cookie cookie = new Cookie(b_num + m_id, b_num + m_id);
				cookie.setMaxAge(60 * 60 * 24);
				response.addCookie(cookie);
				boaServ = (BoardShowHitServImpl) AC.ac.getBean("boardShowHitServImpl");
				boaServ.execute_Boo(model);
			}
			boaServ = (BoardShowServImpl) AC.ac.getBean("boardShowServImpl");
			boaServ.execute_Boo(model);

			return "board/show";
		}

	// 게시글 수정 페이지
	@RequestMapping("/board/modify")
	public String modify(Model model, @RequestParam("c_boardNum") int b_num) {

		model.addAttribute("num", b_num);

		boaServ = (BoardModifyServImpl) AC.ac.getBean("boardModifyServImpl");
		boaServ.execute_Boo(model);

		return "board/modify";
	}

	// 게시글 수정
	@RequestMapping("/board/modify_save")
	public String modify_save(Model model, BoardDTO dto, 
			@RequestParam("fileNoDel[]") String[] files , 
			@RequestParam("fileNameDel[]") String[] fileNames , 
			MultipartHttpServletRequest request , 
			HttpSession session) {
		model.addAttribute("dto", dto);
		model.addAttribute("files" , files);
		model.addAttribute("fileNames" , fileNames);
		model.addAttribute("request" , request);
		model.addAttribute("session" , session);
		
		boaServ = (BoardModSaveServImpl) AC.ac.getBean("boardModSaveServImpl");
		boaServ.execute_Boo(model);

		int num = dto.getB_num();
		return "redirect:/board/show?b_num=" + num;
	}

	// 게시글 삭제
	@RequestMapping("/board/delete")
	public String delete(Model model, BoardDTO dto , HttpSession session) throws UnsupportedEncodingException {

		model.addAttribute("dto", dto);
		model.addAttribute("session" , session);
		
		String category = URLEncoder.encode(dto.getB_category(), "UTF-8");
		String article = URLEncoder.encode(dto.getB_article(), "UTF-8");

		boaServ = (BoardDeleteServImpl) AC.ac.getBean("boardDeleteServImpl");
		boaServ.execute_Boo(model);

		return "redirect:/board/list?b_category=" + category + "&b_article=" + article;
	}

	// 답글 쓰기 페이지
	@RequestMapping("/board/reply")
	public String reply(Model model, BoardDTO dto) {

		model.addAttribute("dto", dto);

		boaServ = (BoardReplyServImpl) AC.ac.getBean("boardReplyServImpl");
		boaServ.execute_Boo(model);
		return "board/reply";
	}

	// 답글 쓰기 저장
	@RequestMapping("/board/reply_save")
	public String reply_save(Model model, BoardDTO dto, HttpSession session) throws UnsupportedEncodingException {

		model.addAttribute("dto", dto);
		model.addAttribute("session", session);

		boaServ = (BoardReplySaveServImpl) AC.ac.getBean("boardReplySaveServImpl");
		boaServ.execute_Boo(model);

		String category = URLEncoder.encode(dto.getB_category(), "UTF-8");
		String article = URLEncoder.encode(dto.getB_article(), "UTF-8");

		return "redirect:/board/list?b_category=" + category + "&b_article=" + article;
	}
	
	// 첨부파일 다운로드
	@RequestMapping("/board/file_down")
	public void file_down(Model model , HttpServletResponse response , 
			@RequestParam("f_no") int f_no, 
			@RequestParam("f_id") String f_id) {
		
		model.addAttribute("response" , response);
		model.addAttribute("f_no" , f_no);
		model.addAttribute("f_id" , f_id);
		
		boaServ = (BoardFileDownServImpl) AC.ac.getBean("boardFileDownServImpl");
		boaServ.execute_Boo(model);
		
	}
}
