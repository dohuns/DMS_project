package com.KG.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.dto.CommentDTO;
import com.KG.service.board.BoardDeleteServImpl;
import com.KG.service.board.BoardImageServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.DayBoxOfficeServImpl;
import com.KG.service.board.SearchMovieServImpl;
import com.KG.service.comment.CommentDeleteServImpl;
import com.KG.service.comment.CommentService;
import com.fasterxml.jackson.core.JsonProcessingException;

@RestController
public class BoardRestController {
	BoardService boaServ;
	CommentService comServ;

//	내 작성글 삭제
	@RequestMapping(value = "myWriteDelete", produces = "application/json;charset=utf-8")
	public void myWriteDelete(Model model,BoardDTO dto, HttpSession session) {
		model.addAttribute("session",session);
		model.addAttribute("dto",dto);
		boaServ = (BoardDeleteServImpl) AC.ac.getBean("boardDeleteServImpl");
		boaServ.execute_Boo(model);
	}

//	내 댓글 삭제
	@RequestMapping(value = "myComDelete", produces = "application/json;charset=utf-8")
	public void myComDelete(Model model,CommentDTO dto) {
		model.addAttribute("dto",dto);
		comServ = (CommentDeleteServImpl) AC.ac.getBean("commentDeleteServImpl");
		comServ.execute_int(model);
	}

	// 스마트 에디터 이미지 업로드
	@RequestMapping(value = "/multiplePhotoUpload" , produces = "application/json;charset=utf-8")
	public void multiplePhotoUpload(HttpServletRequest request, HttpServletResponse response, Model model) {

		model.addAttribute("request" , request);
		model.addAttribute("response" , response);

		boaServ = (BoardImageServImpl)AC.ac.getBean("boardImageServImpl");
		boaServ.execute_Boo(model);
	}
	
	// 일일 박스 오피스 가져오기
	@RequestMapping(value = "dayOffice" , produces = "application/json;charset=utf-8")
	public String dayOffice(Model model) {
		
		boaServ = (DayBoxOfficeServImpl)AC.ac.getBean("dayBoxOfficeServImpl");
		
		return boaServ.execute_Str(model);
	}
	
	// 포스터&링크 가져오기
	@RequestMapping(value = "searchMovie" , produces = "application/json;charset=utf-8")
	public String searchMovie(Model model , String movieNm) throws JsonProcessingException {

		model.addAttribute("movieNm" , movieNm);
		boaServ = (SearchMovieServImpl)AC.ac.getBean("searchMovieServImpl");
		
		
		return boaServ.execute_Str(model);
	}

}


