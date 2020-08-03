package com.KG.service.board.sidebar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.service.board.BoardService;

@Service
public class BoaUserInfoServImpl implements BoardSidebarService {

	@Autowired
	BoardDAO boardDAO;
//	사이드바 유저 정보
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		
		String id = (String) map.get("id");
		
		model.addAttribute("userInfo" , boardDAO.userInfo(id));
		model.addAttribute("boardcount" , boardDAO.boardCount(id));
		model.addAttribute("replycount" , boardDAO.replyCount(id));
		return false;
	}

	@Override
	public String execute_Str(Model model) {
		return null;
	}

	@Override
	public int execute_Int(Model model) {
		return 0;
	}

	@Override
	public List<BoardDTO> execute_List(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

}
