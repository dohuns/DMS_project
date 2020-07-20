package com.KG.service.comment;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CommentDAO;
import com.KG.dto.CommentDTO;

@Service
public class ComListServImpl implements CommentService{

	@Autowired
	CommentDAO dao;

	@Override
	public boolean execute(Model model) {
		Map<String, Object> map = model.asMap();
		HttpSession session = (HttpSession)map.get("session");
		String c_nick = (String)session.getAttribute("m_nick");
		model.addAttribute("myComList" , dao.selectNick(c_nick));
		return false;
	}

	@Override
	public List<CommentDTO> execute_list(Model model) {
		return null;
	}

	@Override
	public int execute_int(Model model) {
		return 0;
	}

	
	
}
