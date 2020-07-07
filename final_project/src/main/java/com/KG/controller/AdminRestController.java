package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.service.admin.AdminBoardArtInsServImpl;
import com.KG.service.admin.AdminBoardArtUpdServImpl;
import com.KG.service.admin.AdminBoardCatInsServImpl;
import com.KG.service.admin.AdminBoardCatUpdServImpl;
import com.KG.service.admin.AdminService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class AdminRestController {

	AdminService admServ;

//	category 추가
	@RequestMapping(value = "inscategory", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String inscategory(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardCatInsServImpl) AC.ac.getBean("adminBoardCatInsServImpl");
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
		return strJson;
	}

//	category 수정
	@RequestMapping(value = "updcategory", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updcategory(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardCatUpdServImpl) AC.ac.getBean("adminBoardCatUpdServImpl");
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
		return strJson;
	}

//	article 추가
	@RequestMapping(value = "insarticle", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insarticle(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardArtInsServImpl) AC.ac.getBean("adminBoardArtInsServImpl");
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
		return strJson;
	}

//	article 수정
	@RequestMapping(value = "updarticle", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updarticle(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardArtUpdServImpl) AC.ac.getBean("adminBoardArtUpdServImpl");
		ObjectMapper mapper = new ObjectMapper();
		String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
		return strJson;
	}

}
