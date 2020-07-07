package com.KG.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.KG.dto.BoardDTO;
import com.KG.service.admin.AdminBoardArtDelServImpl;
import com.KG.service.admin.AdminBoardArtUpdServImpl;
import com.KG.service.admin.AdminBoardCatDelServImpl;
import com.KG.service.admin.AdminBoardCatUpdServImpl;
import com.KG.service.admin.AdminChkListServImpl;
import com.KG.service.admin.AdminService;
import com.KG.service.board.BoaListServImpl;
import com.KG.service.board.BoardService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
public class AdminController {
	AdminService adminServ;
	BoardService boaServ;

	// 관리자 페이지 > 회원 목록
	@RequestMapping("admin")
	public String adminPage() {
		return "redirect:admin_chkList";
	}

	// 관리자 페이지 > 회원 목록 출력
	@RequestMapping("admin_chkList")
	public String adminChkList(Model model) {
		adminServ = (AdminChkListServImpl) AC.ac.getBean("adminChkListServImpl");
		adminServ.adminList(model);
		return "admin/memberList";
	}

	// 회원 관리
	@RequestMapping("management")
	public String manageList() {
		return "admin/manageList";
	}

	// 회원 관리 > 회원 추가
	@RequestMapping("insMember")
	public String insMember() {
		return "admin/insMember";
	}
	
	// 관리자페이지 > 게시판 목록
	@RequestMapping("boardList")
	public String boardList(Model model) {
		try {
//			게시판 list 가져오기
			boaServ = (BoaListServImpl) AC.ac.getBean("boaListServImpl");
			boaServ.execute_Str(model);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "admin/boardList";
	}
	
	
//	category 삭제
	@RequestMapping("delcategory")
	public String delcategory(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO",boardDTO);
		adminServ = (AdminBoardCatDelServImpl) AC.ac.getBean("adminBoardCatDelServImpl");
		adminServ.execute_Str(model);
		return "redirect:boardList";
	}
	
//	article 삭제
	@RequestMapping("delarticle")
	public String delarticle(Model model, BoardDTO boardDTO) throws JsonProcessingException {
		model.addAttribute("boardDTO",boardDTO);
		adminServ = (AdminBoardArtDelServImpl) AC.ac.getBean("adminBoardArtDelServImpl");
		adminServ.execute_Str(model);
		return "redirect:boardList";
	}
}
