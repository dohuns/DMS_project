package com.KG.controller;

import java.util.List;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;

import com.KG.dto.BoardDTO;
import com.KG.dto.MemberDTO;
import com.KG.service.admin.board.AdminBoardArtChkServImpl;
import com.KG.service.admin.board.AdminBoardArtDelServImpl;
import com.KG.service.admin.board.AdminBoardArtInsServImpl;
import com.KG.service.admin.board.AdminBoardArtOrdServImpl;
import com.KG.service.admin.board.AdminBoardArtUpdServImpl;
import com.KG.service.admin.board.AdminBoardCatChkServImpl;
import com.KG.service.admin.board.AdminBoardCatDelServImpl;
import com.KG.service.admin.board.AdminBoardCatInsServImpl;
import com.KG.service.admin.board.AdminBoardCatOrdServImpl;
import com.KG.service.admin.board.AdminBoardCatUpdServImpl;
import com.KG.service.admin.board.AdminBoardService;
import com.KG.service.admin.member.AdminSelectServImpl;
import com.KG.service.admin.member.AdminService;
import com.KG.service.board.BoardService;
import com.KG.service.board.sidebar.BoaArtListServImpl;
import com.KG.service.board.sidebar.BoaCatListServImpl;
import com.KG.service.board.sidebar.BoardSidebarService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@RestController
public class AdminRestController {

	AdminService adminServ;
	AdminBoardService admServ;
	BoardService boaServ;
	BoardSidebarService boaSideServ;

	/////////////////////////////////////////////////////////////////////////////////////
	// 회원 관리 > 수정
	@GetMapping(value = "updateMember", produces = "application/json; charset=UTF-8")
	public MemberDTO updateMember(Model model, String m_id) {
		model.addAttribute("m_id", m_id);
		adminServ = (AdminSelectServImpl) AC.ac.getBean("adminSelectServImpl");
		return adminServ.memberList(model);
	}
	/////////////////////////////////////////////////////////////////////////////////////
	
//	boardList 출력
	@RequestMapping(value = "cateList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String cateList(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		boaSideServ = (BoaCatListServImpl) AC.ac.getBean("boaCatListServImpl");
		String strJson = mapper.writeValueAsString(boaSideServ.execute_List(model));
		return strJson;
	}

//	boardList 출력
	@RequestMapping(value = "artList", produces = "application/json;charset=utf-8")
	@ResponseBody
	public String artList(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		ObjectMapper mapper = new ObjectMapper();
		boaSideServ = (BoaArtListServImpl) AC.ac.getBean("boaArtListServImpl");
		String strJson = mapper.writeValueAsString(boaSideServ.execute_List(model));
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
		System.out.println("카테고리 :"+boardDTO.getB_title());
		System.out.println("변경할 카테고리 :"+boardDTO.getB_category());
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
	
//	category 순서 저장
	@RequestMapping(value = "ordercategory", produces = "application/json;charset=utf-8")
	public void ordercategory(Model model, BoardDTO boardDTO){
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardCatOrdServImpl) AC.ac.getBean("adminBoardCatOrdServImpl");
		admServ.execute_Boo(model);
	}
	
//	article 순서 저장
	@RequestMapping(value = "orderarticle", produces = "application/json;charset=utf-8")
	public void orderarticle(Model model, BoardDTO boardDTO){
		model.addAttribute("boardDTO", boardDTO);
		admServ = (AdminBoardArtOrdServImpl) AC.ac.getBean("adminBoardArtOrdServImpl");
		admServ.execute_Boo(model);
	}

}
