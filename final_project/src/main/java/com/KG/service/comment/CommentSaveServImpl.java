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
public class CommentSaveServImpl  implements CommentService{

	@Autowired
	CommentDAO dao;
	
	@Override
	public boolean execute(Model model) {
		
		Map<String, Object> map = model.asMap();
		CommentDTO dto = (CommentDTO)map.get("dto");
		HttpSession session = (HttpSession)map.get("session");
		
		dto.setC_nick((String)session.getAttribute("m_nick"));
		dto.setC_id((String)session.getAttribute("m_id"));
		
		dao.commentSave(dto);
		dao.upComCount(dto.getC_boardNum());
		return false;
	}

	@Override
	public List<Map<String, Object>> execute_list(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_int(Model model) {
		// TODO Auto-generated method stub
		return 0;
	}
	
	
}
