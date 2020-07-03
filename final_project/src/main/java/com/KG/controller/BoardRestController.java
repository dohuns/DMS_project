package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RestController;

import com.KG.service.board.BoardService;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class BoardRestController {
	
	BoardService serv;
	
	
}
