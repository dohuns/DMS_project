package com.KG.controller;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.dto.CommentDTO;
import com.KG.dto.LikeDTO;
import com.KG.service.board.AddLikeServImpl;
import com.KG.service.board.AddUnlikeServImpl;
import com.KG.service.board.BoardDeleteServImpl;
import com.KG.service.board.BoardImageServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.board.ChklikeServImpl;
import com.KG.service.board.DayBoxOfficeServImpl;
import com.KG.service.board.LikeMemberListServImpl;
import com.KG.service.board.RemoveLikeServImpl;
import com.KG.service.board.RemoveUnlikeServImpl;
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
	
	// 추천 버튼 눌렀을 때
	@PostMapping(value = "/board/addLike" , produces = "application/json;charset=utf-8")
	public int addLike(Model model , LikeDTO dto) {
		
		model.addAttribute("dto" , dto);
		
		boaServ = (AddLikeServImpl)AC.ac.getBean("addLikeServImpl");
		
		return boaServ.execute_Int(model);
	}
	
	// 비추천 버튼 눌렀을 때 
	@PostMapping(value = "/board/addUnlike" , produces = "application/json;charset=utf-8")
	public int addUnlike(Model model , LikeDTO dto) {
		
		model.addAttribute("dto" , dto);
		
		boaServ = (AddUnlikeServImpl)AC.ac.getBean("addUnlikeServImpl");
		
		return boaServ.execute_Int(model);
	}
	
	// 추천 버튼을 취소 
	@DeleteMapping(value = "/board/removeLike" , produces = "application/json;charset=utf-8")
	public int removeLike(Model model , LikeDTO dto) {
		
		model.addAttribute("dto" , dto);
		
		boaServ = (RemoveLikeServImpl)AC.ac.getBean("removeLikeServImpl");
		
		return boaServ.execute_Int(model);
	}
	
	// 비추천 버튼을 취소
	@DeleteMapping(value = "/board/removeUnlike" , produces = "application/json;charset=utf-8")
	public int removeUnlike(Model model, LikeDTO dto) {
		
		model.addAttribute("dto" , dto);
		
		boaServ = (RemoveUnlikeServImpl)AC.ac.getBean("removeUnlikeServImpl");
		
		return boaServ.execute_Int(model);
	}
	
	// 추천 비추천 누른지 확인
	@PostMapping(value = "/board/chkLike" , produces = "application/json;charset=utf-8")
	public String divLike(Model model, LikeDTO dto) {
		model.addAttribute("dto" , dto);
		
		boaServ = (ChklikeServImpl)AC.ac.getBean("chklikeServImpl");
		
		return boaServ.execute_Str(model);
	}
	
	// 추천 비추천 리스트 띄워주기
	@PostMapping(value = "/board/likeMemberList", produces = "application/json;charset=utf-8")
	public String likeMemberList(Model model, int b_num) {
		model.addAttribute("b_num" , b_num);
		
		boaServ = (LikeMemberListServImpl)AC.ac.getBean("likeMemberListServImpl");
		
		return boaServ.execute_Str(model);
	}

}


