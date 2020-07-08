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
import com.KG.service.board.BoaCatListServImpl;
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
		return "admin/boardList";
	}

}
