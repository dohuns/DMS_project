package com.KG.controller;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.service.admin.AdminBoardArtChkServImpl;
import com.KG.service.admin.AdminBoardArtDelServImpl;
import com.KG.service.admin.AdminBoardArtInsServImpl;
import com.KG.service.admin.AdminBoardArtUpdServImpl;
import com.KG.service.admin.AdminBoardCatChkServImpl;
import com.KG.service.admin.AdminBoardCatDelServImpl;
import com.KG.service.admin.AdminBoardCatInsServImpl;
import com.KG.service.admin.AdminBoardCatUpdServImpl;
import com.KG.service.admin.AdminService;
import com.KG.service.board.BoaArtListServImpl;
import com.KG.service.board.BoaCatListServImpl;
import com.KG.service.board.BoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class AdminRestController {

	AdminService admServ;
	BoardService boaServ;

//	boardList 출력
	@RequestMapping(value = "cateList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String cateList(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		boaServ = (BoaCatListServImpl) AC.ac.getBean("boaCatListServImpl");
		String strJson = mapper.writeValueAsString(boaServ.execute_List(model));
		return strJson;
	}

//	boardList 출력
	@RequestMapping(value = "artList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String artList(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		boaServ = (BoaArtListServImpl) AC.ac.getBean("boaArtListServImpl");
		String strJson = mapper.writeValueAsString(boaServ.execute_List(model));
		return strJson;
	}

//	category 추가
	@RequestMapping(value = "inscategory", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String inscategory(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();

		model.addAttribute("boardDTO", boardDTO);

		admServ = (AdminBoardCatChkServImpl) AC.ac.getBean("adminBoardCatChkServImpl");

		if (admServ.execute_Boo(model) == true) {
			admServ = (AdminBoardCatInsServImpl) AC.ac.getBean("adminBoardCatInsServImpl");
			String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
			return strJson;
		}
		return null;
	}

//	category 수정
	@RequestMapping(value = "updcategory", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updcategory(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();

		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardCatChkServImpl) AC.ac.getBean("adminBoardCatChkServImpl");

		if (admServ.execute_Boo(model) == true) {
			admServ = (AdminBoardCatUpdServImpl) AC.ac.getBean("adminBoardCatUpdServImpl");
			String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
			return strJson;
		}
		return null;

	}

//	category 삭제
	@RequestMapping(value = "delcategory", produces = "application/json;charset=utf-8")
	@ResponseBody
	public void delcategory(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardCatDelServImpl) AC.ac.getBean("adminBoardCatDelServImpl");
		admServ.execute_Str(model);
	}

//	article 추가
	@RequestMapping(value = "insarticle", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String insarticle(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();

		model.addAttribute("boardDTO", boardDTO);

		admServ = (AdminBoardArtChkServImpl) AC.ac.getBean("adminBoardArtChkServImpl");

		if (admServ.execute_Boo(model) == true) {
			admServ = (AdminBoardArtInsServImpl) AC.ac.getBean("adminBoardArtInsServImpl");
			String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
			return strJson;
		}
		return null;
	}

//	article 수정
	@RequestMapping(value = "updarticle", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String updarticle(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();

		model.addAttribute("boardDTO", boardDTO);

		admServ = (AdminBoardArtChkServImpl) AC.ac.getBean("adminBoardArtChkServImpl");

		if (admServ.execute_Boo(model) == true) {
			admServ = (AdminBoardArtUpdServImpl) AC.ac.getBean("adminBoardArtUpdServImpl");
			String strJson = mapper.writeValueAsString(admServ.execute_Str(model));
			return strJson;
		}
		return null;
	}

//	article 삭제
	@RequestMapping(value = "delarticle", produces = "application/json;charset=utf-8")
	public void delarticle(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardArtDelServImpl) AC.ac.getBean("adminBoardArtDelServImpl");
		admServ.execute_Str(model);
	}

}
