package com.KG.service.board.sidebar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;
import com.KG.service.board.BoardService;

@Service
public class BoaUserBoardListServImpl implements BoardSidebarService {

	@Autowired
	BoardDAO boardDAO;


//	내가 쓴 게시글 리스트 출력
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		String m_nick = (String)session.getAttribute("m_nick");
		System.out.println(boardDAO.userBoardList(m_nick));
		model.addAttribute("myList" , boardDAO.userBoardList(m_nick));
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
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		String m_nick = (String)session.getAttribute("m_nick");
		return boardDAO.userBoardList(m_nick);
	}

}
