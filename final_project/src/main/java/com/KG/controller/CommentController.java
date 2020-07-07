package com.KG.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.CommentDTO;
import com.KG.service.comment.CommentListServImpl;
import com.KG.service.comment.CommentSaveServImpl;
import com.KG.service.comment.CommentService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class CommentController {

	CommentService comServ;
	
	
	// 댓글 작성(저장)
	@PostMapping(value = "/board/comment_save",
				produces = "application/json; charset=UTF-8")
	public String comment_save(CommentDTO dto , Model model){
		
		model.addAttribute("dto" , dto);
		
		comServ = (CommentSaveServImpl)AC.ac.getBean("commentSaveServImpl");
		comServ.execute(model);
		
		return "";
	}
	
	// 댓글 불러오기
	@GetMapping(value = "/board/comment_list",
				produces = "application/json; charset=UTF-8")
	public String comment_list(CommentDTO dto, Model model) throws JsonProcessingException {
		
		model.addAttribute("dto", dto);
		comServ = (CommentListServImpl)AC.ac.getBean("commentListServImpl");
		List<CommentDTO> list = comServ.execute_list(model);
	
		ObjectMapper mapper = new ObjectMapper();
		
		return mapper.writeValueAsString(list);
	}
}
