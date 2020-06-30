package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {

	// 글 작성
	@RequestMapping("write")
	public String write() {
		return "board/write";
	}
}
