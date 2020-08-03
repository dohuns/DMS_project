package com.KG.service.comment;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.KG.dao.CommentDAO;
import com.KG.dto.CommentDTO;

@Service
public class CommentCountServImpl implements CommentService{

	@Autowired
	CommentDAO dao;
	
	@Override
	public boolean execute(Model model) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<Map<String, Object>> execute_list(Model model) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public int execute_int(Model model) {
		
		Map<String, Object> map = model.asMap();
		CommentDTO dto = (CommentDTO)map.get("dto");
		
		return dao.getCount(dto);
	}
	

}
