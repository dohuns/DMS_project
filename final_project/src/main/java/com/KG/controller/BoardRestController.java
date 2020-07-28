package com.KG.controller;


import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.dto.CommentDTO;
import com.KG.dto.PhotoVo;
import com.KG.service.board.BoardDeleteServImpl;
import com.KG.service.board.BoardImageServImpl;
import com.KG.service.board.BoardService;
import com.KG.service.comment.CommentDeleteServImpl;
import com.KG.service.comment.CommentService;

@RestController
public class BoardRestController {
	BoardService boaServ;
	CommentService comServ;

//	내 작성글 삭제
	@RequestMapping(value = "myWriteDelete", produces = "application/json;charset=utf-8")
	public void myWriteDelete(Model model,BoardDTO dto) {
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

}


