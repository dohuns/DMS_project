package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping("movie")
	public String movie() {
		return "movie/home";
	}
}
