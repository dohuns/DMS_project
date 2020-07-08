package com.KG.service.board;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.BoardDAO;
import com.KG.dto.BoardDTO;

@Service
public class BoaUserInfoServImpl implements BoardService {

	@Autowired
	BoardDAO boardDAO;
//	사이드바 유저 정보
	@Override
	public boolean execute_Boo(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		String m_nick = (String)session.getAttribute("m_nick");
		model.addAttribute("userInfo" , boardDAO.userInfo(m_nick));
		model.addAttribute("boardcount" , boardDAO.boardCount(m_nick));
		model.addAttribute("replycount" , boardDAO.replyCount(m_nick));
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
