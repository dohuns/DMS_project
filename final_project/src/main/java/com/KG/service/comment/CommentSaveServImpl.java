package com.KG.service.comment;

import java.util.List;
import java.util.Map;

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
		
		dao.commentSave(dto);
		return false;
	}

	@Override
	public List<CommentDTO> execute_list(Model model) {
		// TODO Auto-generated method stub
		return null;
	}
	
	
}
